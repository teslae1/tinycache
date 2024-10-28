
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