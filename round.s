.section .text
.align 2
.global _start

_start: ldr r0, =array
        ldm r0, {r1, r2} @ r1: 3, r2: 10

        udiv r3, r2, r1 @ r2 / r1 @16.8
        mov r3, r3, lsl #8 @ 24.8
        mov r2, r2, lsl #16 @ 16.16
        mov r1, r1, lsl #8 @ 24.8
        udiv r4, r2, r1 @ r2 / r1 @16.8
        sub r5, r4, r3 @ difference
        cmp r5, #128 @ difference - . 1000 0000 (0.5 diff)
        blt _push
        addge r3, r3, #256 @ + 1. 0000 0000
        bge _push

_push:  mov r3, r3, asr #8
        stmfd r0!, {r3}
        b _end

_end:   b _end

.section .data
array:
.word 3, 8