.section .text
.align 2
.global _start
_start:     ldr r0, =_matrix
            ldr r1, [r0, #4 * 4] @e, f, h, i
            ldr r2, [r0, #4 * 5]
            ldr r3, [r0, #4 * 7]
            ldr r4, [r0, #4 * 8]
            bl _det_2x2
            ldr r9, [r0] @a
            mul r8, r7, r9

            ldr r1, [r0, #4 * 3] @d, f, g, i
            ldr r2, [r0, #4 * 5]
            ldr r3, [r0, #4 * 6]
            ldr r4, [r0, #4 * 8]
            bl _det_2x2
            ldr r9, [r0, #4] @b
            mul r9, r7, r9

            ldr r1, [r0, #4 * 3] @d, e, g, h
            ldr r2, [r0, #4 * 4]
            ldr r3, [r0, #4 * 6]
            ldr r4, [r0, #4 * 7]
            bl _det_2x2
            ldr r10, [r0, #4 * 2] @c
            mul r11, r7, r10
            sub r12, r8, r9
            add r12, r12, r11
   
_end: b _end

_det_2x2:   mul r5, r1, r4
            mul r6, r2, r3
            sub r7, r5, r6
            mov pc, lr

.section .data
_matrix:
.word 6,1,1,4,-2,5,2,8,7
