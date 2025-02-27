%{
#include<stdio.h>
#include"q3.tab.h"
%}

d [0-9]
s [\t ]

%%
\n      {return NEWLINE;}
{d}+    {yylval = atoi(yytext); return INT;}
\+      {return PLUS;}
\-      {return MINUS;}
\*      {return MUL;}
\/      {return DIV;}
\(      {return LP;}
\)      {return RP;}
{s}+    {}
.       {printf("unrecognized char\n");}
%%

int yywrap(){
    return 1;
}
