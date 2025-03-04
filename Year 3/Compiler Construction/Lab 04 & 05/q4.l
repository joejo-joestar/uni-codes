%{
#include<stdio.h>
#include"q4.tab.h"
%}

d [0-9]
s [\t ]

%%
\n      { return NL; }
{d}+    { yylval.num = atoi(yytext); return INT; }
\^      { return POW; }
\+      { return PLUS; }
\-      { return MINUS; }
\*      { return MUL; }
\/      { return DIV; }
\(      { return LP; }
\)      { return RP; }
{s}+    {}
.       { printf("unrecognized char\n"); }
%%

int yywrap(){
    return 1;
}
