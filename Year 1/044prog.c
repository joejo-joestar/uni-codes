#include<stdio.h>
#define sub 10

int main()
{
    float marks1[sub];
    float marks2[sub];

    int flag = 0;

    printf("Enter marklist 1: ");

    for(int i=0; i<sub; i++)
    {
        scanf("%f", $marks1[i]);

    }

    printf("Enter marklist 2: ");

    for(int i=0; i<sub; i++)
    {
        scanf("%f", $marks2[i]);

    }

    for(int i=0; i<sub; i++)
    {
        if(marks1[i]!=marks2[i])
        {
            flag = 1;
            break;

        }

    }

    if(flag = 1)
        printf("Not identical\n");

    else
        printf("Identical\n");

    return 0;

}    