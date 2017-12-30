#include <stdio.h>

int main(int argc, char* argv[]){

	int alpha = -1;
	int *beta = &alpha;

	printf("The value of alpha is %d\n",alpha);
	printf("Operating through the pointer: %d\n", *beta+1);
	
	return 0;
	}

