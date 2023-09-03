#include<stdio.h>

int main()
{
	int nu=0, d1=0, d2=0, d3=0, d4=0, sum=0;
		
	printf("Please enter a four digit number: ");
	scanf("%d", &nu);
	
	d1=(nu%10);
	d2=((nu%100)-d1)/10;
	d3=((nu%1000)-(d2+d1))/100;
	d4=((nu%10000)-(d3+d2+d2))/1000;

	sum = d1+d2+d3+d4;
	
	printf("The Sum is %d\n", sum);	
	return 0;

}
