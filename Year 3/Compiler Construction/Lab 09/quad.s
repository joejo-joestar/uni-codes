.section .data
msg: .string "Final result of LHS var = %d\n"

.section .bss
.lcomm a, 4
.lcomm b, 4
.lcomm c, 4
.lcomm d, 4
.lcomm z, 4

.section .text
.globl main
main:
    pushq %rbp
    movq %rsp, %rbp

    movl $300, a(%rip)
    movl $400, b(%rip)
    movl $500, c(%rip)
    movl $100, d(%rip)
    movl a(%rip), %eax
    addl b(%rip), %eax
    addl c(%rip), %eax
    addl d(%rip), %eax
    movl %eax, z(%rip)

    movl z(%rip), %esi
    leaq msg(%rip), %rdi
    movl $0, %eax
    call printf

    movl $0, %eax
    popq %rbp
    ret
