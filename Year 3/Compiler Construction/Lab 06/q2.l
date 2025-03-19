%{
#include<stdio.h>
#include"q2.tab.h"

void yyerror(char *);
%}

i [_a-zA-Z0-9]
c [a-zA-Z]

%%

#include\<{i}+\.h\>         { return HEADER; }
[\n\t\r ]                   {}
int                         { return INT; }
float                       { return FLOAT; }
char                        { return CHAR; }
main                        { return MAIN; }
\(                          { return LP; }
\)                          { return RP; }
\{                          { return LCP; }
\}                          { return RCP; }
;                           { return SC; }
(if)|(while)|(do)|(for)     { yyerror("invalid variable name"); }
{c}{i}*                     { return VAR; }
,                           { return COMMA; }
=                           { return EQ; }
[/*+-]                      { return OP; }

%%

int yywrap() {
    return 1;
}