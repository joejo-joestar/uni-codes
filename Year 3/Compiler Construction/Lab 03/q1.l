    // MARK: Definition Section
%{
#include<stdio.h>
%}

    /* MARK: Declaration Section */
d       [0-9]
newline \n
space   [\t\f\r ]

    /* MARK: Rules Section */
%%
    /* Output Format: <token, lexeme> (length) */
\+          { fprintf(yyout, "<plus, %s>\n", yytext); }
\-          { fprintf(yyout, "<minus, %s>\n", yytext); }
\*          { fprintf(yyout, "<mul, %s>\n", yytext); }
\/          { fprintf(yyout, "<div, %s>\n", yytext); }
\|          { fprintf(yyout, "<abs, %s>\n", yytext); }
{d}+        { fprintf(yyout, "<number, %s> (%d)\n", yytext, yyleng); }
{newline}   { fprintf(yyout, "<newline>\n"); }
{space}     { fprintf(yyout, "<space> (%d)\n", yyleng); } /* whitespace */
.           { fprintf(yyout, "<mystery char, %s>\n", yytext); }
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
