%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>

int yylex(void);
int yyerror(const char *s);

struct expr { char oper1, oper2, op, res; int num1, num2; } expr[20];
char temp = 'A' - 1;
int idx = 0;

char addtotable(char a, char b, char op, int num_a, int num_b) {
    temp++;
    expr[idx] = (struct expr){a, b, op, temp, num_a, num_b};
    idx++;
    return temp;
}

void print_res() {
    printf("\nThree Addr Code:\n");
    for(int i = 0; i < idx; i++) {
        if(expr[i].op == '#') {
            printf("%c := \t %d\n", expr[i].res, expr[i].num1);
        }
        else if(expr[i].op == '=') {
            printf("%c := \t %c\n", expr[i].res, expr[i].oper1);
        }
        else {
            printf("%c := \t %c \t %c \t %c\n",
                expr[i].res,
                expr[i].oper1,
                expr[i].op,
                expr[i].oper2
            );
        }
    }

    printf("\nQuadruple:\n");
    for (int i = 0; i < idx; i++){
        if(expr[i].op == '#'){
            printf("const \t %d \t %c\n", expr[i].num1, expr[i].res);
        }
        else {
            printf("%c \t %c \t %c \t %c\n",
                expr[i].op,
                expr[i].oper1,
                expr[i].oper2,
                expr[i].res
            );
        }
    }

    printf("\nTriples:\n");
    for(int i = 0; i < idx; i++) {
        printf("%c \t", expr[i].op);
        if(expr[i].op == '#') {
            printf("%d \t\n", expr[i].num1);
        }
        else {
            printf(isupper(expr[i].oper1) ? "pointer(%d) \t" : "%c \t", isupper(expr[i].oper1) ? expr[i].oper1 - 'A' : expr[i].oper1);
            printf(isupper(expr[i].oper2) ? "pointer(%d)\n" : "%c\n", isupper(expr[i].oper2) ? expr[i].oper2 - 'A' : expr[i].oper2);
        }
    }
}


%}

%union {
    int intval;
    char varval;
}

%token NL LP RP EQ SC <intval> INT <varval> VAR
%left PLUS MINUS
%left DIV MUL

%type <varval> E

%start S

%%

S           :   S LINE
            |
            ;
LINE        :   STATEMENT NL       { print_res(); idx = 0; temp = 'A' - 1; }
            |   STATEMENT SC NL    { print_res(); idx = 0; temp = 'A' - 1; }
            ;
STATEMENT   :   VAR EQ E                { addtotable($3, '\0', '=', 0, 0); }
            ;
E           :
                VAR                     { $$ = $1; }
            |   LP E RP                 { $$ = $2; }
            |   INT                     { char t = addtotable('0' + $1, '\0', '#', $1, 0); $$ = t; }
            |   E PLUS E                { $$ = addtotable($1, $3, '+', 0, 0); }
            |   E MINUS E               { $$ = addtotable($1, $3, '-', 0, 0); }
            |   E DIV E                 { $$ = addtotable($1, $3, '/', 0, 0); }
            |   E MUL E                 { $$ = addtotable($1, $3, '*', 0, 0); }
            ;

%%

int main() {
    printf("Input: ");
    yyparse();
    return 0;
}

int yyerror(const char *msg) {
    extern int yylineno;
    printf("Parsing Failed\nLine Number [%d] : %s\n", yylineno, msg);
    exit(1);
    return 0;
}
