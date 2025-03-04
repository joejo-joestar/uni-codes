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

%token LP RP PLUS MINUS MUL DIV NEWLINE <num> INT

/* Assigning Associativity to Tokens */
%left PLUS MINUS
%left MUL DIV
%left LP RP

/* MARK: Production Rules */
%%
S   :   E NEWLINE     { printf("S -> %d\n", $1); exit(0); }
    ;
E   :
        INT           { $$ = $1;        printf("E -> int\n"); }
    |   LP E RP       { $$ = $2;        printf("E -> (%d)\n"    , $2);  }
    |   E PLUS E      { $$ = $1 + $3;   printf("E -> %d + %d\n" , $1, $3); }
    |   E MINUS E     { $$ = $1 - $3;   printf("E -> %d - %d\n" , $1, $3); }
    |   E DIV E       { $$ = $1 / $3;   printf("E -> %d / %d\n" , $1, $3); }
    |   E MUL E       { $$ = $1 * $3;   printf("E -> %d * %d\n" , $1, $3); }
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
