.section .text
.align 2
.global _start
_start: mov r0,#1
        mov r1,#2
        mov r2,#3
        mov r3,#4
        mul r4, r0, r3
        mul r5, r1, r2
        sub r6, r4, r5  
_end:   b _end
