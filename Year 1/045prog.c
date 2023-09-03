#include<stdio.h>

void main()
{
    int mat1[3][3];
    int mat2[3][3];
    int sum[3][3];

    printf("input matric 1:\n");
    for(int row=0; row<3; row++)
    {
        printf("Row %d: ", row+1);

        for(int col=0; col<3; col++)
            scanf("%d", &mat1[row][col]);

    }

    printf("input matric 2:\n");
    for(int row=0; row<3; row++)
    {
        printf("Row %d: ", row+1);

        for(int col=0; col<3; col++)
            scanf("%d", &mat2[row][col]);

    }

    for(int row=0; row<3; row++)
    {
        for(int col=0; col<3; col++)
            sum[row][col] = mat1[row][col] + mat2[row][col];

    }

    printf("matrix1 + matrix2: \n");

    for(int row=0; row<3; row++)
    {
        printf("Row %d: ", row+1);

        for(int col=0; col<3; col++)
            printf("%d ", sum[row][col]);

        printf("\n");            
    }

}