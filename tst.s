.section .text
.align 2
.global _start
_start: mov r0, #3
        and r1, r0, #1
_end:   b _end