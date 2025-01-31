    # Calculate the area of a circle

.data
msg1:   .asciiz "Enter the radius of the circle: "
msg2:   .asciiz "The area of the circle is: "
pi:     .float  3.1415926535897924

.text
main:
    # Get the radius of the circle
    li      $v0,    4
    la      $a0,    msg1
    syscall

    li      $v0,    6
    syscall
    # Store the radius in $f1
    mov.s   $f1,    $f0

    # Load pi into $f2
    lw      $t0,    pi                              # Load pi into $t0
    mtc1    $t0,    $f2                             # Move pi into $f2

    # multiply the radius ($f1) by pi ($f2) and store the result in $f2
    mul.s   $f2,    $f1,    $f2
    mul.s   $f2,    $f1,    $f2

    # Display the result
    li      $v0,    4
    la      $a0,    msg2
    syscall

    li      $v0,    2
    mov.s   $f12,   $f2
    syscall

    # Exit
    li      $v0,    10
    syscall
