    # 1 array, hard coded. One number, user input.
    # Calculate A[0]*x³ + A[1]*x² + A[2]*x¹ + A[3]
.data
arr:    .word   2, 3, 4, 2
powers: .word   3, 2, 1, 0
count:  .word   4
msg1:   .asciiz "Please enter a number: "
msg2:   .asciiz "Result: "

.text
main:
    # init
    la      $s0,        arr
    la      $s1,        powers
    lw      $t0,        count

    # print msg
    la      $a0,        msg1
    addi    $v0,        $zero,  4
    syscall

    # user i/p
    addi    $v0,        $zero,  5
    syscall
    add     $s2,        $zero,  $v0

loop:
    # move num to $t1 (A[i])
    lw      $t1,        0($s0)

    # move jth power to $t2 (P[j])
    lw      $t2,        0($s1)
    # clearing power reg
    addi    $s3,        $zero,  1
    bne     $t2,        $zero,  power_loop

    # cont loop from power_loop
other_loop:
    # A[i]*x^P[j]
    mult    $t1,        $s3
    mflo    $t4
    add     $s4,        $s4,    $t4

    # i++, j++
    addi    $s0,        $s0,    4
    addi    $s1,        $s1,    4

    addi    $t0,        $t0,    -1          # count--
    bne     $t0,        $zero,  loop
    j       exit

power_loop:
    beq     $t2,        $zero,  other_loop

    mult    $s3,        $s2
    mflo    $s3

    addi    $t2,        $t2,    -1          # P[j]--
    j       power_loop

exit:
    # print msg
    la      $a0,        msg2
    addi    $v0,        $zero,  4
    syscall

    # print res
    addi    $v0,        $zero,  1
    add     $a0,        $zero,  $s4
    syscall

    # exit
    addi    $v0,        $zero,  10
    syscall
