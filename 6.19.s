.section .text
.align 2
.global _start

@ if(g>h){
@     g = g + 1;
@ }
@ else{
@     h = h - 1;
@ }
@ g and h are signed integers

_start: mov r0, #5
        mov r1, #6
        cmp r0, r1
        addgt r0, r0, #1
        sublt r1, r1, #1

_end: b _end