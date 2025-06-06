%{
#include<stdio.h>
#include<stdlib.h>

extern FILE *yyin;
int yylex(void);
void yyerror(char*);
%}

%token HEADER INT MAIN LP RP LCP RCP SC VAR COMMA EQ OP

/* MARK: Production Rules */
%%

PGM         : HEADER INT MAIN LP RP LCP BODY RCP    { printf("Parsed Successfully!\n"); }
            ;

BODY        :DECL_STMTS PROG_STMTS                  { printf("BODY -> DECL_STMTS PROG_STMTS\n"); }
            ;

DECL_STMTS  : DECL_STMT                             { printf("DECL_STMTS -> DECL_STMT\n"); }
            | DECL_STMT DECL_STMTS                  { printf("DECL_STMTS -> DECL_STMT DECL_STMTS\n"); }
            |
            ;

PROG_STMTS  : PROG_STMT                             { printf("PROG_STMTS -> PROG_STMT\n"); }
            | PROG_STMT PROG_STMTS                  { printf("PROG_STMTS -> PROG_STMT PROG_STMTS\n"); }
            |
            ;

DECL_STMT   : INT VAR_LIST SC                       { printf("DECL_STMT -> INT VAR_LIST SC\n"); }
            ;

VAR_LIST    : VAR                                   { printf("VAR_LIST -> VAR\n"); }
            | VAR COMMA VAR_LIST                    { printf("VAR_LIST -> VAR COMMA VAR_LIST\n");}  
            ;

PROG_STMT   : VAR EQ EXPR SC                        { printf("PROG_STMT -> VAR EQ EXPR SC\n"); }
            ;

EXPR        : VAR                                   { printf("EXPR -> VAR\n"); }
            | LP EXPR RP                            { printf("EXPR -> LP EXPR RP\n"); }
            | EXPR OP EXPR                          { printf("EXPR -> EXPR OP EXPR\n"); }
            ;

%%

void yyerror(char *s){
    fprintf(stderr, "Error: %s", s);
    exit(1);
}

int main (){
    int testcase = 0;
    printf("Input file number: ");
    scanf("%d", &testcase);

    if (testcase == 11){
        yyin = fopen("tests/1/input1.c", "r");
    }
    else if (testcase == 12){
        yyin = fopen("tests/1/input2.c", "r");
    }
    else if (testcase == 13){
        yyin = fopen("tests/1/input3.c", "r");
    }
    else if (testcase == 14){
        yyin = fopen("tests/1/input4.c", "r");
    }
    else if (testcase == 21){
        yyin = fopen("tests/2/input1.c", "r");
    }
    else if (testcase == 22){
        yyin = fopen("tests/2/input2.c", "r");
    }
    else if (testcase == 23){
        yyin = fopen("tests/2/input3.c", "r");
    }
    else if (testcase == 31){
        yyin = fopen("tests/3/input1.c", "r");
    }
    else if (testcase == 32){
        yyin = fopen("tests/3/input2.c", "r");
    }
    else if (testcase == 33){
        yyin = fopen("tests/3/input3.c", "r");
    }
    else if (testcase == 41){
        yyin = fopen("tests/4/input1.c", "r");
    }
    else if (testcase == 42){
        yyin = fopen("tests/4/input2.c", "r");
    }
    else{
        printf("Invalid input file number\n");
        return 1;
    }

    yyparse();
    return 0;
}
