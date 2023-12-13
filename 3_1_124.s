.data
msg1: .asciiz "Enter a number: "
msg2: .asciiz "\nIt is odd"
msg3: .asciiz "\nIt is even"

.text
.globl main

main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $t1, 2
	li $t2, 0

	div $t0, $t1
	mfhi $t4
	beq $t4, $zero, l1

	li $v0, 4
	la $a0, msg2
	syscall
	j exit

	l1:
		li $v0, 4
		la $a0, msg3
		syscall

	exit:
		li $v0, 10
		syscall
		.end main