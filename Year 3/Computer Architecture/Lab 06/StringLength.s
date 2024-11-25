    # Find the Length of a string stored in memory
.data
str:    .asciiz "This is a Test String"         # StrLen = 21
msg:    .asciiz "The length of the string is: "

.text
main:
    la      $s0,    str
    add     $t1,    $zero,  $zero               # $t1 = $zero + $zero

loop:
    lb      $t3,    0($s0)                      # Load byte from memory
    beq     $t3,    $zero,  exit                # If byte is zero, exit
    addi    $s0,    $s0,    1                   # Increment memory address
    addi    $t1,    $t1,    1                   # Increment counter
    j       loop

exit:
    # Print the message
    li      $v0,    4
    la      $a0,    msg
    syscall

    # Print the length
    li      $v0,    1
    add     $a0,    $t1,    $zero               # $a0 = $t1 + $zero
    syscall

    li      $v0,    10
    syscall
