#include<stdio.h>

int main()
{
	int in=0;

	printf("Please enter the Size of the pattern: ");
	scanf("%d",&in);

	for (int i=1; i<=in; i++)
	{
		for (int j=i; j>=1; j--)
		{
			printf("%d",j);

		}
	
		printf("\n");
	}
	
}
