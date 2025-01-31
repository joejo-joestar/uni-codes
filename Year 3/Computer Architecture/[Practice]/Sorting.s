.data
arr:    .word   2, 4, 1, 5
count:  .word   4
sorted: .word   0, 0, 0, 0
msg1:   .asciiz "Array: "
msg2:   .asciiz "Sorted Array: "
crlf:   .asciiz "\n"
space:  .asciiz " "

.text
main:
    la      $s0,    arr
    la      $s1,    sorted
    lw      $s2,    count

    la      $a0,    msg1
    addi    $v0,    $zero,  4
    syscall

print_arr:
    lw      $a0,    0($s0)
    addi    $v0,    $zero,  1
    syscall

    la      $a0,    space
    addi    $v0,    $zero,  4
    syscall

    addi    $s0,    $s0,    4
    addi    $s2,    $s2,    -1

    bne     $s2,    $zero,  print_arr

    # Sorting Logic

loop1:
    # for (i=0; i<count); i++{
    #   for (j=0; j<count-i; j++){
    #       if(a[i] > a[j]){switch}
    #       break
    #   }
    # }
    bne     $


    # Printing Sorted array
    lw      $s2,    count

    la      $a0,    crlf
    addi    $v0,    $zero,  4
    syscall

    la      $a0,    msg2
    addi    $v0,    $zero,  4
    syscall

print_sarr:
    lw      $a0,    0($s1)
    addi    $v0,    $zero,  1
    syscall

    la      $a0,    space
    addi    $v0,    $zero,  4
    syscall

    addi    $s1,    $s1,    4
    addi    $s2,    $s2,    -1

    bne     $s2,    $zero,  print_sarr

exit:
    addi    $v0,    $zero,  10
    syscall