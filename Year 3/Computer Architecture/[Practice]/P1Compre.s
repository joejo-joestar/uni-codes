    # User inp limit
    # sum all Cube all even numbers within limit using leaf procedure

.data
msg1:   .asciiz "Enter a Limit: "
msg2:   .asciiz "Result: "

.text
main:
    # print msg
    li      $v0,    4
    la      $a0,    msg1
    syscall

    # read int
    li      $v0,    5
    syscall
    add     $a0,    $zero,  $v0

    jal     foo

    # exit

    move    $t0,    $v0

    li      $v0,    4
    la      $a0,    msg2
    syscall

    li      $v0,    1
    move    $a0,    $t0
    syscall

    li      $v0,    10
    syscall

    # foo(limit)
    # foo(7)
foo:
    li      $t0,    2
    div     $a0,    $t0
    mflo    $t0

    li      $t1,    1
    li      $t2,    2

    # Accum
    add     $v0,    $zero,  $zero
loop:
    addi    $t0,    $t0,    -1
    blt     $t0,    $zero,  exit

    addi    $t1,    $t1,    1
    div     $t1,    $t2
    mfhi    $t3
    bne     $t3,    $0,     loop

    # even_loop:
    move    $t4,    $t1
    mul     $t1,    $t1,    $t4
    mul     $t1,    $t1,    $t4

    add     $v0,    $v0,    $t1

    move    $t1,    $t4

    addi    $t1,    $t1,    1
    j       loop

exit:
    # exit proc
    jr      $ra
