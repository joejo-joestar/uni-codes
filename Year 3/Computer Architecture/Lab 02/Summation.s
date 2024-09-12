.data
msg1:   .asciiz "Please enter the number: "
msg2:   .asciiz "Sum: "

.text
main:
    # Print message to user
    addi    $v0,    $zero,  4               # Move 4 to $v0
    la      $a0,    msg1                    # Move address of msg1 to $a0
    syscall

    # Read integer from user
    addi    $v0,    $zero,  5               # Move 5 to $v0
    syscall
    add     $t0,    $v0,    $zero           # Move num to $t0

    # Summation Logic
summation:
    add     $t1,    $t0,    $t1             # Store sum in $t0
    addi    $t0,    $t0,    -1              # $t0 = $t0 + -1
    bgt     $t0,    $zero,  summation       # if $t0 > $zero then goto summation

    # Print msg2
    addi    $v0,    $zero,  4               # Move 4 to $v0
    la      $a0,    msg2                    # Move address of msg2 to $a0
    syscall

    # Print sum
    addi    $v0,    $zero,  1               # Move 1 to $v0
    add     $a0,    $t1,    $zero           # Move sum to $a0
    syscall

    # Exit
    addi    $v0,    $zero,  10
    syscall
