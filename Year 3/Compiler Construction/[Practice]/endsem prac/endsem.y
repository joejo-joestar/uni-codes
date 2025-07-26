%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int yylex(void);
int yyerror(const char* s);

typedef struct {
    char op[50];
    char var[50];
    int num;
} Exprs;

Exprs arr[20];

int idx = 0;

void insert_to_table(char* op, char* var, int num) {
    strcpy(arr[idx].op, op);
    strcpy(arr[idx].var, var);
    arr[idx].num = num;
    idx++;
}

int falseval = 0;
char falseop [5];
char falseid [5];

void print_code(){
    for(int i = 0; i < idx; i++) {
        if(strcmp(arr[i].op, "LABEL") == 0 ){
            printf("%s, %s\n", arr[i].op, arr[i].var);
        }
        else if(strcmp(arr[i].op, "IF_FALSE_GOTO")==0){
            printf("IF_FALSE_GOTO, (%s, %s, %d), false\n", falseop, falseid, falseval);
        }
        else if(i==4) {
            continue;
        } else
            printf("%s, %s, %d\n", arr[i].op, arr[i].var, arr[i].num);
    }
    printf("%s, %s, %d\n", arr[4].op, arr[4].var, arr[4].num);
    printf("GOTO, start\n");
    printf("LABEL, false\n");
}

%}

%union{
    char chartype;
    int inttype;
    char reloptype[20];
}

%token FOR LP SC RP LCB RCB EQ  <inttype> NUM <reloptype> RELOP ID
%type <reloptype>expr

%%
S           : for_stmt { print_code(); printf("Valid for loop\n"); exit(0);}
            ;

for_stmt    : FOR LP assign_stmt SC expr SC assign_stmt RP stmt
            ;

assign_stmt : ID EQ NUM { 
    insert_to_table("=", $1, $3);
    // printf("(=,\t%c,\t%d)\n", $1, $3); 
    }
            ;

expr        : ID RELOP NUM { 
    insert_to_table("LABEL", "start", -1);
    insert_to_table($2, $1, $3);
    falseval = $3;
    strcpy(falseid, $1);
    strcpy(falseop, $2);
    // printf("(%s,\t%c,\t%d)\n", $2, $1, $3); printf("(IF_FALSE_GOTO,\t(%s,\t%c,\t%d),\tfalse)\n", $2, $1, $3);
    insert_to_table("IF_FALSE_GOTO", "false", -1); }
            ;

stmt        : LCB stmt_list RCB
            | assign_stmt SC
            ;

stmt_list   : stmt stmt_list
            |
            ;
%%

int yyerror(const char* e){
    fprintf(stderr, "Syntax Error: %s", e);
    exit(1);
}

void main(){
    yyparse();
}
