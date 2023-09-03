#include<stdio.h>

int main()
{
	int a, b;
	int temp;
	
	printf("Please enter the value of a: ");
	scanf("%d", &a);
	
	printf("Please enter the value of b: ");
	scanf("%d", &b);
	
	temp=a;
	a=b;
	b=temp;
	
	printf("The swapped value of a is %d and value of b is %d\n", a, b);
	return 0;

}
