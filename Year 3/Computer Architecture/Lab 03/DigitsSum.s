    # Sum of digits of a user input integer
.data
msg1:   .asciiz "Enter a number: "
msg2:   .asciiz "Sum of digits is: "

.text
main:
    # Print message to user
    addi    $v0,    $zero,  4           # Move 4 to $v0
    la      $a0,    msg1                # Move address of msg1 to $a0
    syscall

    # Read input
    addi    $v0,    $zero,  5           # Move 5 to $v0
    syscall

    add     $t0,    $v0,    $zero       # Move fist num to t0

    # Logic
    addi    $t1,    $zero,  10          # $t1 = $zero + 10

loop:
    div     $t0,    $t1                 # $t0 / $t1
    mflo    $t0                         # $t0 = floor($t0 / $t1)
    mfhi    $t2                         # $t2 = $t0 % $t1
    add     $s0,    $s0,    $t2         # $s0 = $s0 + $t2
    bne     $t0,    $zero,  loop        # if $t0 != $zero then goto loop

    # Print string
    addi    $v0,    $zero,  4           # Move 4 to $v0
    la      $a0,    msg2                # Move address of msg2 to $a0
    syscall

    # Print  number
    addi    $v0,    $zero,  1           # Move 1 to $v0
    add     $a0,    $zero,  $s0         # Move sum to $a0
    syscall

    # Exit
    addi    $v0,    $zero,  10
    syscall
