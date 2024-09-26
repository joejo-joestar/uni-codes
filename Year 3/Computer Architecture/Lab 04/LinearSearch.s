    # Search for an element in an array using linear search algorithm
.data
arr:        .word   1, 24, 56, 78, 90, 100, 323, 4326, 57456, 74554
count:      .word   10
msg1:       .asciiz "Enter the element to search for: "
found:      .asciiz "Element found at index: "
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

    lw      $t0,    count                                           # $t0 = count
    la      $s0,    arr
    add     $t2,    $zero,      $zero                               # $t2 = $zero + $zero

loop:
    lw      $t1,    0($s0)                                          # $t1 = arr[i]
    beq     $v0,    $t1,        isFound                             # if v0 == t1, goto isFound

    addi    $t2,    $t2,        1                                   # $t2++
    addi    $s0,    $s0,        4                                   # arr++
    addi    $t0,    $t0,        -1                                  # i--
    bne     $t0,    $zero,      loop                                # if i != 0, goto loop

    # Print the Not Found message
    addi    $v0,    $zero,      4
    la      $a0,    notFound
    syscall

    j       end                                                     # jump to end

isFound:
    # Print the Found message
    addi    $v0,    $zero,      4
    la      $a0,    found
    syscall

    add     $a0,    $zero,      $t2                                 # $v0 = $t2 + 0
    addi    $v0,    $zero,      1
    syscall

end:
    # Exit the program
    addi    $v0,    $zero,      10
    syscall