#include<stdio.h>

void color(char a);

int main()
{
	char in;
	printf("Please input the initial of a colour: ");
	scanf("%c",&in);
	color(in);
	return 0;

}

void color (char a)
{
	switch (a)
	{
		case 'V':
		case 'v':
			printf("Violet\n");
			break;

		case 'I':
		case 'i':
			printf("Indigo\n");
			break;

		case 'B':
		case 'b':
			printf("Blue\n");
			break;

		case 'G':
		case 'g':
			printf("Green\n");
			break;

		case 'Y':
		case 'y':
			printf("Yellow\n");
			break;
		
		case 'O':
		case 'o':
			printf("Orange\n");
			break;

		case 'R':
		case 'r':
			printf("Red\n");
			break;

		default:
			printf("Invalid Color\n");
			break;
	
	}
}
