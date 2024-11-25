    # Reverse a String from memory and store in memory
.data
str:    .asciiz "This is a Test String"     # StrLen = 21
msg:    .asciiz "The reversed string is: "
count:  .word   21
rev:    .space  100

.text
main:
    la      $s0,    str
    la      $s1,    rev
    lw      $t1,    count
    add     $s0,    $s0,    $t1
    addi    $s0,    $s0,    -1              # Decrement memory address

loop:
    lb      $t3,    0($s0)                  # Load byte from memory
    sb      $t3,    0($s1)                  # Store byte in memory
    addi    $s0,    $s0,    -1              # Decrement memory address
    addi    $s1,    $s1,    1               # Increment memory address
    addi    $t1,    $t1,    -1              # Decrement counter
    bne     $t1,    $zero,  loop            # If byte is not zero, loop

exit:
    la      $a0,    msg
    li      $v0,    4
    syscall

    la      $a0,    rev
    li      $v0,    4
    syscall

    li      $v0,    10
    syscall

