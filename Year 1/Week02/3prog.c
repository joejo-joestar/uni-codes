#include<stdio.h>
#include<stdlib.h>

int main()
{
	int x, y;

	printf("Please enter value of x coordinate: ");
	scanf("%d",&x);

	printf("Please enter value of y coordinate: ");
	scanf("%d",&y);

	if(x>0 && y>0)
	{	
		printf("The point (%d,%d) lies in Quadrant 1\n", x, y);
		exit(0);

	}

	else if(x<0 && y>0)
	{
	        printf("The point (%d,%d) lies in Quadrant 2\n", x, y);
		exit(0);

	}


	else if(x<0 && y<0)
	{
		printf("The point (%d,%d) lies in Quadrant 3\n", x, y);
		exit(0);

	 }
	
	else if(x>0 && y<0)
	{
		printf("The point (%d,%d) lies in Quadrant 4\n", x, y);
		exit(0);

	}

	else if(x==0 && y==0)
	{
	        printf("The point (%d,%d) lies on the origin\n", x, y);
		exit(0);
	}

	else if(y==0)
	{
	        printf("The point (%d,%d) lies on the x axis\n", x, y);
		exit(0);
	}

	else if(x==0)
	{
	        printf("The point (%d,%d) lies on the y axis\n", x, y);
		exit(0);

	}

}
