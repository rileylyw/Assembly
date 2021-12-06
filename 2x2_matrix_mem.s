.section .text
.align 2
.global _start
_start: ldr r0, =_matrix
        ldr r1, [r0], #4
        ldr r2, [r0], #4
        ldr r3, [r0], #4
        ldr r4, [r0], #4
        mul r5, r1, r4
        mul r6, r2, r3
        sub r7, r5, r6
_end: b _end

.section .data
_matrix:
.word 1,2,3,4
