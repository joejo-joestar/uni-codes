#include<stdio.h>

int main()
{
    int m;

    printf("Please enter the number of the month: ");
    scanf("%d",&m);

    switch (m)
    {

        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            printf("There are 31 days\n");
            break;

        case 2:
            printf("There are 28 or 29 days\n");
            break;

        case 4:
        case 6:
        case 9:
        case 11:
            printf("There are 30 days\n");
            break;

        default:
            printf("Error\n");
            break;

    }
    return 0;

}