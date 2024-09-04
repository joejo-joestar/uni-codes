.data
msg1:   .asciiz "Please enter the number: "
msg2:   .asciiz "Sum: "

.text
main:
    addi    $v0,    $zero,  4
    la      $a0,    msg1
    syscall

    addi    $v0,    $zero,  5
    syscall

    add     $t0,    $v0,    $zero           # Move num to t0

summation:

    addi    $t0,    $t0,    -1              # $t0 = $t0 + -1

    add     $t1,    $t0,    $t1             # Store sum in s0

    bgt     $t0,    $zero,  summation       # if $t0 > $t1 then goto target

end:
    addi    $v0,    $zero,  4
    la      $a0,    msg2
    syscall

    addi    $v0,    $zero,  1
    add     $a0,    $t1,    $zero           # print sum
    syscall

    addi    $v0,    $zero,  10
    syscall
