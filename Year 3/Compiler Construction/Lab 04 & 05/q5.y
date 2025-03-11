%{
#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int yylex(void);
void yyerror(char*);
%}

%union{
    int     intval;
    float   floatval;
}

%type <floatval> F <intval> I

%token NL <floatval> FLOAT <intval> INT

/* Assigning Associativity to Tokens */
%left   PLUS MINUS
%left   MUL DIV
%left   LP RP
%right  UMINUS UPLUS
%right  POW


/* MARK: Production Rules */
%%
S   :   I NL                    { printf("S -> (int)%d\n"     , $1); exit(0); }
    |   F NL                    { printf("S -> (float)%.5f\n" , $1); exit(0); }
    ;

I   :
        INT                     { $$ = $1;             printf("I -> (int)%d\n"    , $1); }
    |   LP I RP                 { $$ = $2;             printf("I -> (%d)\n"       , $2); }
    |   MINUS I %prec UMINUS    { $$ = -$2;            printf("I -> -%d\n"        , $2); }
    |   PLUS I %prec UPLUS      { $$ = +$2;            printf("I -> +%d\n"        , $2); }
    |   I POW I                 { $$ = pow($1, $3);    printf("I -> %d ^ %d\n"  , $1, $3); }
    |   I PLUS I                { $$ = $1 + $3;        printf("I -> %d + %d\n"  , $1, $3);}
    |   I MINUS I               { $$ = $1 - $3;        printf("I -> %d - %d\n"  , $1, $3);}
    |   I DIV I                 { $$ = $1 / $3;        printf("I -> %d / %d\n"  , $1, $3);}
    |   I MUL I                 { $$ = $1 * $3;        printf("I -> %d * %d\n"  , $1, $3);}
    ;

F   :
        FLOAT                   { $$ = $1;             printf("F -> (float)%.5f\n"  , $1); }
    |   INT                     { $$ = $1;             printf("F -> (int)%d\n"      , $1); }
    |   LP F RP                 { $$ = $2;             printf("F -> (%.5f)\n"       , $2); }
    |   MINUS F %prec UMINUS    { $$ = -$2;            printf("F -> -%.5f\n"        , $2); }
    |   PLUS F %prec UPLUS      { $$ = +$2;            printf("F -> +%.5f\n"        , $2); }
    |   F POW F                 { $$ = pow($1, $3);    printf("F -> %.5f ^ %.5f\n"  , $1, $3); }
    |   F PLUS F                { $$ = $1 + $3;        printf("F -> %.5f + %.5f\n"  , $1, $3);}
    |   F MINUS F               { $$ = $1 - $3;        printf("F -> %.5f - %.5f\n"  , $1, $3);}
    |   F DIV F                 { $$ = $1 / $3;        printf("F -> %.5f / %.5f\n"  , $1, $3);}
    |   F MUL F                 { $$ = $1 * $3;        printf("F -> %.5f * %.5f\n"  , $1, $3);}
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
