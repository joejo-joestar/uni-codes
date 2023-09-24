#include<stdio.h>

int main()
{
	int x, ascii;
	
	printf("Please enter a single digit integer: ");
	scanf("%d", &x);

	ascii = x + 48;
	
	printf("The ASCII Value of %d is %d\n",x, ascii);
	return 0;

}
