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
	int flag=0;
	int len=strlen(str);
		
	for(int i=0; i<len; i++)
	{
		if (str[i] != str[len-i-1])
		{
			flag=1;
			break;
		}
		
	}
	
	if (flag==0)
		return 1;

	else 
		return 0;

}
