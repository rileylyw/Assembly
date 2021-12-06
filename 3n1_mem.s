.section .text
.align 2
.global _start
_start: ldr r0, = _n

_compare: cmp r0,#1
          beq _end
_loop:   tst r0,#1
         lsreq r0,#1
         addne r0, r0, r0, lsl #1
         addne r0,#1
         @store new value into mem
         @ldr r0,

b _compare
_end:   b _end


.section .data
_n:
.word 2
_data:
.skip 100
_repetition_number:
.word 2
