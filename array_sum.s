.section .text
.align 2
.global _start

_start:
MOV r1,#4 @number of words
MOV r3,#0 
LDR r0,=array

_loop:
LDR r2, [r0], #4 @ load array[0], next array[1]
ADD r3, r3, r2 @ array[0]+array[1]+....
SUBS r1,r1,#1

BNE _loop @when r1 = 0, end loop, z=1
STR r3, [r0] @ array changed to sum of original array

_end: b _end

.section .data

array:
.word 0x55, 0xff, 0xd, 0x12
