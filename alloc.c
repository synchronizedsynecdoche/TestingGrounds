#include <stdio.h>
#include <stdlib.h>

typedef struct {

	char *name;
	int gpa;
	int isEnrolled;
	}student;

void enroll(student *s, int stat){
	
	if(stat != 0){
		(*s).isEnrolled = 1;
		}

	else{
		(*s).isEnrolled = 0;
		}
	}

int main(int argc, char* argv[]){
	
	student *s = malloc(sizeof(student));

	s->name = "Patrick";
	s->gpa = -1;
	enroll(s, 0);
	
	printf("%s : %d : %d\n", s->name, s->gpa, s->isEnrolled);
	
	free(s);

	return 0;

	}

