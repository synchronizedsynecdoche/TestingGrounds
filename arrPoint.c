#include <stdio.h>

//create a dynamic array for student IDs and GPAs

int main(int argc, char* argv[]){

	double idLen = 5;
	int count = 4; //4 students
	double gpa = 0.0;

	double **table =  (double **) malloc(count * sizeof(double *));

	table[0] = (double *) malloc(2 * sizeof(double));
	table[1] = (double *) malloc(2 * sizeof(double));
	
	table[0][0] = 12345;
	table[0][1] = 4.0;
	table[1][0] = 54321;
	table[1][1] = 3.23;
	table[2][0] = 24231;
	table[2][1] = 2.65;
	table[3][0] = 34232;
	table[3][1] = 1.00;
	
	for(i=0; i < count; i++{
		
		print("Student: %d has %d\n",table[i][0],table[i,1]
	}
	
	free(table[0]);
	free(table[1]);

	free(table);
	
	return 0;
	}

