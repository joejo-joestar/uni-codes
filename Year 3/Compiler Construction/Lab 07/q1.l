%option yylineno

%{
#include<stdio.h>
#include<string.h>
#include"q1.tab.h"
#include<math.h>
%}

%%

"#include<stdio.h>"         { return HEADER; }
"if"                        { printf("\tusage of keyword \"%s\" is prohibited\n" ,yytext); exit(0); }
"int"                       { yylval.data_type=0; return INT; }
"char"                      { yylval.data_type=1; return CHAR; }
"float"                     { yylval.data_type=2; return FLOAT; }
"double"                    { yylval.data_type=3; return DOUBLE; }
"main"                      { return MAIN; }
"("                         { return LB; }
")"                         { return RB; }
"{"                         { return LCB; }
"}"                         { return RCB; }
","                         { return COMMA; }
";"                         { return SC; }
[\+\-\*\/]                  { return OP; }
"="                         { return EQ; }
[a-z]+                      { strcpy(yylval.var_name, yytext); return VAR; }
[\n\t ]+                    { /*new line or space*/ }
.                           { printf("\tinvalid character sequence %s\n",yytext); exit(0); }

%%

int yywrap(void) {
    return 1;
}
