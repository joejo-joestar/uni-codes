    # Perform Linear Search on an array of integers using leaf-procedures

.data
arr:    .word   5, 12, 7, 9, 20, 15, 3, 8, 11, 6
size:   .word   10
msg1:   .asciiz "Enter the number to search: "
msg2:   .asciiz "The number is found at index: "
msg3:   .asciiz "The number is not found."

.text
main:
    la      $a0,            msg1                    # load address of msg1 to $a0
    li      $v0,            4                       # System call 4 - Print String
    syscall                                         # execute

    li      $v0,            5                       # System call 5 - Read Integer
    syscall                                         # execute
    add     $t0,            $zero,  $v0             # save the input number to $t0

    la      $a0,            arr                     # load address of arr to $a0
    lw      $a1,            size                    # load size of arr to $a1
    add     $a2,            $zero,  $t0             # load the input number to $a2

    # Linear_Search(&arr, size, input)
    jal     Linear_Search                           # jump to Linear_Search and save position to $ra

exit:
    addi    $v0,            $0,     10              # System call 10 - Exit
    syscall                                         # execute

    # Linear_Search(&arr, size, input)
Linear_Search:
    li      $t1,            0                       # initialize $t1 to 0
    li      $t2,            0                       # initialize $t2 to 0

    lw      $t3,            0($a0)                  # load arr[0] to $t3

loop:
    beq     $t1,            $a1,    not_found       # if $t1 == size, then not found
    beq     $t3,            $a2,    found           # if $t3 == input, then found

    addi    $t1,            $t1,    1               # increment $t1 by 1
    addi    $a0,            $a0,    4               # increment $a0 by 4
    lw      $t3,            0($a0)                  # load arr[$t2] to $t3
    j       loop                                    # jump to loop

not_found:
    addi    $v0,            $zero,  4               # System call 4 - Print String
    la      $a0,            msg3                    # load address of msg3 to $a0
    syscall                                         # execute
    jr      $ra                                     # jump to $ra

found:
    addi    $v0,            $zero,  4               # System call 4 - Print String
    la      $a0,            msg2                    # load address of msg2 to $a0
    syscall                                         # execute

    add     $a0,            $zero,  $t1             # load $t1 to $a0
    li      $v0,            1                       # System call 1 - Print Integer
    syscall                                         # execute
    
    jr      $ra                                     # jump to $ra
