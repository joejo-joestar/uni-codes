%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include"endsem.tab.h"

int yyerror(const char* s);


%}

%%
[ \t]   {}
[0-9]+  { yylval.inttype = atoi(yytext); return NUM; }
[a-z]   { strcpy(yylval.reloptype, yytext); return ID; }
"for"   { return FOR; }
"("     { return LP; }
")"     { return RP; }
"<"|">"|"<="|">="|"=="|"!=" { strcpy(yylval.reloptype, yytext); return RELOP; }
"{"     { return LCB; }
"}"     { return RCB; }
"="     { return EQ; }
";"     { return SC; }


%%

int yywrap(){ return 1; }