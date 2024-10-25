
#include <stdio.h>

#define TABLE_SIZE 100

typedef struct {
    char *key;
    char *value;
} HashItem;

typedef struct {
    HashItem **items;
    int size;
    int count;
} HashTable;


int main(){

    HashTable *table = createTable();
    char *key = "key";
    char *val = "ACTVAL";
    insert(table, key, val);
    insert(table, key, "NEWWAL");
    insert(table, "anotherkey", "otherval");

    printf("table amount of values: %d \n", table->count);
    int i = 0;
    printf("table elements: \n");
    while(i < table->count){
        HashItem *item = table->items[i];
        printf("  key: '%s', value: '%s' \n", item->key, item->value);
        i++;
    }

    i = 0;
    while(i < table->count){
        free(table->items[i]);
        i++;
    }
    free(table->items);
    free(table);

    return 0;
}

void createTable(){
    HashTable *table = (HashTable*) malloc(sizeof(HashTable));
    table->size = TABLE_SIZE;
    table->count = 0;
    table->items = (HashItem**) calloc(table->size, sizeof(HashItem*));
    return table;
}

void insert(HashTable *table, const char *key, const char *val){
    int i = 0;
    int count = table->count;
    while(i < count){
        HashItem *item = table->items[i];

        if(strcmp(item->key, key) == 0){
            item->value = val;
            return;
        }
        i++;
    }

    HashItem *item = (HashItem*) malloc(sizeof(HashItem));
    item->key = key;
    item->value = val;
    table->items[count] = item;
    table->count++;
}




