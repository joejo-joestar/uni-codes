%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int yyerror(char*);
int yylex(void);
%}

%union {
    double floatval;
}

%token SIN COS LOG SQRT MINUS RP NL <floatval> PI FLOAT

%right UMINUS LP

%type <floatval> S PRG E

%%

S   :   PRG S
    |   PRG
    ;

PRG :   E NL { printf("result: %f\n\n", $1); }
    ;

E   :   SIN LP E RP             { $$ = sin($3);     printf("  E -> SIN(%f)\n", $3); }
    |   COS LP E RP             { $$ = cos($3);     printf("  E -> COS(%f)\n", $3); }
    |   LOG LP E RP             {
                                    if($3 < 0){ printf("non-positive values cannot be evaluated\n"); };
                                    $$ = log($3);
                                    printf("  E -> LOG(%f)\n", $3);
                                }
    |   SQRT LP E RP            { $$ = sqrt($3);    printf("  E -> SQRT(%f)\n", $3); }
    |   MINUS E %prec UMINUS    { $$ = -$2;         printf("  E -> -%f\n", $2); }
    |   LP E RP                 { $$ = ($2);        printf("  E -> (%f)\n", $2); }
    |   PI                      { $$ = 3.1416;      printf("  E -> %f\n", $$); }
    |   FLOAT                   { $$ = $1;          printf("  E -> %f\n", $$); }
    ;

%%

int yyerror(char *s) {
	fprintf(stderr, "error: %s\n", s);
	exit(1);
}

int main() {
	yyparse();
	return 1;
}
