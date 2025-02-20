    /* MARK: Definition Section */
%{
#include<stdio.h>
%}

    /* MARK: Declaration Section */
d       [0-9]
odd     [13579]
even    [02468]

    /* MARK: Rules Section */
%%
    /* Output Format: <token, lexeme> (length) */
{d}*{odd}+      { fprintf(yyout, "<odd number, %s> (%d)\n", yytext, yyleng); }
{d}*{even}+     { fprintf(yyout, "<even number, %s> (%d)\n", yytext, yyleng); }
[^0-9]          {}
%%

    /* MARK: AuxilIary Functions */
int yywrap() {
    return 1;
}

    /* MARK: Main Function */
int main() {
    yyin    = fopen("q4ip.txt", "r");
    yyout   = fopen("q4op.txt", "w");
    yylex();
    return 0;
}
