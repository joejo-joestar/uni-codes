/* rules */
/* pattern <space> action */
%%
a printf("match found\n");
\n printf("newline found\n");
\t printf("tab found\n");
"while" printf("keyword found\n");
c.t printf("only 3 characters\n");
\. printf("dot found\n");
^con printf("con found at the beginning\n");
te$ printf("te found at the end\n");
[eiou] printf("vowel found\n");
%%
