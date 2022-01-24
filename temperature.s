.section .text
.align 2
.global _start

_start: ldr r0, =array
        ldr r1, [r0] @ r1: celcius
        mov r5, #5
        mov r6, #32
        add r2, r1, r1, lsl #3 @ r2 = r1 * 9
        mov r2, r2, lsl #16 @ 16.16
        mov r5, r5, lsl #8 @ 24.8
        udiv r3, r2, r5 @c9/5
        mov r6, r6, lsl #8
        add r7, r3, r6 @ ans = r7
        stmed r0!, {r7}

_end:   b _end

.section .data
array:
.word 20
