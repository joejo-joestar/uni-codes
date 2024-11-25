    # Concatenate 2 strings into a new string
.data
str1:   .asciiz "This is a Test String"         # StrLen = 21
str2:   .asciiz "and this is another string"    # StrLen = 27
msg:    .asciiz "The concatenated string is: "
count1: .word   21
count2: .word   27
joined: .space  100

.text
main:
    la      $s0,    str1
    la      $s1,    str2
    la      $s2,    joined
    lw      $t1,    count1
    lw      $t2,    count2

loop:
    lb      $t3,    0($s0)                      # Load byte from memory
    sb      $t3,    0($s2)                      # Store byte in memory
    addi    $s0,    $s0,    1                   # Increment memory address
    addi    $s2,    $s2,    1                   # Increment memory address
    addi    $t1,    $t1,    -1                  # Decrement counter
    bne     $t1,    $zero,  loop                # If byte is not zero, loop

loop1:
    lb      $t3,    0($s1)                      # Load byte from memory
    sb      $t3,    0($s2)                      # Store byte in memory
    addi    $s1,    $s1,    1                   # Increment memory address
    addi    $s2,    $s2,    1                   # Increment memory address
    addi    $t2,    $t2,    -1                  # Decrement counter
    bne     $t2,    $zero,  loop1               # If byte is not zero, loop

    addi    $s2,    $s2,    -1                  # Decrement memory address
    sb      $zero,  0($s2)                      # Store byte in memory

    la      $a0,    msg
    li      $v0,    4
    syscall

    la      $a0,    joined
    li      $v0,    4
    syscall

    li      $v0,    10
    syscall