.data
in: .asciiz "Enter a number: "

.globl main
.text

main:
	li $v0, 4
	la $a0, in
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0

	move $a0, $t0
	jal fib
	move $t1, $v0

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 10
	syscall

fib:
	li $t3, 0
	li $t4, 1

	beq $a0, 0, exit0
	beq $a0, 1, exitn

	loop:
		beq $a0, 2, exitn
		move $t5, $t4
		add $t4, $t4, $t3
		move $t3, $t5
		addi $a0, $a0, -1
		j loop
	
	exit0:
		move $v0, $t3
		jr $ra

	exitn:
		move $v0, $t4
		jr $ra