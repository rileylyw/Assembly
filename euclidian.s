.section .text
.align 2
.global _start
_start: mov r0,#75
        mov r1,#60
_loop:  cmp r0,r1
        subgt r0,r0,r1
        sublt r1,r1,r0
        bne _loop
        addeq r2,r0
_end:   b _end
