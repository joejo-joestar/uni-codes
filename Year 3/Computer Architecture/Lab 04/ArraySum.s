.data
arr1:   .word   1, 2, 3, 4, 5
arr2:   .word   6, 7, 8, 9, 10
sum:    .word   0, 0, 0, 0, 0

.text
main:
    la      $s0,    arr1
    la      $s1,    arr2
    la      $s2,    sum
    addi    $t3,    $zero,  5       # $t3 = $zero + 5

loop:
    lw      $t0,    0($s0)          # $t0 = arr1[i]
    lw      $t1,    0($s1)          # $t1 = arr2[i]
    add     $t2,    $t0,    $t1     # $t2 = $t0 + $t1
    sw      $t2,    0($s2)          # sum[i] = $t2
    addi    $s0,    $s0,    4       # arr1++
    addi    $s1,    $s1,    4       # arr2++
    addi    $s2,    $s2,    4       # sum++
    addi    $t3,    $t3,    -1      # i--
    bne     $t3,    $zero,  loop    # if i != 0, goto loop

    li      $v0,    10
    syscall
