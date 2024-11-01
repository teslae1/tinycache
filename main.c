#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include "hashtable.c"

#pragma comment(lib, "ws2_32.lib")
#define BUFFER_SIZE 2048
#define HTTP_VERSION "HTTP/1.1"
#define PORT 8001

char* readBody(char *buffer, int bytes_read){
    int content_length = 0;
    //split buffer into string seperated by \r\n
    char *header = strtok(strdup(buffer), "\r\n");
    char *secondLastRead;
    while(header != NULL && header[0] != '\0'){
        if(strncmp(header, "Content-Length:", 15) == 0){
            content_length = atoi(header + 15);
        }
        //get the next token seperated by \r\n from the current header
        secondLastRead = header;
        header = strtok(NULL, "\r\n");
    }
    if(content_length == 0){
        return NULL;
    }
    return secondLastRead;
}

int sendOKresponse(SOCKET client_socket, char* bodyStr){
    char http_header[2048];
    sprintf(http_header, "%s 200 OK\r\nContent-Type: application/json\r\nContent-Length: %d\r\n\r\n%s", HTTP_VERSION, (int)strlen(bodyStr), bodyStr);
    int iResult;
    iResult = send(client_socket, http_header, strlen(http_header), 0);
    return iResult;
}

typedef struct{
    int result;
    SOCKET server_socket;
} serverSetup;

serverSetup* setupServerListen(int port){
    serverSetup *setup = (serverSetup*)malloc (sizeof(serverSetup));
    setup->result = 0;
    WSADATA wsaData;
    setup->result = WSAStartup(MAKEWORD(2, 2), &wsaData);
    if(setup->result != 0){
        printf("WSAStartup failed: %d\n", WSAGetLastError());
        WSACleanup();
        return setup;
    }

    setup->server_socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if(setup->server_socket == INVALID_SOCKET){
        printf("Socket creation failed: %d\n", WSAGetLastError());
        WSACleanup();
        return setup;
    }

    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(port);
    server_address.sin_addr.s_addr = INADDR_ANY;

    setup->result = bind(setup->server_socket, (struct sockaddr*)&server_address, sizeof(server_address));
    if(setup->result == SOCKET_ERROR){
        printf("Bind failed: %d\n", WSAGetLastError());
        WSACleanup();
        return setup;
    }

    setup->result = listen(setup->server_socket, SOMAXCONN);
    if(setup->result == SOCKET_ERROR){
        printf("Listen failed: %d\n", WSAGetLastError());
        closesocket(setup->server_socket);
        WSACleanup();
        return setup;
    }

    return setup;
}

typedef struct {
    int result;
    char* method;
    char* path;
    char* version;
    char* buffer;
    int bytes_read;
} clientRequest;

clientRequest* extractClientRequest(SOCKET client_socket, int buffer_size)
{
    clientRequest *request = (clientRequest*) malloc(sizeof(clientRequest));
    request->result = 0;
    request->buffer = (char*)malloc(buffer_size);

    request->bytes_read = recv(client_socket, request->buffer, buffer_size - 1, 0);
    if(request->bytes_read < 0){
        printf("recv failed: %d\n", WSAGetLastError());
        request->result = 1;
        return request;
    }
    request->buffer[request->bytes_read] = '\0';
    char* buffer_copy = (char *)malloc(buffer_size);
    strcpy(buffer_copy, request->buffer);
    char *request_line = strtok(buffer_copy, "\r\n");

    if(request_line == NULL){
        printf("no request line");
        request->result = 1;
        return request;
    }

    request->method = (char*)malloc(16 * sizeof(char));
    request->path = (char*)malloc(256 * sizeof(char));
    request->version = (char*)malloc(16 * sizeof(char));

    sscanf(request_line, "%s %s %s", request->method, request->path, request->version);
    free(buffer_copy);
    free(request_line);
    return request;
}

int readCacheSeconds(char *buffer, int bytes_read){
    char *buffer_copy = strdup(buffer);
    char *header = strtok(buffer_copy, "\r\n");
    while(header != NULL && header[0] != '\0'){
        if(strncmp(header, "cacheSeconds:", 13) == 0){
            int seconds = atoi(header + 13);
            free(buffer_copy);
            return seconds;
        }
        header = strtok(NULL, "\r\n");
    }
    free(buffer_copy);
    return 0;
}

int processRequest(clientRequest* request,SOCKET client_socket, HashTable* table,char* notfound_response){
   char *key = request->path + 1;
   if(strcmp(request->method, "GET") == 0){
       char *val = get(table, key);
       if(val == NULL){
           return send(client_socket, notfound_response, strlen(notfound_response), 0);
       }
       return sendOKresponse(client_socket, val);
   }
   else if(strcmp(request->method, "PUT") == 0){
       char *body = readBody(request->buffer, request->bytes_read);
       int cacheSeconds = readCacheSeconds(request->buffer, request->bytes_read);
       if(body == NULL){
        printf("Error while reading body");
        return 1;
       }
       int result = insert(table, key, body, cacheSeconds);
       if(result != 0){
        return result;
       }
       return sendOKresponse(client_socket, "succesfully cached");
   }
}

int runClientSocketListenLoop(SOCKET server_socket, int buffer_size){
    char notfound_response[256];
    sprintf(notfound_response, "%s %s", HTTP_VERSION, "404 NOT FOUND\r\nContent-Type: text/html\r\nContent-Length: 0\r\n\r\n");
    int iResult;

    HashTable *table = createTable();
    HANDLE cleanup_thread = CreateThread(NULL, 0, cacheCleanup, (void*) table, 0, NULL);

    SOCKET client_socket;
    while(1){
        client_socket = accept(server_socket, NULL,NULL);
        if(client_socket == INVALID_SOCKET){
            printf("Accept failed: %d\n", WSAGetLastError());
            closesocket(server_socket);
            WSACleanup();
            return 1;
        }

        clientRequest *request = extractClientRequest(client_socket, buffer_size);
        if(request->result == 1){
            closesocket(client_socket);
            continue;
        }

        iResult = processRequest(request, client_socket, table, notfound_response);

        if(iResult == SOCKET_ERROR){
            printf("Send failed: %d\n", WSAGetLastError());
            closesocket(client_socket);
            continue;
        }

        Sleep(100);

        closesocket(client_socket);
        free(request->buffer);
        free(request->method);
        free(request->path);
        free(request->version);
        free(request);
    }

    TerminateThread(cleanup_thread, 0);
    CloseHandle(cleanup_thread);
    free(table->items);
    free(table);
}

int main() {

    serverSetup *setup = setupServerListen(PORT);
    if(setup->result == SOCKET_ERROR){
        return 1;
    }

    printf("Server is listening on port %d...\n", PORT);

    runClientSocketListenLoop(setup->server_socket, BUFFER_SIZE);

    closesocket(setup->server_socket);
    WSACleanup();
    free(setup);

    return 0;
}

