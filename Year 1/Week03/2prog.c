#include<stdio.h>

int main()

{
	int x, y;
	char oper;
	
	printf("Please enter the first number: ");
	scanf("%d",&x);
	
	printf("Please enter the second number: ");
	scanf("%d",&y);
	
	printf("Please enter the operator: ");
	getchar();
	scanf("%c",&oper);

	switch(oper)
	{
		case '+':
			printf("The Value is %d\n", x+y);
			break;

		case '-':
			printf("The Value is %d\n", x-y);
			break;

		case '*':
			printf("The Value is %d\n", x*y);
			break;

		case '/':
			printf("The Value is %d\n", x/y);
			break;
		
		default:
			printf("error\n");
			break;
	}
	
	return 0;

}
