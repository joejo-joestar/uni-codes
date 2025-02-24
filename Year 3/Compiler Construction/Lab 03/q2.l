    /* MARK: Definition Section */
%{
#include<stdio.h>
    // Declare global variables
int letter = 0, word = 0, line = 1;
%}

    /* MARK: Declaration Section */
l [A-Za-z]

    /* MARK: Rules Section */
%%
{l}+            { letter += yyleng; word++; }
\n              { line++; }
[^A-Za-z\n]     {} /* Ignore all other characters */
%%

    /* MARK: AuxilIary Functions */
int yywrap() {
    return 1;
}

    /* MARK: Main Function */
int main() {
    yyin = fopen("q2ip.txt", "r");

    yylex();

    printf("Counts:\n");
    printf("  Characters: %d\n", letter);
    printf("  Words: %d\n", word);
    printf("  Lines: %d\n", line);

    return 0;
}
