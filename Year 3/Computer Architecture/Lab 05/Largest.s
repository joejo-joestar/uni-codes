    # Find the largest element in an array
.data
arr:        .word   1, 24, 56, 78, 90, 74554, 57456, 100, 323, 4326
count:      .word   10
largest:    .asciiz "Largest element: "

.text
main:
    lw      $t0,    count                                           # $t0 = count
    la      $s0,    arr                                             # $s0 = &arr[0]

    lw      $t2,    0($s0)                                          # $t2 = arr[0]

loop:
    lw      $t1,    0($s0)                                          # $t1 = arr[i]
    bgt     $t1,    $t2,        isLarger                            # if $t1 > $t2 then goto isLarger

    addi    $s0,    $s0,        4                                   # arr++
    addi    $t0,    $t0,        -1                                  # i--
    bne     $t0,    $zero,      loop                                # if i != 0, goto loop

    j       end                                                     # jump to end

isLarger:
    add     $t2,    $zero,      $t1                                 # $t1 = $t2 + 0
    addi    $s0,    $s0,        4                                   # arr++
    addi    $t0,    $t0,        -1                                  # i--
    bne     $t0,    $zero,      loop                                # if i != 0, goto loop

end:
    # Print the Found message
    addi    $v0,    $zero,      4
    la      $a0,    largest
    syscall

    add     $a0,    $zero,      $t2                                 # $a0 = $t2 + 0
    addi    $v0,    $zero,      1
    syscall

    # Exit the program
    addi    $v0,    $zero,      10
    syscall
