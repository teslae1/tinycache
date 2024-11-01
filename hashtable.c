
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

HashTable* createTable(){
    HashTable *table = (HashTable*) malloc(sizeof(HashTable));
    table->size = TABLE_SIZE;
    table->count = 0;
    table->items = (HashItem**) calloc(table->size, sizeof(HashItem*));
    return table;
}

char* get(HashTable *table, const char *key){
    int i = 0; 
    while(i < table->count){
        HashItem *item = table->items[i];
        if(item != NULL && strcmp(item->key, key) == 0){
            return item->value;
        }
        i++;
    }

    return NULL;
}

int insert(HashTable *table, char *key, char *val){
    int i = 0;
    int count = table->count;
    while(i < count){
        HashItem *item = table->items[i];

        if(strcmp(item->key, key) == 0){
            free(item->value);
            item->value = strdup(val);
            return 0;
        }
        i++;
    }

    HashItem *item = (HashItem*) malloc(sizeof(HashItem));
    if(item == NULL){
        printf("Memory allocation failure for hashtable item insert");
        return 1;
    }
    item->key = strdup(key);
    item->value = strdup(val);
    table->items[count] = item;
    table->count++;
    return 0;
}