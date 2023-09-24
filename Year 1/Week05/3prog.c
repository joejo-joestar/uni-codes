#include<stdio.h>

int main()

{
	int in;
	float total[100];
	int bas;
	float sal, hra, spl;

	printf("Please enter the number of employees: ");
	scanf("%d",&in);

	for(int i=1; i<=in; i++)
	{
		printf("Please enter the Basic of Employee %d: ",i);
		scanf("%d", &bas);

		hra = bas*40/100;
		spl = bas*25/100;
		sal = bas+hra+spl;
		total[i]=sal;
		printf("salary of employee %d is %0.2f\n", i, total[i] );
		
	}
	
	for(int j=0; j<=in; j++)
	{
		for(int k=j+1; j<in; j++)
		{
			temp=total[i];
			if (temp<total[k])
			{
				total[k]=total[j];
				total[j]=temp;

			}
		
		}
	
	}

	printf("%0.2f", total[i]);

}
