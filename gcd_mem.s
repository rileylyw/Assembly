.section .text
.align 2
.global _start

@ r0, r1: first two num

_loop:  cmp r0, r1
        bgt _greater
        blt _less
        moveq pc, lr

_greater: subs r0, r0, r1
          cmp r0, r1
          bgt _loop
          blt _push_0 @ loop till it's less than, =remainder of each step

_less:  subs r1, r1, r0
        cmp r1, r0
        bgt _loop
        blt _push_1

_push_0:  stmfd sp!, {r0}
          b _loop

_push_1:  stmfd sp!, {r1}
          b _loop


_start: ldr sp, =array
        ldm sp, {r0, r1}
        bl _loop
        ldmfd sp!, {r3} @ pop last one out so no duplicate
        b _end @ gcd at the top of stack



_end:   b _end


.section .data
array:
.word 68, 119
