#include<stdio.h>

void main()
{
    int m=0, n=0;
	
    printf("Enter the number of rows: ");
    scanf("%d",&m);

    printf("Enter the number of cols: ");
    scanf("%d",&n);

    int a[m][n];

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

	int sd1=0;
	int sd2=0;

	for (int row=0; row<m; row++)
	{
		sd1=0;
        sd2=0;

        for (int col=0; col<n; col++)
		{
            if (row==col)
			sd1+=a[row][col];

            if ((row+col)==(m+1))
            sd2+=a[row][col];

		}

	}

    printf("sum of main diagonal is %d\n", sd1);
    printf("sum of opposite diagonal is %d\n", sd2);
}