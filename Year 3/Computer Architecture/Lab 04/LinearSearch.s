.data
arr:        .word   1, 2, 3, 4, 5
msg1:       .asciiz "Enter the element to search for: "
found:      .asciiz "Element found!"
notFound:   .asciiz "Element not found!"

.text
main:
    # Print the message
    addi    $v0,    $zero,      4
    la      $a0,    msg1
    syscall

    # Read the element to search for
    addi    $v0,    $zero,      5
    syscall

    addi    $t0,    $zero,      5                       # $t0 = $zero + 5
    la      $s0,    arr

loop:
    lw      $t1,    0($s0)                              # $t1 = arr[i]
    beq     $v0,    $t1,        isFound                 # if v0 == t1, goto isFound

    addi    $s0,    $s0,        4                       # arr++
    addi    $t0,    $t0,        -1                      # i--
    bne     $t0,    $zero,      loop                    # if i != 0, goto loop

    # Print the Not Found message
    addi    $v0,    $zero,      4
    la      $a0,    notFound
    syscall

    j       end                                         # jump to end

isFound:
    # Print the Found message
    addi    $v0,    $zero,      4
    la      $a0,    found
    syscall

end:
    # Exit the program
    addi    $v0,    $zero,      10
    syscall