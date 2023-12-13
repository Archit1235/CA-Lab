.data
msg1: .asciiz "a = "
msg2: .asciiz "b = "
msg3: .asciiz "c = "
msg4: .asciiz "d = "
msg5: .asciiz "e = "
msg6: .asciiz "answer = "

.text
.globl main

main:
	li $t0, 0	

	li $v0, 4
	la $a0, msg1
	syscall
	li $v0,5
	syscall
	move $t1,$v0

	li $v0, 4
	la $a0, msg2
	syscall
	li $v0,5
	syscall
	move $t2,$v0

	li $v0, 4
	la $a0, msg3
	syscall
	li $v0,5
	syscall
	move $t3,$v0

	li $v0, 4
	la $a0, msg4
	syscall
	li $v0,5
	syscall
	move $t4,$v0

	li $v0, 4
	la $a0, msg5
	syscall
	li $v0,5
	syscall
	move $t5,$v0

	mul $t0, $t1, $t2
	
	div $t0, $t3
	mflo $t0
	
	div $t0, $t4
	mfhi $t0

	add $t0, $t0, $t5

	li $v0, 4
	la $a0, msg6
	syscall
	li $v0, 1
	move $a0, $t0
	syscall

	li $v0, 10
	syscall
	.end main