#include <stdio.h>
#include <math.h>

typedef struct {

        double x;
        double y;
        double mag;
        } vector;

void findMagnitude(vector *v){

        (*v).mag = sqrt( ((*v).x * (*v).x) + ((*v).y * (*v).y) );

       }

int main(int argc, char* argv[]){

        vector v;

        v.x = 1;
        v.y = 1;
        v.mag = -1;

        findMagnitude(&v);

        printf("x:%f, y:%f, mag:%f\n",v.x,v.y,v.mag);

        return 0;

        }
