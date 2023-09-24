#include <stdio.h>

int main()
{
    int n, num, fact;
    printf("Enter the number of terms: ");
    scanf("%d", &n);
    for(int i = 1; i <= n; i++)
    {
        num = i;
        fact = 1;
        while(num)
            fact *= num--;
            printf("%d! = %d\n", i, fact);

    }
    return 0;

}