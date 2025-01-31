    # ⚠️ Incomplete ⚠️
    # Binary Search using recursion

.data
arr:        .word   1, 2, 3, 4, 5, 6, 7, 8, 9, 10
n:          .word   10
key:        .word   5

result:     .asciiz "Key found at index: "
notFound:   .asciiz "Key not found"

.text
main:
    # Load the address of the array, n and key into $a0, $a1 and $a2 respectively
    la      $a0,            arr
    la      $a1,            n
    la      $a2,            key
    li      $v0,            10
    syscall

    li      $v0,            10
    syscall

    # Binary search function
    # $a0 = address of the array
    # $a1 = n
    # $a2 = key
    # $a3 = low
    # $a4 = high
    # $v0 = index of the key
binarySearch:
    add     $sp,            $sp,        -12
    sw      $ra,            0($sp)
    sw      $a0,            4($sp)
    sw      $a1,            8($sp)
    sw      $a2,            12($sp)
    sw      $a3,            16($sp)
    sw      $a4,            20($sp)

    # Base case
    bge     $a3,            $a4,        noElement

    # Calculate mid
    add     $t0,            $a3,        $a4
    sra     $t0,            $t0,        1

    # Load the value at mid
    lw      $t1,            0($a0)
    add     $t1,            $t1,        $t0
    lw      $t1,            0($t1)

    # Compare the value at mid with key
    bne     $t1,            $a2,        notEqual

    # Key found
    move    $v0,            $t0
    j       end

notEqual:
    # If key is less than the value at mid
    blt     $a2,            $t1,        left

    # If key is greater than the value at mid
    bgt     $a2,            $t1,        right

left:
    # Search in the left half
    jal     binarySearch
    move    $a4,            $v0
    j       end

right:
    # Search in the right half
    addi    $t0,            $t0,        1
    move    $a3,            $t0
    jal     binarySearch
    move    $a3,            $v0

end:
    lw      $ra,            0($sp)
    lw      $a0,            4($sp)
    lw      $a1,            8($sp)
    lw      $a2,            12($sp)
    lw      $a3,            16($sp)
    lw      $a4,            20($sp)
    add     $sp,            $sp,        12
    jr      $ra

noElement:
    li      $v0,            4
    la      $a0,            notFound
    syscall

    li      $v0,            10
    syscall