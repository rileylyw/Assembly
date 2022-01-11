.section .text
.align 2
.global _start

_start:
MOV r0,#10
MOV r1,r0
MOV r0,r0,lsl #16 @16.16
MOV r1,r1,lsl #8 @24.8

_loop:
UDIV r2,r0,r1 @16.8
ADD r3,r1,r2 @24.8
MOV r4,r3, lsr #1 @24.8 
SUB r5,r1,r4 @24.8
CMP r5,#2 @24.8
BLT _end
MOV r1,r4 @24.8 @r4=result
B _loop 

_end: b _end