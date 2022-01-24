.section .text
.align 2
.global _start

@ r0: the num u want to perform fac

_fac:   cmp r0, #0
        moveq r0, #1
        moveq pc, lr
        mov r1, r0
        sub r0, r0, #1
        stmfd sp!, {r1, lr} @ store link and r1 on stack
        bl _fac
        ldmfd sp!, {r1, lr}
        mul r0, r1, r0
        mov pc, lr

_start: mov r0, #4
        bl _fac

_end: b _end