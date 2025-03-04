%{
#include<stdio.h>
#include"q1.tab.h"
%}

d [0-9]
s [\t ]

%%
\n      { return NEWLINE; }
{d}+    { yylval.num = atoi(yytext); return INT; }
\+      { return PLUS; }
\-      { return MINUS; }
{s}+    {}
.       { printf("unrecognized char\n"); }
%%

int yywrap(){
    return 1;
}
