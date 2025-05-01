%option yylineno

%{
#include<stdio.h>
#include"q1.tab.h"
%}

d [0-9]
c [a-z]

%%
\n       { return NL; }
{c}      { yylval.varval = yytext[0]; return VAR; }
{d}+     { yylval.intval = atoi(yytext); return INT; }
\+       { return PLUS; }
\-       { return MINUS; }
\*       { return MUL; }
\/       { return DIV; }
\(       { return LP; }
\)       { return RP; }
\=       { return EQ; }
\;       { return SC; }
[\t ]+   {}
.        { printf("unrecognized char\n"); }
%%

int yywrap(){
    return 1;
}
