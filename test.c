#include <stdio.h>
#include <stdlib.h>

typedef struct{
	
	long a[99999999999999999] ;

	}big;

int main(int argc, char *argv[]){
	
	big *b = malloc(sizeof(big));
	
	printf("Hello, world!\n");

	return 0;
	}

