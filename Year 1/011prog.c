#include<stdio.h>

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

	printf("The Average Marks is %0.2f\n", avg);	
	return 0;

}
