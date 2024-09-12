#include<stdio.h>
#include<stdlib.h>

int quad(float x, float y);

int main()
{
	float x;
    float y;
    
    printf("Please enter value of x coordinate: ");
	scanf("%f",&x);

	printf("Please enter value of y coordinate: ");
	scanf("%f",&y);

	int q = quad(x, y);

	if(q==0)
	    printf("The point (%0.2f,%0.2f) lies on the origin\n", x, y);

	else if(q==5)
	    printf("The point (%0.2f,%0.2f) lies on the x axis\n", x, y);

	else if(q==6)
	    printf("The point (%0.2f,%0.2f) lies on the y axis\n", x, y);
    
    else
		printf("The point (%0.2f,%0.2f) lies in Quadrant %d\n", q);

}

int quad(float x, float y)
{
	
	if(x>0 && y>0)
		return 1;

	else if(x<0 && y>0)
	    return 2;

	else if(x<0 && y<0)
        return 3;
	
	else if(x>0 && y<0)
	    return 4;

	else if(x==0 && y==0)
        return 0;

	else if(y==0)
        return 5;

	else if(x==0)
        return 6;
    

}