#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <winsock2.h>
#include <ws2tcpip.h>

#pragma comment(lib, "ws2_32.lib")
#define BUFFER_SIZE 1024


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

    char response_data[2048] = "<html>FROMSERVER</html>";
    char http_header[2048];
    sprintf(http_header, "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\nContent-Length: %d\r\n\r\n%s", (int)strlen(response_data), response_data);


    SOCKET client_socket;
    struct sockaddr_in client_addr;
    char buffer[BUFFER_SIZE];
    int client_len = sizeof(client_addr);
    while(1){
        client_socket = accept(server_socket, (struct sockaddr*)&client_addr, &client_len);
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
        char *request_line = strtok(buffer, "\r\n");

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
            printf("key was %s\n", key);

        }
        else if(strcmp(method, "PUT") == 0){
            printf("PUT not implemented yet");
        }

        free(key);

        iResult = send(client_socket, http_header, strlen(http_header), 0);
        if(iResult == SOCKET_ERROR){
            printf("Send failed: %d\n", WSAGetLastError());
            closesocket(client_socket);
            continue;
        }

        Sleep(100);

        closesocket(client_socket);
    }

    closesocket(server_socket);
    WSACleanup();

    return 0;
}
