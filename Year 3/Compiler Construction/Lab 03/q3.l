    /* MARK: Definition Section */
%{
#include<stdio.h>
    // Declare global variables
int letter = 0, word = 0, line = 1;
%}

    /* MARK: Declaration Section */
l [A-Za-z]
newline \n

    /* MARK: Rules Section */
%%
{l}+    {
            if (yyleng >= 6) {
                letter += yyleng;
                word++;
            }
        }
{newline}       { line++; }
[^A-Za-z\n]     {}
%%

    /* MARK: Main Function */
int main() {
    yyin = fopen("q3ip.txt", "r");

    yylex();

    printf("Counts:\n");
    printf("  Characters: %d\n", letter);
    printf("  Words: %d\n", word);
    printf("  Lines: %d\n", line);

    return 0;
}
