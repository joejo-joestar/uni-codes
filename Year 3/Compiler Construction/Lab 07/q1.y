%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
int yylex(void);
int yyerror(const char *s);
int success = 1;
int current_data_type;
int expn_type = -1;
int temp;
struct symbol_table { char var_name[30]; int type; } var_list[20];	// you may associate an integer with a datatype (say var_list[i].type=1 may imply that variable var_list[i].var_name is of type int) and store that integer against the variable whenever you deal with a declaration statement
int var_count = 0;													// number of entries in the symbol table
extern int lookup_in_table(char var[30]);							// returns the data type associated with the variable name being passed to, returns -1 if in case the variable is undeclared
extern void insert_to_table(char var[30], int type);				// adds a new variable along with its data type to the table and terminates with a "multiple declaration error message", if in case the variable is already being defined
extern FILE *yyin;
%}

%union {
    int data_type;
    char var_name[30];
}

%token HEADER MAIN LB RB LCB RCB SC COMMA EQ OP <var_name> VAR <data_type> INT CHAR FLOAT DOUBLE

%type <data_type> DATA_TYPE

%start PGM

%%

PGM						:	HEADER MAIN_TYPE MAIN LB RB LCB BODY RCB 		{ printf("\tparsing successful\n"); }
                        ;

BODY					: 	DECLARATION_STATEMENTS PROGRAM_STATEMENTS
                        ;

DECLARATION_STATEMENTS 	: 	DECLARATION_STATEMENT DECLARATION_STATEMENTS  	{ printf("\tdeclaration section successfully parsed\n"); }
                        | 	DECLARATION_STATEMENT
                        ;

PROGRAM_STATEMENTS 		: 	PROGRAM_STATEMENT PROGRAM_STATEMENTS 			{ printf("\tprogram statements successfully parsed\n"); }
                        | 	PROGRAM_STATEMENT
                        ;

DECLARATION_STATEMENT	: 	DATA_TYPE VAR_LIST SC
                        ;

VAR_LIST 				: 	VAR COMMA VAR_LIST 								{ insert_to_table($1, current_data_type); }
                        | 	VAR 											{ insert_to_table($1, current_data_type); }
                        ;

PROGRAM_STATEMENT 		: 	VAR EQ A_EXPN SC
                        ;

A_EXPN					: 	A_EXPN OP A_EXPN
                        | 	LB A_EXPN RB
                        | 	VAR 											{ 	expn_type = -1;
                                                                                temp = lookup_in_table($1);
                                                                                if((temp) == -1) {
                                                                                    printf("\tvariable \"%s\" undeclared\n",$1);
                                                                                    exit(1);
                                                                                }
                                                                                if(expn_type != -1 && expn_type != temp) {
                                                                                    printf("\ttype mismatch in the expression\n");
                                                                                    exit(1);
                                                                                }
                                                                            }
                        ;

MAIN_TYPE 				: 	INT
                        ;

DATA_TYPE 				: 	INT 											{ $$ = $1; current_data_type = $1; }
                        | 	CHAR 											{ $$ = $1; current_data_type = $1; }
                        | 	FLOAT											{ $$ = $1; current_data_type = $1; }
                        | 	DOUBLE											{ $$ = $1; current_data_type = $1; }
                        ;

%%

int lookup_in_table(char var[30]) {
    for (int i = 0; i < var_count; i++){
        if (strcmp(var_list[i].var_name, var) == 0)
            return var_list[i].type;
    }
    return -1;
}

void insert_to_table(char var[30], int type) {
    if (var_count >= 20) {
        yyerror("table full!");
    }
    if (lookup_in_table(var) != -1) {
        yyerror("duplicate entry!");
    }
    strcpy(var_list[var_count].var_name, var);
    var_list[var_count].type = type;
    var_count++;
}

int main() {
    yyin = fopen("input2.c", "r");
    yyparse();
    return 0;
}

int yyerror(const char *msg) {
    extern int yylineno;
    printf("Parsing Failed\nLine Number [%d] : %s\n", yylineno, msg);
    success = 0;
    exit(1);
    return 0;
}
