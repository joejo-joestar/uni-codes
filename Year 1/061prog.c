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
            printf("\n");
        }
    }

	int sumrow;
	int sumcol;

	for (int row=0; row<m; row++)
	{
		sumrow=0;
        
        for (int col=0; col<n; col++)
		{
			sumrow+=a[row][col];
		}
		printf("row sum is %d\n", sumrow);
	}

	for (int col=0; col<n; col++)
	{
		sumcol=0;
		for (int row=0; row<m; row++)
		{
			sumcol+=a[row][col];
		}
		printf("column sum is %d\n", sumcol);
	}

}
