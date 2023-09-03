#include<stdio.h>

int main()
{
	int in;

	printf("Please enter the Size of the pattern: ");
	scanf("%d",&in);

	for (int i=1; i<=in; i++)
	{
		for (int j=1; j<=i; j++)
		{
			printf("%d",i);

		}
	
		printf("\n");
	}
	
}
