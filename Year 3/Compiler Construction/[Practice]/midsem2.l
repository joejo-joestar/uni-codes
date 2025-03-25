%{
#include<stdio.h>
#include"midsem2.tab.h"

int yyerror(char*);
%}

d [0-9]

%%
[\t\r ]			                    {}
\n                                  { return NL; }
sin                                 { return SIN; }
cos                                 { return COS; }
log                                 { return LOG; }
sqrt                                { return SQRT; }
\(			                        { return LP; }
\)			                        { return RP; }
\-                                  { return MINUS; }
{d}*\.?{d}+([eE][+-]?{d}*\.{d}+)?   { yylval.floatval = atof(yytext); return FLOAT; }
pi                                  { return PI; }
.			                        { yyerror("invalid!"); }
%%

int yywrap(){
	return 1;
}
