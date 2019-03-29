.syntax unified
.global main

.type main, %function
@exe0
@ ldr r0, =0xcafe0000
@ ldr r1, =0xffff
@ orr r3, r0, r1
@ ror r4, r0, 16
@ lsl r4, r4, 16
@ bic r6, r0, 0x0f000000
@ orr r5, r0, 0x000f0000
@ lsr r4, r0, 16
@ ldr r0, =main

@ loop1:
@ movs r3,1
@ loop2:
@ ldr r0, =loop1
@ ldr r1, =loop2
@ sub r2, r1, r0


main:
  ldr r1, =storage
  @ your code starts here
  ldr r2, [r1, #12]
  add r2, #1
  str r2, [r1, #12]

.data
storage:
  .word 2, 3, 0, 0 @ don't change this line


  @ your code goes here

@ when it's all done, spin in an infinite loop
@ loop:
@   nop
@   b loop
@ .size main, .-main