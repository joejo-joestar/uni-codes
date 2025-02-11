/* Rules Section */
/* RegEx <space> Action */
%%
    // Character 'f'
f           printf("f found\n");

    // any vowel
[aeiou]     printf("vowel found\n");

    // Newline and Tab
\n          printf("newline found\n");
\t          printf("tab found\n");

    // Period ('.') Character
\.          printf("dot found\n");

    // Keyword "while"
"while"     printf("keyword found\n");

    // Word with 3 characters starting with c and ending with t
c.t         printf("only 3 characters\n");


    // Word starting with con
^con        printf("con found at the beginning\n");

    // Word ending with te
te$         printf("te found at the end\n");
%%
