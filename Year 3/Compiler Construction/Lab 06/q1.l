%{
#include<stdio.h>
#include"q1.tab.h"
%}

i [_a-zA-Z0-9]
c [a-zA-Z]

%%

#include\<{i}+\.h\>     { return HEADER; }
[\n\t\r ]               {}
int                     { return INT; }
main                    { return MAIN; }
\(                      { return LP; }
\)                      { return RP; }
\{                      { return LCP; }
\}                      { return RCP; }
;                       { return SC; }
{c}{i}*                 { return VAR; }
,                       { return COMMA; }
=                       { return EQ; }
[/*+-]                  { return OP; }

%%

int yywrap() {
    return 1;
}