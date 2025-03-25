%{
#include<stdio.h>
#include"midsem1.tab.h"

int yyerror(char*);
%}

%%
[\t\r ]			    {}
print			    { return PRINT; }
\=			        { return EQ; }
[_a-z0-9]		    { return VAR; }
\[			        { return SQLP; }
\]			        { return SQRP; }
\(			        { return LP; }
\)			        { return RP; }
\,			        { return COMMA; }
(\".*\")|(\'.*\')	{ return STR; }
.			        { yyerror("invalid!"); }
%%

int yywrap(){
	return 1;
}
