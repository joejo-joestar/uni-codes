    # Check if a number is odd or even
.data
msg1:   .asciiz "Enter a number: "
even:   .asciiz "Number is Even!"
odd:    .asciiz "Number is Odd!"

.text
main:
    # Print message to user
    addi    $v0,    $zero,  4       # Move 4 to $v0
    la      $a0,    msg1            # Move address of msg1 to $a0
    syscall

    # Read input
    addi    $v0,    $zero,  5       # Move 5 to $v0
    syscall
    add     $t0,    $v0,    $zero   # Move fist num to t0

    # Logic
    addi    $t1,    $zero,  2       # $t1 = $zero + 2
    div     $t0,    $t1             # $t0 / $t1
    mfhi    $t3                     # $t3 = $t0 % $t1
    add     $t1,    $zero,  $zero   # clearing $t1
    beq     $t3,    $t1,    isEven  # if t3 == $t1 (2) then goto isEven

    # IF odd
isOdd:
    addi    $v0,    $zero,  4       # Move 4 to $v0
    la      $a0,    odd             # Move address of odd to $a0
    syscall
    j       end                     # goto end

    # IF even
isEven:
    addi    $v0,    $zero,  4       # Move 4 to $v0
    la      $a0,    even            # Move address of even to $a0
    syscall

    # Exit
end:
    addi    $v0,    $zero,  10
    syscall
