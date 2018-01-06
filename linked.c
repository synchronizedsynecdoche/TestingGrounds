#include <stdio.h>
#include <stdlib.h>
//https://www.learn-c.org/en/Linked_lists
typedef struct node {
	int value;
	struct node* next;
	} node_t;

void iter(node_t* n){

	while(n->next != NULL){
	
		printf("%d\n",n->value);
		n = n->next;
		}
	}

int main(int argc, char* argv[]){
	node_t* head = NULL;
	head = malloc(sizeof(node_t));
	
	head->value = 0;
	head->next = malloc(sizeof(node_t));

	head->next->value = 1;
	head->next->next = malloc(sizeof(node_t));
	
	head->next->next->value = 2;
	head->next->next->next = NULL; //terminate
	
	iter(head);
	
	return 0;
	}

