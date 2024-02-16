#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX 1024

void main() {
  FILE *fl;
  FILE *flcopy;
  char str[MAX];
  int opt;

  while (1) {
    printf("\nOptions:"
           "\n  1. Append to file"
           "\n  2. Read File"
           "\n  3. Copy file"
           "\n  4. Count Characters, Words and Sentences"
           "\nPlease enter the Option: ");

    scanf("%d", &opt);
    getchar();

    if (opt == 1) {
      fl = fopen("studentout1.dat", "a+");

      printf("Please enter a string: ");
      fgets(str, MAX, stdin);

      fprintf(fl, "%s", str);

      fclose(fl);
    }

    else if (opt == 2) {
      fl = fopen("studentout1.dat", "r");

      printf("File Contents:\n");

      while (fgets(str, MAX, fl)) {
        printf("%s", str);
      }

      fclose(fl);

    }

    else if (opt == 3) {
      fl = fopen("studentout1.dat", "r");
      flcopy = fopen("studentout2.dat", "w");

      while (fgets(str, MAX, fl)) {
        fprintf(flcopy, "%s", str);
      }

      fclose(fl);
      fclose(flcopy);
    }

    else if (opt == 4) {
      int countChar = 0, countWord = 0, countSentence = 0;

      flcopy = fopen("studentout2.dat", "r");

      while (fgets(str, MAX, flcopy)) {
        countSentence++;

        for (int i = 0; i < strlen(str); i++) {
          if (isalnum(str[i]))
            countChar++;

          if (str[i] == ' ')
            countWord++;
        }
        countWord++;
      }

      printf("Number of Characters: %d"
             "\nNumber of Words: %d"
             "\nNumber of Sentences: %d\n",
             countChar, countWord, countSentence);

    }

    else {
      break;
    }
  }
}
