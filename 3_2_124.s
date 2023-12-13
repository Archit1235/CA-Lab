.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "\nSum: "

.text
.globl main

main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $t1, 0
	li $t2, 10

	l1: 
		beq $t0, $zero, l2
		div $t0, $t2
		mfhi $t3
		mflo $t4
		add $t1, $t1, $t3
		move $t0, $t4
		j l1

	l2:
		li $v0, 4
		la $a0, msg2
		syscall
		li $v0, 1
		move $a0, $t1
		syscall

	li $v0, 10
	syscall
	.end main