%{
#include<stdio.h>
#include<stdlib.h>

int yylex(void);
void yyerror(char*);
%}

%union{
    int num;
}

%type <num> E

%token PLUS MINUS NEWLINE <num> INT

/* MARK: Production Rules */
%%
S   : E NEWLINE     { printf("S -> %d\n", $1); exit(0); }
    ;
E   : E PLUS E      { $$ = $1 + $3; printf("E -> %d + %d\n",$1 ,$3); }
    | E MINUS E     { $$ = $1 - $3; printf("E -> %d - %d\n",$1 ,$3); }
    | INT           { $$ = $1;      printf("E -> int\n"); }
    ;
%%

void yyerror(char *s){
    fprintf(stderr, "Error: %s", s);
    exit(1);
}

int main (){
    printf("Input: ");
    yyparse();
    return 0;
}
