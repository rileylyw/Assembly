.section .text
.align 2
.global _start

@ int nums[5];
@ for(int i=0; i<5; i++){
@     nums[i] = nums[i]/2;
@ }

@ r0: address of num array
@ r1: i


_for:   cmp r1, #5
        moveq pc, lr
        bne _loop
        
_loop:  lsr r2, r2, #1 @ r2: nums[i] = nums[i]/2
        str r2, [sp], #4 @ move pointer to next location
        ldr r2, [sp]
        add r1, r1, #1 @ add one to i
        b _for

_start: ldr sp, =array
        ldr r2, [sp]
        mov r1, #0
        bl _for

_end:   b _end

.section .data
array:
.word 2, 4, 6, 8, 10