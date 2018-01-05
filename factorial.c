#include <stdio.h>
//do this recursively
//skeleton code
//all exercises from https://www.learn-c.org/en/Recursion
int fac(int x, int count){

	if(count - 1 == 0){
		return x;
		}
	if(x == 0){
		return 1;
		}

	x = x* (count - 1);
	return (fac(x, count-1));
	}

int main(int argc, char* argv[]){

	int x = 4;

	printf("%d",fac(x,x));

	return 0;
	}

