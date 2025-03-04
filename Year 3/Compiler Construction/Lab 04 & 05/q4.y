%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int yylex(void);
void yyerror(char*);
%}

%union{
    int num;
}

%type <num> E

%token NL <num> INT

/* Assigning Associativity to Tokens */
%left   PLUS MINUS
%left   MUL DIV
%left   LP RP
%right  POW UMINUS

/* MARK: Production Rules */
%%
S   :   E NL                    { printf("S -> %d\n", $1); exit(0); }
    ;
E   :
        INT                     { $$ = $1;             printf("E -> int\n"); }
    |   LP E RP                 { $$ = $2;             printf("E -> (%d)\n"     , $2); }
    |   MINUS E %prec UMINUS    { $$ = -$2;            printf("E -> -%d\n"      , $2); }
    |   E POW E                 { $$ = pow($1, $3);    printf("E -> %d ^ %d\n"  , $1, $3); }
    |   E PLUS E                { $$ = $1 + $3;        printf("E -> %d + %d\n"  , $1, $3); }
    |   E MINUS E               { $$ = $1 - $3;        printf("E -> %d - %d\n"  , $1, $3); }
    |   E DIV E                 { $$ = $1 / $3;        printf("E -> %d / %d\n"  , $1, $3); }
    |   E MUL E                 { $$ = $1 * $3;        printf("E -> %d * %d\n"  , $1, $3); }
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
