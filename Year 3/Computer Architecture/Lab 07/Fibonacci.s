    # Fibonacci series
.data
msg:    .asciiz "Enter the number of terms: "
delim:  .asciiz " "

.text
main:
    # Print the message
    li      $v0,        4
    la      $a0,        msg
    syscall

    # Read the number of terms
    li      $v0,        5
    syscall
    # $t0 and $a3 stores count of terms
    addi     $a3,        $v0,  -1

    # Initialize $t1 and $t2
    li      $t1,        0
    li      $t2,        1

    # Print the first two terms
    li      $v0,        1
    add     $a0,        $zero,  $t1
    syscall

    # Printing Gap
    li      $v0,        4
    la      $a0,        delim
    syscall

    li      $v0,        1
    add     $a0,        $zero,  $t2
    syscall

    # Printing Gap
    li      $v0,        4
    la      $a0,        delim
    syscall

    # Initialize $a0 and $a1
    li      $a0,        0
    li      $a1,        1

loop:
    # Decrement the count of terms
    addi    $a3,        $a3,    -1
    beq     $a3,        $zero,  exit

    jal     Fibonacci                           # jump to Fibonacci and save position to $ra

    j       loop

exit:
    addi    $v0,        $0,     10              # System call 10 - Exit
    syscall                                     # execute

    # Fibonacci($a0, $a1, $t0)
Fibonacci:
    add     $t3,        $a0,    $a1
    # Print the next term
    li      $v0,        1
    add     $a0,        $zero,  $t3
    syscall

    # Printing Gap
    li      $v0,        4
    la      $a0,        delim
    syscall

    add     $a0,        $a1,    $zero
    add     $a1,        $t3,    $zero

    jr      $ra