#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void main()
{
	char str1[10];
	char str2[10];
	
	printf("Input string 1: ");
	scanf("%s",str1);
	printf("Input string 2: ");
	scanf("%s",str2);
	
	int res;
	res=strcmp(str1,str2);
	
	if (res==0)
		printf("The strings are same\n");
	
	else
		printf("The strings are not same\n");

}
		
