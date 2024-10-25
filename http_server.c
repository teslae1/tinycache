#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <winsock2.h>
#include <ws2tcpip.h>

#pragma comment(lib, "ws2_32.lib")


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
    while(1){
        client_socket = accept(server_socket, NULL, NULL);
        if(client_socket == INVALID_SOCKET){
            printf("Accept failed: %d\n", WSAGetLastError());
            closesocket(server_socket);
            WSACleanup();
            return 1;
        }

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

    //int server_socket;
    //server_socket = socket(AF_INET, SOCK_STREAM, 0);
    //struct sockaddr_in server_address;

    //bind(server_socket, (struct sockaddr *) &server_address, sizeof(server_address));
    //listen(server_socket, 5);

    //int client_socket;
    //while(1){
    //    client_socket = accept(server_socket, NULL,NULL);
    //    send(client_socket, http_header, sizeof(http_header), 0);
    //    close(client_socket);
    //}
    printf("reached end");

    return 0;
}
