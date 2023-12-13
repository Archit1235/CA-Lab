.data
n: .asciiz "Enter a number: "
p: .asciiz "\nEnter power: "
ans: .asciiz "\nAnswer: "

.text
.globl main

main:
	li $v0, 4
	la $a0, n
	syscall

	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, p
	syscall

	li $v0, 5
	syscall
	move $t1, $v0

	move $a0, $t0
	move $a1, $t1
	jal power	

power:
	li $t5, 1
	beq $a1, $t5, exit
	mul $a0, $a0, $t0
	addi $a1, $a1, -1
	jal power

	exit:
		move $t3, $a0
		li $v0, 4
		la $a0, ans
		syscall

		li $v0, 1
		move $a0, $t3
		syscall

		li $v0, 10
		syscall