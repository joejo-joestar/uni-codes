    # 2 arrays, hard coded. Multiply elements at the same index and add all the products.
.data
arr1:   .word   1, 2, 3, 4, 5
arr2:   .word   5, 6, 7, 8, 9
count:  .word   5
bye:    .asciiz "The Sum of Products is: "

.text
main:
    # Loading Array Addresses
    la      $s0,    arr1
    la      $s1,    arr2

    lw      $t3,    count
    add     $t2,    $zero,  $zero           # Clearing $t2
    add     $s3,    $zero,  $zero           # Clearing $t2

    # Mult Loop
loop:
    # Loading word from address
    lw      $t0,    0($s0)
    lw      $t1,    0($s1)

    # Multiplying
    mult    $t0,    $t1
    mflo    $t2

    # Adding
    add     $s3,    $s3,    $t2

    # i++, j++
    addi    $s0,    $s0,    4
    addi    $s1,    $s1,    4

    addi    $t3,    $t3,    -1
    bne     $t3,    $zero,  loop

    # Printing O/P
    addi    $v0,    $zero,  4
    la      $a0,    bye
    syscall

    addi    $v0,    $zero,  1
    add     $a0,    $zero,  $s3
    syscall

exit:
    addi    $v0,    $zero,  10
    syscall
