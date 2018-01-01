#include <stdio.h>


void sqr(int *x){
	
	*x = *x * *x;

	}

int main(int argc, char* argv[]){
	
	int alpha = 3;

	sqr(&alpha);
	
	printf("%d\n",alpha);
	
	}

