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





tst r1, #1
lsreq r1, r1, #1 @divide n by 2
addne r1, r1, r1, lsl #1 @is odd, take r1 shift by 1 store to r1 r1 = 3*r1
addne r1, r1, #1

cmp r1, #1
addeq r2, #1 @counter r2

cmp r2, r3
cmpeq r1, #2 @if counter=2
beq _end


