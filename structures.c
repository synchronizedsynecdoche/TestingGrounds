#include <stdio.h>


int main(int argc, char* argv[]){

	typedef struct {
		
		double x;
		double y;
	} vector;

	vector v;
	
	v.x = 0;
	v.y = -1;

	printf("%f, %f\n", v.x, v.y);
	
	return 0;
	}


