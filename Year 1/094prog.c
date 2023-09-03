#include<stdio.h>
#include<stdlib.h>
#include<string.h>

void main()
{
	char str[25];
	
	printf("Input string: ");
	scanf("%s",str);
	
	int vow=0;
	int cons=0;
	int len=strlen(str);
	
	for(int i=1; i<=len; i++)
	{
		if (str[i]=='a' || str[i]=='e' || str[i]=='i' || str[i]=='o' || str[i]=='u' || str[i]=='A' || str[i]=='E' || str[i]=='I' || str[i]=='O' || str[i]=='U')
			vow++;
	
		else
			cons++;
	}
	
	printf("The number of vovels are %d\n",vow);
	printf("The number of consonants are %d\n",cons);

}
		
