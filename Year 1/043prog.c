#include<stdio.h>

int main()
{
    int mar[5];
        int sum=0;
	    float perc;

	        for (int i=1; i<=5; i++)
		    {
		            printf("Please enter marks of Subject %d: ", i);
			            scanf("%d", &mar[i]);
				            
					            sum = sum+mar[5];
						            
							            printf("%d", sum);
								            perc = sum/5;
									            
										            printf("%0.2f", perc);
											        }    
												    
												    }
