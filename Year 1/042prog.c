#include<stdio.h>

int main()
{
	int stu=0;
	int sub=0;
	int mar[sub];
	int sum=0;
	float perc=0;
	
	printf("Please enter the number of students: ");
	scanf("%d",&stu);
	
	printf("Please enter the number of subjects: ");
	scanf("%d",&sub);

	for (int i=1; i<=stu; i++)
	{

		for (int j=1; j<=sub; j++)
		{
			printf("Please enter Marks of Student %d for Subject %d: ",i ,j);
			scanf("%d", mar[j]);

			sum = sum+mar[j];
			perc = sum/sub;

			printf("The percentage is %0.2f%", perc);


		}
	
		printf("\n");
	}
	
}
