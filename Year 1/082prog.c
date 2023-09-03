#include<stdio.h>
#include<stdlib.h>

int static ctr=0;
int digits(int n);

int main()
{
	int n;

	printf("please enter a number: ");
	scanf("%d", &n);
	
	int res=digits(n);
	
	printf("the number of digits in %d is %d\n", n, res);

}

int digits(int n)
{
	if (n!=0)
	{
		ctr++;
		digits(n/10);
	}
		
	return ctr;
	
}
