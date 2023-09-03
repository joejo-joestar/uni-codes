#include<stdio.h>
#include<math.h>

int rev(int num)
{
	int count;
	int rev;
	int num2;
	count=sizeof(num);
	
	while(num!=0)
	{
		rev=num%10;
		num2=num2+rev *pow(10,count-1);
		num/=10;
		count--;
	}
	printf("%d",num2);

}


void main()
{
	int num;
	printf("Please enter a number: ");
	scanf("%d", &num);
	
	rev(num);

}
