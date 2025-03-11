%{
#include<stdio.h>
#include"q5.tab.h"
%}

d [0-9]
s [+-]

%%
\n                                              { return NL; }
{d}+                                            { yylval.intval = atoi(yytext); return INT; }
(({d}+\.?{d}*)|({d}*\.?{d}+))([eE]{s}?{d}+)?    { yylval.floatval = atof(yytext); return FLOAT; }
\^                                              { return POW; }
\+                                              { return PLUS; }
\-                                              { return MINUS; }
\*                                              { return MUL; }
\/                                              { return DIV; }
\(                                              { return LP; }
\)                                              { return RP; }
[\t ]+                                          {}
.                                               { printf("unrecognized char\n"); }
%%

int yywrap(){
    return 1;
}
