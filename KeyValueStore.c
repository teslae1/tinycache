
#define TABLE_SIZE 100
#include <time.h>
#include <windows.h>

typedef struct {
    char *key;
    char *value;
    int cacheSeconds;
    time_t insertionTime;
} KeyValueItem;

typedef struct {
    KeyValueItem **items;
    int size;
    int count;
    CRITICAL_SECTION lock;
} KeyValueTable;

KeyValueTable* createTable(){
    KeyValueTable *table = (KeyValueTable*) malloc(sizeof(KeyValueTable));
    table->size = TABLE_SIZE;
    table->count = 0;
    table->items = (KeyValueItem**) calloc(table->size, sizeof(KeyValueItem*));
    InitializeCriticalSection(&table->lock);
    return table;
}

char* get(KeyValueTable *table, const char *key){
    EnterCriticalSection(&table->lock);
    int i = 0; 
    while(i < table->count){
        KeyValueItem *item = table->items[i];
        if(item != NULL && strcmp(item->key, key) == 0){
            char* valueCopy = strdup(item->value);
            LeaveCriticalSection(&table->lock);
            return valueCopy;
        }
        i++;
    }

    LeaveCriticalSection(&table->lock);
    return NULL;
}

int insert(KeyValueTable *table, char *key, char *val, int cacheSeconds){
    EnterCriticalSection(&table->lock);
    int i = 0;
    int count = table->count;
    while(i < count){
        KeyValueItem *item = table->items[i];

        if(item != NULL && strcmp(item->key, key) == 0){
            free(item->value);
            item->value = strdup(val);
            item->insertionTime = time(NULL);
            item->cacheSeconds = cacheSeconds;
            LeaveCriticalSection(&table->lock);
            return 0;
        }
        i++;
    }

    if(table->count + 1 > TABLE_SIZE){
        printf("Insertion could not be done: exceeded max table size of %i", TABLE_SIZE);
        LeaveCriticalSection(&table->lock);
        return 1;
    }

    KeyValueItem *item = (KeyValueItem*) malloc(sizeof(KeyValueItem));
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
    KeyValueTable *table = (KeyValueTable*)arg;
    while(1){
        Sleep(1000);
        EnterCriticalSection(&table->lock);
        time_t now = time(NULL);
        int i = 0; 
        while(i < table->count){
            KeyValueItem *item = table->items[i];
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
                    j++;
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