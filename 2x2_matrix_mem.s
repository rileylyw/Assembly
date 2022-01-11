.section .text
.align 2
.global _start
_start: ldr r0, =_matrix
        ldmia r0, {r1-r4}
        @ stmed sp!, {r1-r4}
        @ ldmed sp!, {r1-r4}
        @ stmdb r0, {r1-r4}
        @ ldmia sp!, {r1-r4}

        mul r5, r1, r4
        mul r6, r2, r3
        sub r7, r5, r6 @r7 = 10 in decimal    

        @ ldr r0, =_matrix
        @ ldr r1, [r0], #4
        @ ldr r2, [r0], #4
        @ ldr r3, [r0], #4
        @ ldr r4, [r0], #4
        @ mul r5, r1, r4
        @ mul r6, r2, r3
        @ sub r7, r5, r6 @r7 = 10 in decimal
_end: b _end

.section .data
_matrix:
.word 4, 2, 1, 3


@r0: pointer to first element of matrix (4)