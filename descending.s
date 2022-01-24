.section .text
.align 2
.global _start

@ r0: pointer to array
@ r1: address of array[0]

_start: ldr r0, =array
        mov r7, r0
        mov r8, #5 @ 5-1
        bl _add
        mov r8, #5
        bl _pop
        b _end

_pop:   ldmfd sp!, {r1}
        str r1, [r7], #4
        sub r8, r8, #1
        cmp r8, #0
        bne _pop
        moveq pc, lr

_add:   ldr r1, [r0], #4
        stmfd sp!, {r1}
        sub r8, r8, #1
        cmp r8, #0
        bne _add
        moveq pc, lr
_end: b _end

.section .data

array:
.word 2,4,6,8,10
