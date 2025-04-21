%{
#include<stdio.h>
#include<stdlib.h>

int yyerror(char*);
int yylex(void);
%}

%token VAR EQ SQLP SQRP LP RP PRINT COMMA STR

%%

X           :   S X
            |   S

S		    :	E				                { printf("success var declr!\n"); }
			|	P				                { printf("success print stmt!\n"); }
		    ;

EXPR_LINE	:	STR COMMA EXPR_LINE			    { printf("  str, str\n"); }
		    |	STR				            	{ printf("  str\n"); }
		    ;

E		    :	VAR EQ SQLP EXPR_LINE SQRP	    { printf("  var declr\n"); }
		    ; 

P		    :	PRINT LP VAR RP			        { printf("  print stmt\n"); }
		    ;

%%

int yyerror(char *s) {
	fprintf(stderr, "error: %s", s);
	exit(1);
}

int main() {
	yyparse();
	return 1;
}
