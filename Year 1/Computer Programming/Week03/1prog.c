#include<stdio.h>
#include<ctype.h>
#include<stdlib.h>

int main()

{
	char in;
	int res;
	
	printf("Please enter a letter: ");
	scanf("%c",&in);

	res=isalpha(in);

	switch(res)
	{
		case 0:
			printf("The input is not a letter\n");
			break;

		case 1:
			if (in==('a'||'e'||'i'||'o'||'u'||'A'||'E'||'I'||'O'||'U'))
			{
				printf("The Input Letter is a Vowel\n");
				exit(0);	
			}
			
			else
			{
				printf("The Input Letter is a Consonant\n");

			}
			
			break;
		
		default:
			printf("error\n");
			break;
	}
	
	return 0;

}
