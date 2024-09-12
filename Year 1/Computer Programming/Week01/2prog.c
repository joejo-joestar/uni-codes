#include<stdio.h>

int main()
{
	int r;
	float per=0;
	float ar=0;
	float pi=3.14;
	
	printf("Please enter the Radius: ");
	scanf("%d", &r);

	per = 2*pi*r;
	ar = pi*r*r;

	printf("The Perimeter of the circle is %0.2f units\n", per);
	printf("The Area of the circle is %0.2f sq. units\n", ar);
	return 0;

}
