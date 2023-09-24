#include<stdio.h>

void sort(int arr[], int len)
{
	int temp;

	for(int i=0; i<len; i++)
	{
		for(int j=i+1; j<len; j++)
		{
			if (arr[i]>arr[j])
				{
					temp=arr[j];
					arr[j]=arr[i];
					arr[i]=temp;
				}
		}
	}
	

}

void main()
{
	int len;
	
	
	printf("Input size of array: ");
	scanf("%d",&len);
	int arr[len];

	for(int i=0; i<len; i++)
	{
		printf("Input the %d element of array: ", i+1);
		scanf("%d",&arr[i]);
	
	}

	sort(arr, len);

	for(int i=0; i<len; i++)
        {
        	printf(" %d : ",arr[i]);
	
	}

}
