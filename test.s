.section .text
.align 2
.global _start

_start: ldr r10, =array
        ldr r11, =stop
        mov r12, #0

_fill:  cmp r10, r11
        beq _select
        add r12, r12, #3
        str r12, [r10]
        add r10, r10, #4
        b _fill

_select:ldr r10, =array
        ldr r13, [r10, #20]!


_end:   b _end

.section .data
array:
.word 0,0,0,0,0,0,0,0,0,0
stop:
.word 0

_start: mov r0, #0
        mov lr, pc

_start: mov r0, #0
        cmp r0, #0
        mov r1, #255
        mov r2, #255
        subs r1, r0, r2