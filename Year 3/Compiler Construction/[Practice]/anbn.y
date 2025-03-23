/* L = {a^nb^n | n >= 0} */
/* Viable I/Ps:
    ab
    aabb
    aaabbb
    aaaabbbb
    ...
*/

%{
#include<stdio.h>
#include<stdlib.h>

int yyerror(char*);
int yylex(void);
%}

%token CHARA CHARB NL

%%

E   :   S NL            { printf("Success!\n"); exit(0); }

S   :   CHARA S CHARB   { printf(" S -> CHARA S CHARB\n"); }
    |                   { printf(" S -> EMPTY \n"); }
    ;

%%

int yyerror(char *s) {
    printf("error: %s\n", s);
    return 0;
}

int main() {
    printf("Enter a string: ");
    yyparse();
    return 0;
}
