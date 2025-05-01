%{
#include<stdio.h>
#include<stdlib.h>
#include<ctype.h>
#include<string.h>

int yylex(void);
int yyerror(const char *s);


struct expr { char operand1, operand2, op, res; int num1, num2; } expression[20];
char temp = 'A' - 1;
int index1 = 0;

char addtotable(char a, char b, char op, int num_a, int num_b) {
    temp++;
    expression[index1] = (struct expr){a, b, op, temp, num_a, num_b};
    index1++;
    return temp;
}

void print_res() {
    printf("\nThree Addr Code:\n");
    for(int i = 0; i < index1; i++) {
        if(expression[i].op == '#') {
            printf("%c := \t %d\n", expression[i].res, expression[i].num1);
        }
        else if(expression[i].op == '=') {
            printf("%c := \t %c\n", expression[i].res, expression[i].operand1);
        }
        else {
            printf("%c := \t %c \t %c \t %c\n",
            expression[i].res,
            expression[i].operand1,
            expression[i].op,
            expression[i].operand2);
        }
    }

    printf("\nQuadruple:\n");
    for (int i = 0; i < index1; i++){
        if(expression[i].op == '#'){
            printf("const \t %d \t %c\n", expression[i].num1, expression[i].res);
        }
        else {
            printf("%c \t %c \t %c \t %c\n",
                expression[i].op,
                expression[i].operand1,
                expression[i].operand2,
                expression[i].res);
        }
    }

    printf("\nTriples:\n");
    for(int i = 0; i < index1; i++) {
        printf("%c \t", expression[i].op);
        if(expression[i].op == '#') {
            printf("%d \t\n", expression[i].num1);
        }
        else {
            printf(isupper(expression[i].operand1) ? "pointer(%d) \t" : "%c \t", isupper(expression[i].operand1) ? expression[i].operand1 - 'A' : expression[i].operand1);
            printf(isupper(expression[i].operand2) ? "pointer(%d)\n" : "%c\n", isupper(expression[i].operand2) ? expression[i].operand2 - 'A' : expression[i].operand2);
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
LINE        :   STATEMENT NL       { print_res(); index1 = 0; temp = 'A' - 1; }
            |   STATEMENT SC NL    { print_res(); index1 = 0; temp = 'A' - 1; }
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
