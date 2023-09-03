#include<stdio.h>

int power(int, int);

int main()
{
	printf("Enter the integer and its power: ");
	int x, y;
	scanf("%d %d", &x, &y);
	int res = power(x,y);
	printf("The result is %d\n", res);
	return 0;

}

int power(int x, int y)
{
        int  res=1;
	
	if (y==0)
	        return res;
	
	else
		return (x*(power(x,y-1)));

}
