#include<stdio.h>

int sum(int n);

int main()
{
	int n;
	
	printf("Please enter a number: ");
	scanf("%d", &n);

	int res=sum(n);
	
	printf("the sum of the digits is %d\n", res);

}	

int sum(int n)
{
	if(n==0)
		return 0;
	
	return ((n%10)+sum(n/10));

}
