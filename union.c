#include <stdio.h>

union intParts {
	int theInt;
	char bytes[sizeof(int)];
	};

int main(int argc, char* argv[]){
	union intParts u;
	u.theInt = 345678;

	printf("Integer: %i has bytes [%i,%i, %i, %i]\n", u.theInt, u.bytes[0],u.bytes[1],u.bytes[2],u.bytes[3]);
	
	return 0;
	}


