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
#include"anbn.tab.h"
%}

%%

\n      { return NL; }
[\t ]   {}
[Aa]    { return CHARA; }
[Bb]    { return CHARB; }



%%

int yywrap() {
    return 1;
}
