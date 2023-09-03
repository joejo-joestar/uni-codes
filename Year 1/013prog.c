#include<stdio.h>

int main()
{
	int bas, all;
	float hra=0;
	float sal=0;
	printf("Please enter Basic: ");
	scanf("%d", &bas);

	printf("Please enter Allowance: ");
	scanf("%d", &all);
	
	hra = 0.4*bas;
	sal = bas+hra+all;

	printf("The Salary is %0.2f\n", sal);	
	return 0;

}
