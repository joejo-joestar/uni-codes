#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void main()
{
	char first[20];
	char mid[20];
	char last[20];
	
	printf("Input first name: ");
	scanf("%s",first);
	
	printf("Input middle name: ");
	scanf("%s",mid);
	
	printf("Input last name: ");
	scanf("%s",last);

	strcat(first, mid);
		
	printf("The name is %s\n", strcat(first, last));

}
		
