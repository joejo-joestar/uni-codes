#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int ispal(char str[]);

void main()
{
	int val=0;
	char str[100];
	
	printf("Input string: ");
	scanf("%s",str);
	//gets(str);
	
	val=ispal(str);
		
	if (val==1)
		printf("Palindrome\n");
	
	else if (val==0)
		printf("Not Palindrome\n");

}

int ispal(char str[])
{	
	int check=0;
	int len=strlen(str);
	int j;
	char str2[100];
	
	for(int i=len-1; i>=0; i--)
	{
		str2[j]=str[i];
		j++;
	}
	
	str2[j]='\0';

	check=strcmp(str,str2);

	if (check==0)
		return 1;

	else 
		return 0;

}
