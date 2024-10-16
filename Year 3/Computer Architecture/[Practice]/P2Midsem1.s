    # User input -> start value, stop value and step value
    # Print the numbers

.data
msg1:   .asciiz "Start Value: "
msg2:   .asciiz "Stop Value: "
msg3:   .asciiz "Step Value: "
space:  .asciiz " "

.text
main:
    # Start Val I/P
    addi    $v0,    $zero,  4
    la      $a0,    msg1
    syscall

    addi    $v0,    $zero,  5
    syscall

    add     $s0,    $zero,  $v0

    # Stop Val I/P
    addi    $v0,    $zero,  4
    la      $a0,    msg2
    syscall

    addi    $v0,    $zero,  5
    syscall

    add     $s1,    $zero,  $v0

    # Step Val I/P
    addi    $v0,    $zero,  4
    la      $a0,    msg3
    syscall

    addi    $v0,    $zero,  5
    syscall

    add     $s2,    $zero,  $v0

loop:
    addi    $v0,    $zero,  1
    add     $a0,    $zero,  $s0
    syscall

    addi    $v0,    $zero,  4
    la      $a0,    space
    syscall

    add     $s0,    $s0,    $s2

    ble     $s0,    $s1,    loop

exit:
    addi    $v0,    $zero,  10
    syscall
