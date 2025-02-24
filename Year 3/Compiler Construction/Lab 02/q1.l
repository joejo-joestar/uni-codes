    /* MARK: Definition Section */
%{
#include<stdio.h>
%}

    /* MARK: Declaration Section */
d [0-9]
w [a-zA-Z]
i [_a-zA-Z]
s [+-]

    /* MARK: Rules Section */
%%
    /* Output Format: <token, lexeme> (length) */
{w}+                                                fprintf(yyout, "<word, %s> (%d)", yytext, yyleng);
{d}+                                                fprintf(yyout, "<integer, %s> (%d)", yytext, yyleng);
{i}+({i}|{d})*                                      fprintf(yyout, "<identifier, %s> (%d)", yytext, yyleng);
(({d}+\.?{d}*)|({d}*\.?{d}+))([eE]{s}?{d}+)?        fprintf(yyout, "<unsigned float, %s> (%d)", yytext, yyleng);
{s}?(({d}+\.?{d}*)|({d}*\.?{d}+))([eE]{s}?{d}+)?    fprintf(yyout, "<signed float, %s> (%d)", yytext, yyleng);
%%

    /* MARK: AuxilIary Functions */
int yywrap() {
    return 1;
}

    /* MARK: Main Function */
int main() {
    yyin    = fopen("q1ip.txt", "r");
    yyout   = fopen("q1op.txt", "w");
    yylex();
    return 0;
}
