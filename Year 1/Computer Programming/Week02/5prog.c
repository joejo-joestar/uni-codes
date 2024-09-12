#include<stdio.h>

int main()
{
    int in;

    printf("Please enter an integer between 1 and 5: ");
    scanf("%d",&in);

    switch (in)
    {

    case 1:
        printf("Hello\n");
        break;

    case 2:
        printf("Tea?\n");
        break;

    case 3:
        printf("Cofee?\n");
        break;

    case 4:
        printf("Milk Shake?\n");
        break;

    case 5:
        printf("Juice?\n");
        break;

    default:
        printf("Bye\n");
        break;

    }
    return 0;

}