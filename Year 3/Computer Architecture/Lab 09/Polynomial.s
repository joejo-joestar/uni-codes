    # Calculate the value of a polynomial for user input x
    # ax^2 + bx + c

.data
msg1:   .asciiz "Enter the value of x: "
msg2:   .asciiz "The value of the polynomial is: "
A:      .float  2.0
B:      .float  3.0
C:      .float  4.0

.text
main:
    # Input for x
    li      $v0,    4
    la      $a0,    msg1
    syscall

    li      $v0,    6
    syscall

    # Calculation of the polynomial
    lwc1    $f1,    A
    mul.s   $f2,    $f0,    $f0
    mul.s   $f2,    $f1,    $f2

    lwc1    $f1,    B
    mul.s   $f1,    $f0,    $f1
    add.s   $f2,    $f2,    $f1

    lwc1    $f1,    C
    add.s   $f2,    $f2,    $f1

    # Output
    li      $v0,    4
    la      $a0,    msg2
    syscall

    li      $v0,    2
    mov.s   $f12,   $f2
    syscall

    # Exit
    li      $v0,    10
    syscall