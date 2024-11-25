    # Arithmetic Procedures with 2 inputs
    # sum(x, y)
    # difference(x, y)
    # product(x, y)
    # quotient(x, y)

.data
msg1:   .asciiz "Enter x: "
msg2:   .asciiz "Enter y: "
msg3:   .asciiz "The sum is: "
msg4:   .asciiz "\nThe difference is: "
msg5:   .asciiz "\nThe product is: "
msg6:   .asciiz "\nThe quotient is: "

.text
main:
    li      $v0,        4               # syscall to print string
    la      $a0,        msg1            # load address of msg1 into $v0
    syscall

    li      $v0,        5               # syscall to read integer
    syscall
    add     $t1,        $zero,  $v0     # $t1 = $zero + $v0


    li      $v0,        4               # syscall to print string
    la      $a0,        msg2            # load address of msg2 into $v0
    syscall

    li      $v0,        5               # syscall to read integer
    syscall
    add     $t2,        $zero,  $v0     # $t2 = $zero + $v0

    # sum(x, y)
    jal     sum

    # print sum
    add     $t0,        $zero,  $v0     # $t0 = $zero + $v0

    li      $v0,        4               # syscall to print string
    la      $a0,        msg3            # load address of msg3 into $a0
    syscall

    li      $v0,        1               # syscall to print integer
    add     $a0,        $zero,  $t0     # load $t0 into $a0
    syscall

    # difference(x, y)
    jal     difference

    # print difference
    add     $t0,        $zero,  $v0     # $t0 = $zero + $v0

    li      $v0,        4               # syscall to print string
    la      $a0,        msg4            # load address of msg4 into $a0
    syscall

    li      $v0,        1               # syscall to print integer
    add     $a0,        $zero,  $t0     # load $t0 into $a0
    syscall

    # product(x, y)
    jal     product

    # print product
    add     $t0,        $zero,  $v0     # $t0 = $zero + $v0

    li      $v0,        4               # syscall to print string
    la      $a0,        msg5            # load address of msg5 into $a0
    syscall

    li      $v0,        1               # syscall to print integer
    add     $a0,        $zero,  $t0     # load $t0 into $a0
    syscall

    # quotient(x, y)
    jal     quotient

    # print quotient
    add     $t0,        $zero,  $v0     # $t0 = $zero + $v0

    li      $v0,        4               # syscall to print string
    la      $a0,        msg6            # load address of msg6 into $a0
    syscall

    li      $v0,        1               # syscall to print integer
    add     $a0,        $zero,  $t0     # load $t0 into $a0
    syscall

exit:
    li      $v0,        10              # syscall to exit
    syscall

    # sum(x, y)
sum:
    add     $v0,        $t1,    $t2     # $v0 = $t1 + $t2
    jr      $ra                         # jump to $ra

    # difference(x, y)
difference:
    sub     $v0,        $t1,    $t2     # $v0 = $t1 - $t2
    jr      $ra                         # jump to $ra

    # product(x, y)
product:
    mult    $t1,        $t2             # $t1 * $t2 = Hi and Lo registers
    mflo    $v0                         # copy Lo to $v0
    jr      $ra                         # jump to $ra

    # quotient(x, y)
quotient:
    div     $t1,        $t2             # $t1 / $t2
    mflo    $v0                         # $v0 = quotient
    jr      $ra                         # jump to $ra
