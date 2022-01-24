.section .text
.align 2
.global _start

@ r0: pointer to array
@ r1: array[0]: 20

_loop:  tst r1, #1 @ update n and z flags, if z=1: even, z=0: odd
        lsreq r1, #1 @ n/2
        addne r1, r1, r1, lsl #1 @ 2n+n
        addne r1, r1, #1 @ 3n+1
        stmfd sp!, {r1} @ result added to array
        cmp r1, #1
        beq _pop
        bne _loop

_pop:   ldmfd sp!, {r2, r3, r4, r5}
        cmp r2, #1
        cmpeq r3, #2
        cmpeq r4, #4
        cmpeq r5, #1
        stmfd sp!, {r2, r3, r4, r5}
        moveq pc, lr
        bne _loop

_start: ldr sp, =array @ x/w 0x00018028
        ldr r1, [sp]
        add r6, #0 @ counter
        bl _loop @ lr: next position
        add r6, #1
        cmp r6, #2
        beq _end
        bne _loop
        _end: b _end

.section .data

array:
.word 20

_data:
.skip 100

_repetition_number:
.word 2
