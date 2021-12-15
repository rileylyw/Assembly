.section .text
.align 2
.global _start

@r0 = result
@r1 = a
@r2 = b
@r3 = c
@r4 = d
@r5 = a*d
@r6 = b*c
@r7 = overflow flag
@r8 = accuracy

_start:
@mov r1, #0xffffffff
@mov r1, #5
@umull r3, r4, r1, r2
@ a b
@ c d == a * d - b * c
mov r1, #7
cmp r1, #0
mov r2, #2
mov r3, #4
mov r4, #5
mov r7, #0

@ a * d
umull r5, r7, r1, r4
cmp r7, #0
movne r8, #-1   @calculation result is inaccurate

@reset flag
mov r5, #0

@ b * c
umull r6, r7, r2, r3
cmp r7, #0
movne r8, #-1

@ a * d - b * c
sub r1, r2

@assume success
mov r8, #1

_start: mov r0,#75
        mov r1,#60
_loop:  cmp r0,r1
        subgt r0,r0,r1
        sublt r1,r1,r0
        bne _loop
        addeq r2,r0
_end:   b _end
