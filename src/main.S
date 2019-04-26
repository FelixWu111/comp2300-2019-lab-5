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
ldr r1, =0x40021000
ldr r2, [r1, 0x4C]
orr r2, 2
str r2, [r1, 0x4C]

ldr r3, =0x48000400

ldr r4, [r3, 0x0]
bic r4, 0x30
orr r4, 0x10
str r4, [r3, 0x0]



ldr r6, =100000

delay:
subs r6, 1
ble reset_delay
back_r:

ldr r9,= 1000
udiv r8, r6, r9
mul r10, r8, r9
cmp r8, r10
beq turn_on
bl turn_off
back_n:

b delay


reset_delay:
ldr r6, =100000
b back_r

turn_on:
ldr r5, [r3, 0x14]
orr r5, 0x4
str r5, [r3, 0x14]
b back_n

turn_off:
ldr r7, [r3, 0x14]
bic r7, 0x4
str r7, [r3, 0x14]
bx lr





@   ldr r1, =storage
@   ldr r2, [r1, #12]
@   add r2, #1
@   str r2, [r1, #12]


@ .data
@ storage:
@   .word 2, 3, 0, 0 @ don't change this line


  @ your code goes here

@ when it's all done, spin in an infinite loop
@ loop:
@   nop
@   b loop
@ .size main, .-main