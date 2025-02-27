%{
#include<stdio.h>
#include<stdlib.h>

int yylex(void);
void yyerror(char*);
%}

%token PLUS MINUS INT NEWLINE

/* MARK: Production Rules */
%%
S   : E NEWLINE     {printf("S -> %d\n", $1); exit(0);}
    ;
E   : E PLUS E      {$$ = $1 + $3; printf("E -> E+E\n");}
    | E MINUS E     {$$ = $1 - $3; printf("E -> E-E\n");}
    | INT           {$$ = $1; printf("E -> int\n");}
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
