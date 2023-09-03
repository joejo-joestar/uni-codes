#include<stdio.h>
#include<stdlib.h>

void main()
{
    int m=0, n=0;
	
    printf("Enter the number of rows: ");
    scanf("%d",&m);

    printf("Enter the number of cols: ");
    scanf("%d",&n);

    int a[m][n];

    if (m!=n)
    {
        printf("Invalid\n");
        exit(0);
    }

    printf("Enter the Elements of Matrix: \n");
    for (int i=0; i<m; i++)
    {
        printf("Row %d: ", i+1);

        for (int j=0; j<n; j++)
        {
            scanf("%d", &a[i][j]);
        }
    }

    printf("Matrix: \n");
    for (int i=0; i<m; i++)
    {
        for (int j=0; j<n; j++)
        {
            printf("%d ", a[i][j]);
            
        }
        printf("\n");
    }

	for (int row=0; row<m; row++)
	{
		
        for (int col=0; col<n; col++)
		{
            if (row>col)
			printf("%d ", a[row][col]);

		}

        printf("\n");
	}

}