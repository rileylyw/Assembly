.section .text
.align 2
.global _start

_start: ldr sp, =array
        mov r5, #5
        ldr r2, [sp], #4 @ r2: 1
        bl _loop
        stmed sp!, {r2}
        b _end

_loop:  sub r5, r5, #1 @ counter
        cmp r5, #0
        bne _mul
        moveq pc, lr

_mul:   ldr r3, [sp], #4 @ r3: 2
        mul r2, r2, r3 @ r2: 1*2
        b _loop

_end: b _end



.section .data
array:
.word 1, 2, 3, 4, 5
