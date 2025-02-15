/* Rules Section */
/* RegEx <space> Action */
%%
    // Regex Definitions (in order)
    // Character 'f'
    // Any Vowel
    // Newline and Tab
    // Period ('.') Character
    // Keyword "while"
    // Word with 3 characters starting with c and ending with t
    // Word starting with con
    // Word ending with te

f           printf("`f` found\n");

[aeiou]     printf("vowel found\n");

\n          printf("newline found\n");
\t          printf("tab found\n");

\.          printf("dot found\n");

"while"     printf("\"while\" keyword found\n");

c.t         printf("only 3 characters (Starting with 'c' and ending with 'n') found\n");

^con        printf("\"con\" found at the beginning\n");

te$         printf("\"te\" found at the end\n");
%%
