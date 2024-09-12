#include<stdio.h>

int main()
{
    int in;
    int sum=0, revsum=0;
    int temp;

    printf("Please enter a number: ");
    scanf("%d", &in);

    temp=in;

    while (temp>0)
    {
        sum+=temp%10;
        temp/=10;
    }

    temp=sum;

    while (temp>0)
    {
        revsum=(10*revsum)+(temp%10);
        temp/=10;
    }

    if (sum*revsum==in)
    {
        printf("%d is a magic number\n", in);

    }

    else
    {
        printf("%d is not a magic number\n", in);

    }
    return 0;

}