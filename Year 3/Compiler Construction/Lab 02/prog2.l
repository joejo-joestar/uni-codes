    // Definition Section
%{
#include<stdio.h>
%}

    // Declaration Section
d [0-9]
w [a-zA-Z]
i [_a-zA-Z]
c [0-9_a-zA-Z]
s [+-]

    // Rules Section
%%
    /* RegEx <space> Action */
    // Output Format: <token, lexeme> (length)
{w}+                                fprintf(yyout, "<word, %s> (%d)", yytext, yyleng);
{d}+                                fprintf(yyout, "<integer, %s> (%d)", yytext, yyleng);
{i}+{c}*                            fprintf(yyout, "<identifier, %s> (%d)", yytext, yyleng);
{s}?(({d}+\.?{d}*)|({d}*\.?{d}+))   fprintf(yyout, "<float, %s> (%d)", yytext, yyleng);
%%

    // AuxilIary Functions
int yywrap() {
    return 1;
}

    // Main Function
int main() {
    // printf("Enter String: ");
    yyin = fopen("input.txt", "r");
    yyout = fopen("output.txt", "w");
    yylex();
    return 0;
}
