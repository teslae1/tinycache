
#define TABLE_SIZE 100
#include <time.h>
#include <windows.h>

typedef struct {
    char *key;
    char *value;
    int cacheSeconds;
    time_t insertionTime;
} HashItem;

typedef struct {
    HashItem **items;
    int size;
    int count;
    CRITICAL_SECTION lock;
} HashTable;

HashTable* createTable(){
    HashTable *table = (HashTable*) malloc(sizeof(HashTable));
    table->size = TABLE_SIZE;
    table->count = 0;
    table->items = (HashItem**) calloc(table->size, sizeof(HashItem*));
    InitializeCriticalSection(&table->lock);
    return table;
}

char* get(HashTable *table, const char *key){
    EnterCriticalSection(&table->lock);
    int i = 0; 
    while(i < table->count){
        HashItem *item = table->items[i];
        if(item != NULL && strcmp(item->key, key) == 0){
            LeaveCriticalSection(&table->lock);
            return item->value;
        }
        i++;
    }

    LeaveCriticalSection(&table->lock);
    return NULL;
}

int insert(HashTable *table, char *key, char *val, int cacheSeconds){
    EnterCriticalSection(&table->lock);
    int i = 0;
    int count = table->count;
    while(i < count){
        HashItem *item = table->items[i];

        if(strcmp(item->key, key) == 0){
            free(item->value);
            item->value = strdup(val);
            LeaveCriticalSection(&table->lock);
            return 0;
        }
        i++;
    }

    HashItem *item = (HashItem*) malloc(sizeof(HashItem));
    if(item == NULL){
        printf("Memory allocation failure for hashtable item insert");
        LeaveCriticalSection(&table->lock);
        return 1;
    }
    item->key = strdup(key);
    item->value = strdup(val);
    item->cacheSeconds = cacheSeconds;
    item->insertionTime = time(NULL);
    table->items[count] = item;
    table->count++;
    LeaveCriticalSection(&table->lock);
    return 0;
}

DWORD WINAPI cacheCleanup(LPVOID arg){
    HashTable *table = (HashTable*)arg;
    while(1){
        Sleep(1000);
        EnterCriticalSection(&table->lock);
        time_t now = time(NULL);
        int i = 0; 
        while(i < table->count){
            HashItem *item = table->items[i];
            if(item != NULL && difftime(now, item->insertionTime) > item->cacheSeconds){
                printf("Expired cache removed after %d seconds by key: %s\n",item->cacheSeconds, item->key);
                free(item->key);
                free(item->value);
                free(item);
                table->items[i] = NULL;
                int j = i; 
                //shift items on right hand side to fill in gap
                while(j < table->count - 1){
                    table->items[j] = table->items[j + 1];
                }
                table->items[table->count - 1] = NULL;
                table->count--;
                i--;
            }
            i++;
        }
        LeaveCriticalSection(&table->lock);
    }
    return 0;
}