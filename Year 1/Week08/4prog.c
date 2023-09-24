#include<stdio.h>

int static m=0;
int lcm(int a, int b);

int main()
{
	int a, b;

	printf("Please enter first number for lcm: ");
	scanf("%d",&a);
	printf("Please enter second number for lcm: ");
	scanf("%d",&b);
	
	int res=lcm(a,b);

	printf("LCM of %d and %d is %d\n", a, b, res);

}

int lcm(int a, int b)
{
	m+=b;

	if((m%a==0)&&(m%b==0))
		return m;
	
	else
		lcm(a, b);

}
