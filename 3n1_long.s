.section .text
.align 2
.global _start

_start: ldr r0, = _n @loads the address which is stored in _n inside the r0 register (copying the pointer)
        ldr r1, [r0] @loads the value present in the memory location addressed by the r0 register. (derefercing the poiniter)
        ldr r2, = _repetition_number
        ldr r2, [r2]
        mov r3, #0
        mov r4, #0
        mov r5, #0

_loop:  tst r1, #1 @updates the flag registers compare bit with 1 if result is even, or 0 if result is odd
        moveq r1, r1, asr #1 @ update the value of r1 divided by 2 (n = n/2)

        @ mulne r1, r1, #3
        addne r1, r1, r1, lsl #1 @is add, take r1 shift by 1 store to r1 r1=3*r1
        addne r1, r1, #1

        str r1, [r0, #4]! @storing r1 into the memory location referenced by r0 + 4, r0 is modified to equal r0 = r0+4
        
        cmp r1 , #1 @ check if r1 is equal to 1 or not
        moveq r3, #1 @ if it s equal to 1. store the value of r1 in r3 (we will use it in the next step to determine the sequence 1-4-2-1)
        
        cmp r1, #4 @ check if result of r1 is 4
        cmpeq r3, #1 @ if the result is 4, check if the previous result was 1
        moveq r4, #4 @ if the previous result was 1, update the value of r4 with 4

        cmp r1, #2 @ check if the result of r1 is 2
        cmpeq r4, #4 @ if the result of r1 is 2. check if the previous result was 4
        moveq r3, #2 @ if the result was 4 , update r3 is 2

        cmp r3, #2 @ check if r3 is 2
        addeq r5 , #1 @ if r3 is 2, sequence 1b _compare-4-2 has been detected (icrease counter by 1)

        moveq r3, #0 @ reset r3 if the sequence is detected

        cmp r5, r2 @ check if counter value is equal to repitition number
        beq _end @ if it is end the program
         
        @if counter != repitition number keep looping
        bne _loop

_end:   b _end


.section .data

_n: @ stores the address where the constant 2 is loaded in memory inside _n (pointer)
.word 20
_data:
.skip 100
_repetition_number:
.word 2
