    # ⚠️ Incomplete ⚠️
    # User Input String is a Palindrome or Not
.data
str:    .space  100
msg:    .asciiz "Enter a string: "
msg1:   .ascii  "Not"
msg2:   .asciiz "Palindrome"

.text
main:
    # Print the message
    addi    $v0,    $zero,  4
    la      $a0,    msg
    syscall

    # Read the string
    addi    $v0,    $zero,  8
    la      $a0,    str
    addi    $a1,    $zero,  100
    syscall

    # Find the Length of a string stored in memory
    la      $s0,    str
    add     $t1,    $zero,  $zero           # $t1 = $zero + $zero

loop:
    lb      $t3,    0($s0)                  # Load byte from memory
    beq     $t3,    $zero,  check           # If byte is zero, exit
    addi    $s0,    $s0,    1               # Increment memory address
    addi    $t1,    $t1,    1               # Increment counter
    j       loop

check:
    # Check if the string is a Palindrome
    # addi    $t1,    $t1,    -1
    add     $t2,    $zero,  $t1
    la      $s0,    str
    add     $s1,    $s1,    $t1

loop1:
    beq     $s0,    $t2,    print           # If $s0 == $t2, print
    lb      $t3,    0($s0)                  # Load byte from memory
    lb      $t4,    0($s1)                  # Load byte from memory
    bne     $t3,    $t4,    not_palindrome  # If byte is not equal, not_palindrome
    addi    $s0,    $s0,    1               # Increment memory address
    addi    $s1,    $s1,    -1              # Decrement memory address
    j       loop1

not_palindrome:
    # Print the message
    addi    $v0,    $zero,  4
    la      $a0,    msg1
    syscall

    j       exit

print:
    # Print the message
    addi    $v0,    $zero,  4
    la      $a0,    msg2
    syscall

exit:
    li      $v0,    10
    syscall
