.data

    msg1    :,      .asciiz,    "X="
A:  .word   7
B:  .word   6
C:  .word   5
X:  .word   0

.text
main:
    # x = (a - b) + (c - 5)
