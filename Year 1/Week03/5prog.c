#include<stdio.h>

int main()

{
	float x, y;
 
	char oper;
	
	printf("Please enter the first number: ");
	scanf("%f",&x);
	
	printf("Please enter the second number: ");
	scanf("%f",&y);
	
	printf("Please enter the operator: ");
	getchar();
	scanf("%c",&oper);

	switch(oper)
	{
		case '+':
			printf("The Value is %0.2f\n", x+y);
			break;

		case '-':
			printf("The Value is %0.2f\n", x-y);
			break;

		case '*':
			printf("The Value is %0.2f\n", x*y);
			break;

		case '/':
			printf("The Value is %0.2f\n", x/y);
			break;
		
		default:
			printf("error\n");
			break;
	}
	
	return 0;

}
