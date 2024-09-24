.data
arr:    .word   1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
count:  .word   10
crlf:   .asciiz "\n"

.text
main:
    la      $t0,    arr                                         # load the base address of the array
    lw      $t1,    count                                       # load the number of elements in the array

loop:
    # Print the element
    lw      $a0,    0($t0)
    addi    $v0,    $zero,  1
    syscall

# Print a newline
    la      $a0,    crlf
    addi    $v0,    $zero,  4
    syscall

    addi    $t0,    $t0,    4                                   # $t0++

    addi    $t1,    $t1,    -1                                  # $t1--
    bne     $t1,    $zero,  loop                                # if $t1 != 0, continue the loop

    # Exit the program
    li      $v0,    10
    syscall
