    # Power of a user input number using recursion
    # $a0: base, $a1: power
    # $v0: result

    # If power is 0, return 1
.data
base:   .asciiz "Enter the base: "
power:  .asciiz "Enter the power: "
result: .asciiz "The result is: "

.text
main:
    # User input for base
    li      $v0,        4
    la      $a0,        base
    syscall

    li      $v0,        5
    syscall
    add     $t0,        $v0,    $zero

    # User input for power
    li      $v0,        4
    la      $a0,        power
    syscall

    li      $v0,        5
    syscall
    add     $t1,        $v0,    $zero

    # Convention (Arguments go in $a0, $a1)
    add     $a0,        $zero,  $t0
    add     $a1,        $zero,  $t1

    # Call power_calc
    jal     power_calc

    add     $t0,        $v0,    $zero

    # Print the result
    li      $v0,        4
    la      $a0,        result
    syscall

    li      $v0,        1
    add     $a0,        $t0,    $zero
    syscall

    # Exit
    li      $v0,        10
    syscall

    # power_calc(base, power)
power_calc:
    addi    $sp,        $sp,    -8
    sw      $ra,        0($sp)
    sw      $a0,        4($sp)

    # If power is 0, return 1
    beq     $a1,        $zero,  return_1

    # else if power >= 1, loop
    addi    $t2,        $zero,  1
    bge     $a1,        $t2,    loop

    # Return 1
return_1:
    add     $v0,        $zero,  $t2
    lw      $ra,        0($sp)
    addi    $sp,        $sp,    8
    jr      $ra

    # Loop
loop:
    # power_calc(base, power - 1)
    addi    $a1,        $a1,    -1
    jal     power_calc

    # $v0 = base * power_calc(base, power - 1)
    mul     $v0,        $a0,    $v0

    # Return
    lw      $ra,        0($sp)
    addi    $sp,        $sp,    8
    jr      $ra
