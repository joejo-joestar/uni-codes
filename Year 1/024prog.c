#include<stdio.h>
#include<stdlib.h>

int main()
{
	int eng, math, chem, phy, bio;
	int sum=0;
	float avg=0;
	
	printf("Please enter English Marks: ");
	scanf("%d", &eng);

	printf("Please enter Mathematics Marks: ");
	scanf("%d", &math);
	
	printf("Please enter Chemistry Marks: ");
	scanf("%d", &chem);

	printf("Please enter Physics Marks: ");
	scanf("%d", &phy);

	printf("Please enter Biology Marks: ");
	scanf("%d", &bio);

	sum = eng+math+chem+phy+bio;
	avg = sum/5;

	if (avg>80)
	{
		printf("The student is in Distinction\n");
			
	}

	else if (avg<=80 && avg>=60)
	{
		printf("The student is in First Division\n");
		exit(0);

	}

	else if (avg<60 && avg>=45)
	{
	        printf("The student is in Second Division\n");
		exit(0);

	}

	else if (avg>=0 && avg<45)
	{
	        printf("The student has Failed\n");

	}

	else if (avg>100)
	{
	        printf("The marks are invalid\n");

	}

	else
	{
        	printf("The marks are invalid\n");

	}

	return 0;

}
