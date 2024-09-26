    # Find the factorial of a user input number.
.data
msg1:   .asciiz "Enter a number: "
msg2:   .asciiz "The factorial is: "

.text
main:
    # Print message to user
    addi    $v0,    $zero,  4           # Move 4 to $v0
    la      $a0,    msg1                # Move address of msg1 to $a0
    syscall

    # Read integer from user
    addi    $v0,    $zero,  5           # Move 5 to $v0
    syscall
    add     $t0,    $v0,    $zero       # Move num to $t0

    # Clear $t1 and $t2
    addi    $t1,    $zero,  1
    addi    $t2,    $zero,  1

loop:
    # Multiply $t1 and $t2
    mult    $t1,    $t2                 # $t1 * $t2 = Hi and Lo registers
    # Update $t1
    mflo    $t1                         # copy Lo to $t2
    # Increment $t2
    addi    $t2,    $t2,    1           # $t2 = $t2 + 1
    ble     $t2,    $t0,    loop        # if $t2 <= $t0 then goto loop

    # Print msg2
    addi    $v0,    $zero,  4           # Move 4 to $v0
    la      $a0,    msg2                # Move address of msg2 to $a0
    syscall

    # Print factorial
    addi    $v0,    $zero,  1           # Move 1 to $v0
    add     $a0,    $zero,  $t1         # Move factorial to $a0
    syscall

    # Exit
    addi    $v0,    $zero,  10
    syscall
