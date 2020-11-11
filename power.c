#include "myMath.h"
#include <stdio.h>
#define exp 2.718228182846

double Exponent(int x)
{
	return Power(exp, x);
	}

double Power(double x, int y)
{
if(y==0){
return 1;
}
if (y>0){
	double temp = 1;
	for(int i = 0; i<y;i++){
	temp = temp*x;
}
return temp;
}
int temp1 = mul(y,-1);
double temp2 = 1;
	for(int i = 0; i<temp1;i++){
	temp2 = temp2/x;
}
return temp2;

}
