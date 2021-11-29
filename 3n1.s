.section .text
.align 2
.global _start
_start: mov r0,#3
_compare: cmp r0,#1
          beq _end
_loop:  tst r0,#1
        lsreq r0,#1
        addne r0, r0, r0, lsl #1
        addne r0,#1
b _compare
_end:   b _end
