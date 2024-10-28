
#include <stdio.h>
#include "hashtable.c"



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






