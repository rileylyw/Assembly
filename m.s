.section .text
.align 2
.global _start

@r8 = accuracy

_start:
@ r1 = a -> a * d
@ r2 = b
@ r3 = c
@ r4 = d

and r5, #0
mov r8, #1

mov r1, #0x80000000
mov r2, #0x5
mov r3, #2
mov r4, #0x1

@ a * d
umull r1, r5, r1, r4
cmp r5, #0
movgt r8, #-1   @calculation result is inaccurate

@reset flag
and r5, #0

@ b * c
umull r2, r5, r2, r3 @ r2*r3, result stored in r2 (bits 0-31), r5 (bits 32-63)
cmp r5, #0 @ if r5 has any value, result has overflow
movgt r8, #-1

@ a * d - b * c  lowest possible number - 8 = overflow
subs r0, r1, r2
movvs r8, #-1

@assume success
@ mov r8, #1

_end:   b _end
