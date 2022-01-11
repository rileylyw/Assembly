.section .text
.align 2
.global _start

@ r0: pointer to array
@ r1: array[0]: 20

_start: ldr sp, =array @ 0x00018028
        ldr r1, [sp]
        rrx r3, r1
        bl _loop @ lr: next position

_loop:  tst r1, #1 @ update n and z flags, if z=1: even, z=0: odd
        lsreq r1, #1
        addne r1, r1, r1, lsl #1 @ 2n+n
        addne r1, r1, #1 @ 3n+1
        stmfd sp!, {r1} @ result added to array
        ldmfd sp!, {r2} @ r2 store latest value
        


        @ bne _loop

@ _check_result:  ldmfd sp!, {r2}


_end:   b _end


.section .data

array:
.word 20
_data:
.skip 100
_repetition_number:
.word 2
