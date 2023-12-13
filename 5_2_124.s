.data
arr: .word 1,2,3,4,5

sum: .asciiz "\nSum: "

.text
.globl main

main:
	la $t0, arr
	li $t1, 0
	li $t2, 0

	loop:
		beq $t2, 5, exit
		lw $t4, 0($t0)
		add $t1, $t1, $t4
		addi $t2, $t2, 1
		addi $t0, $t0, 4
		j loop

	exit:
		li $v0, 4
		la $a0, sum
		syscall
		li $v0, 1
		move $a0, $t1
		syscall
	
		li $v0, 10
		syscall

.end main