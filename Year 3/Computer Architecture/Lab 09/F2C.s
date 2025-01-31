# Convert from Fahrenheit to Celsius
# C = 5.0/9.0 * (F - 32.0)

.data
msg1: .asciiz "Enter a temperature in Fahrenheit: "
msg2: .asciiz "The temperature in Celsius is: "

.text
main:

    # Read the Fahrenheit temperature
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 6
    syscall

    # Convert to Celsius
    li.s $f1, 32.0
    sub.s $f0, $f0, $f1
    li.s $f1, 5.0
    li.s $f2, 9.0
    div.s $f1, $f1, $f2
    mul.s $f0, $f0, $f1

    # Print the result
    li $v0, 4
    la $a0, msg2
    syscall
    li $v0, 2
    mov.s $f12, $f0
    syscall

    # Exit
    li $v0, 10
    syscall
