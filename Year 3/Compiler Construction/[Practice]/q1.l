%{
#include<stdio.h>
#include"q1.tab.h"
%}

%%
= {return EQ;}
id {return ID;}
\* {return STAR;}
%%

int yywrap(){
    return 1;
}