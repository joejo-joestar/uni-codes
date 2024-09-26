    # Program to perform the following operation:
    # a = a * b / c % d + e
    # a = $s0
    # b = $t0
    # c = $t1
    # d = $t2
    # d = $t3
    # e = $t4

    # Step 1: b / c
    # Step 2:(b / c) % d
    # Step 3:((b / c) % d) * a
    # Step 4:(((b / c) % d) * a) + e

.data
msg1:   .asciiz "Result is: "

.text
main:
    # Assigning Values
    li      $t0,    10          # $t0 = 10
    li      $t1,    2           # $t1 = 2
    li      $t2,    3           # $t2= 3
    li      $t3,    5           # $t3= 5
    li      $s0,    4           # $s0= 4

    # Logic
    # Step 1: b / c
    div     $t0,    $t1         # $t0 / $t1
    mflo    $t0                 # $t0 = floor($t0 / $t1)

    # Step 2:(b / c) % d
    div     $t0,    $t2         # $t0 / $t2
    mfhi    $t0                 # $t3 = $t0 % $t2

    # Step 3:((b / c) % d) * a
    mult    $t0,    $s0         # $t0 * $s0 = Hi and Lo registers
    mflo    $t4                 # copy Lo to $t4
    mfhi    $t5

    # Step 4:(((b / c) % d) * a) + e
    add     $s0,    $t4,    $t3 # $s0 = $t4 + $t3

    # Print message to user
    addi    $v0,    $zero,  4   # Move 4 to $v0
    la      $a0,    msg1        # Move address of msg1 to $a0
    syscall

    # Print result
    addi    $v0,    $zero,  1   # Move 1 to $v0
    add     $a0,    $zero,  $s0 # Move sum to $a0
    syscall

    # Exit
    addi    $v0,    $zero,  10
    syscall
