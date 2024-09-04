.data
msg1:   .asciiz "Enter the first number: "
msg2:   .asciiz "Enter the second number: "
msg3:   .asciiz "The sum is: "

.text
main:
    addi    $v0,    $zero,  4
    la      $a0,    msg1
    syscall

    addi    $v0,    $zero,  5
    syscall

    add     $t0,    $v0,    $zero           # Move fist num to t0

    addi    $v0,    $zero,  4
    la      $a0,    msg2
    syscall

    addi    $v0,    $zero,  5
    syscall

    add     $t1,    $v0,    $zero           # Move 2nd num to t1

    add     $s0,    $t0,    $t1             # Store sum in s0

    addi    $v0,    $zero,  4
    la      $a0,    msg3
    syscall

    addi    $v0,    $zero,  1
    add     $a0,    $s0,    $zero           # print sum
    syscall

    addi    $v0,    $zero,  10
    syscall
