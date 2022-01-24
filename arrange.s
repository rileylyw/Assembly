.section .text
.align 2
.global _start

_start: ldr r0, =array
        mov r8, #10
        ldr r1, [r0], #4 @ r1: 4
        bl _loop
        b _end

_loop:  ldr r2, [r0], #4 @ r2: 6
        cmp r1, r2
        bge _push_smaller
        blt _push_larger

_push_larger:   stmfd sp!, {r1}
                mov r1, r2
                sub r8, r8, #1
                cmp r8, #0
                moveq pc, lr
                bne _loop

_push_smaller:  stmfd sp!, {r2}
                @ mov r1, r2
                sub r8, r8, #1
                cmp r8, #0
                moveq pc, lr
                bne _loop




_end:   b _end

.section .data
array:
.word 5, 4, 2, 6, 8, 9, 10, 32, 42, 35

@ num:
@ .word 10