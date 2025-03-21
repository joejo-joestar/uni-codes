%{
#include<stdio.h>
#include<stdlib.h>

int yylex(void);
void yyerror(char*);
%}

%token EQ ID STAR

%%
S       : L EQ R
        | R
        ;
L       : STAR R
        | ID
        ;
R       : L
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