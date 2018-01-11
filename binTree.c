#include <stdio.h>
#include <stdlib.h>

typedef struct treeNode{
	int value;
	struct treeNode *l;
	struct treeNode *r;
	} tn;

void iterate(tn *rootNode){

	tn *cur = NULL;
	cur = malloc(sizeof(tn));
 	*cur = *rootNode;
	printf("%d,",cur->value);
	while(cur != NULL){
		iterate(cur->l);
		iterate(cur->r);	
		}
	}


int main(int argc, char *argv[]){

	tn *root = NULL;
	root = malloc(sizeof(tn));

	root->value = 0;
	

	printf("%d\n",root->value);


	return 0;
	}

