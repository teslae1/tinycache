#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <winsock2.h>
#include <ws2tcpip.h>
#include "hashtable.c"

#pragma comment(lib, "ws2_32.lib")
#define BUFFER_SIZE 2048
#define HTTP_VERSION "HTTP/1.1"

char* readBody(SOCKET *buffer, int bytes_read){
    int content_length = 0;
    //split buffer into string seperated by \r\n
    char *header = strtok(buffer, "\r\n");
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

int sendOKresponse(SOCKET *client_socket, char* bodyStr){
    char http_header[2048];
    sprintf(http_header, "%s 200 OK\r\nContent-Type: application/json\r\nContent-Length: %d\r\n\r\n%s", HTTP_VERSION, (int)strlen(bodyStr), bodyStr);
    int iResult;
    iResult = send(client_socket, http_header, strlen(http_header), 0);
    free(http_header);
    return iResult;
}

int main() {

    int iResult;
    WSADATA wsaData;
    iResult = WSAStartup(MAKEWORD(2, 2), &wsaData);
    if(iResult != 0){
        printf("WSAStartup failed: %d\n", WSAGetLastError());
        WSACleanup();
        return 1;
    }

    SOCKET server_socket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if(server_socket == INVALID_SOCKET){
        printf("Socket creation failed: %d\n", WSAGetLastError());
        WSACleanup();
        return 1;
    }

    struct sockaddr_in server_address;
    server_address.sin_family = AF_INET;
    server_address.sin_port = htons(8001);
    server_address.sin_addr.s_addr = INADDR_ANY;

    iResult = bind(server_socket, (struct sockaddr*)&server_address, sizeof(server_address));
    if(iResult == SOCKET_ERROR){
        printf("Bind failed: %d\n", WSAGetLastError());
        WSACleanup();
        return 1;
    }

    iResult = listen(server_socket, SOMAXCONN);
    if(iResult == SOCKET_ERROR){
        printf("Listen failed: %d\n", WSAGetLastError());
        closesocket(server_socket);
        WSACleanup();
        return 1;
    }

    printf("Server is listening on port 8001...\n");


    char notfound_response[256];
    sprintf(notfound_response, "%s %s", HTTP_VERSION, "404 NOT FOUND\r\nContent-Type: text/html\r\nContent-Length: 0\r\n\r\n");

    HashTable *table = createTable();
    insert(table, "MYKEY", "{\"name\": \"emma\"}");

    SOCKET client_socket;
    char buffer[BUFFER_SIZE];
    while(1){
        client_socket = accept(server_socket, NULL,NULL);
        if(client_socket == INVALID_SOCKET){
            printf("Accept failed: %d\n", WSAGetLastError());
            closesocket(server_socket);
            WSACleanup();
            return 1;
        }

        int bytes_read = recv(client_socket, buffer, BUFFER_SIZE - 1, 0);
        if(bytes_read < 0){
            printf("recv failed: %d\n", WSAGetLastError());
            closesocket(client_socket);
            continue;
        }
        buffer[bytes_read] = '\0';
        char* buffer_copy = (char *)malloc(BUFFER_SIZE);
        strcpy(buffer_copy, buffer);
        char *request_line = strtok(buffer_copy, "\r\n");

        if(request_line == NULL){
            printf("no request line");
            closesocket(client_socket);
            continue;
        }

        char method[16], path[256], version[16];
        sscanf(request_line, "%s %s %s", method, path, version);
        printf("method was: %s\n", method);
            char *key = path + 1;
        if(strcmp(method, "GET") == 0){
            printf("trying to get by key %s\n", key);
            char *val = get(table, key);
            printf("got val: %s\n", val);
            if(val == NULL){
                printf("did not find - now sending 404 response");
                iResult = send(client_socket, notfound_response, strlen(notfound_response), 0);
            }
            else{
                iResult = sendOKresponse(client_socket, val);
            }
        }
        else if(strcmp(method, "PUT") == 0){
            char *body = readBody(buffer, bytes_read);
            if(body == NULL){
                printf("ERROR");
            }
            insert(table, key, body);
            iResult = sendOKresponse(client_socket, "succesfully cached");
        }

        free(key);

        if(iResult == SOCKET_ERROR){
            printf("Send failed: %d\n", WSAGetLastError());
            closesocket(client_socket);
            continue;
        }

        Sleep(100);
        free(buffer_copy);
        free(request_line);

        closesocket(client_socket);
    }

    closesocket(server_socket);
    WSACleanup();

    return 0;
}

