#include<stdio.h>
#include<string.h>
#include<stdlib.h>

struct Books {
    char name[100];
    char writer[50];
    int ed;
    float cost;
    int copies;

};

void main() {
    int count=0;
    int turi_ip_ip_ip=0;     //ty @SreenikethanI
    struct Books b[50];

    while(1) {

        int num = count;
        printf("Menu:\n  1. View Books\n  2. Add Book\n  3. Search Book\n  4. Edit Book Details\n  5. Delete Book\n  6. Quit \n");
        printf("Please enter the desired option: ");
        scanf("%d", &turi_ip_ip_ip);

        //View Books
        if(turi_ip_ip_ip==1) {
            for (int j=0; j<count; j++) {
                printf("\n");
                printf("The book with serial number %d is %s by %s \n", j+1, b[j].name, b[j].writer);

            }

            printf("\n");

        }

        //Add Books
        else if(turi_ip_ip_ip==2) {

            printf("\nThe Serial Number of this book is %d\n", count+1);

            printf("Please Enter the title of the book: ");
            getchar();
            gets(b[count].name);

            printf("Please Enter the author of the book: ");
            gets(b[count].writer);

            printf("Please Enter the edition of the book: ");
            scanf("%d", &b[count].ed);

            printf("Please Enter the price of the book: ");
            scanf("%f", &b[count].cost);

            printf("Please Enter the number of copies of the book: ");
            scanf("%d", &b[count].copies);
            printf("\n");

            count++;

        }

        //Search Books
        else if(turi_ip_ip_ip==3) {
            int index=1;

            printf("\n");

            printf("Please enter the Serial Number of the book to search for: ");
            scanf("%d", &index);
            index--;

            if(index>=0 && index<count) {
                printf("The title of the book: %s", b[index].name);
                printf("\n");

                printf("The author of the book: %s", b[index].writer);
                printf("\n");

                printf("The edition of the book: %d", b[index].ed);
                printf("\n");

                printf("The price of the book: %.2f", b[index].cost);
                printf("\n");

                printf("The number of copies of the book: %d\n", b[index].copies);
                printf("\n");

            }

            else {
                printf("\nBook Doesnt Exist!\n");
                printf("\n");

            }

        }

        //Edit Books
        else if(turi_ip_ip_ip==4) {
            int index=1;

            printf("\nPlease enter the Serial Number of the book to edit: ");
            scanf("%d", &index);
            printf("\n");
            index = index-1;

            if(index>=0 && index<count) {
                printf("Please Enter the new title of the book: ");
                getchar();
                gets(b[index].name);

                printf("Please Enter the new author of the book: ");
                gets(b[index].writer);

                printf("Please Enter the new edition of the book: ");
                scanf("%d", &b[index].ed);

                printf("Please Enter the new price of the book: ");
                scanf("%f", &b[index].cost);

                printf("Please Enter the updated number of copies of the book: ");
                scanf("%d", &b[index].copies);
                printf("\n");

            }

            else {
                printf("Book Doesnt Exist!\n");
                printf("\n");

            }

        }

        //Delete Books
        else if(turi_ip_ip_ip==5) {
            int index=0;

            printf("\nPlease enter the Serial Number of the book to delete: ");
            scanf("%d", &index);
            printf("\n");
            index--;

            if(index>=0 && index<count) {
                for(int j=index+1; j<count; j++) {
                    b[j-1]=b[j];

                }

                count--;

                printf("Done!\n");
                printf("\n");

            }

            else {
                printf("Book Doesnt Exist!\n");
                printf("\n");

            }

        }

        //Exit
        else if(turi_ip_ip_ip==6) {
            break;

        }

        //Error
        else {
            printf("\nPlease enter a valid option\n");

        }

    }

}
