    # Ignore
.data
a:  .word   7
b:  .word   6
c:  .word   5
msg1:    .asciiz "x="

.text
main:
    # x = (a - b) + (c - 5)
