.data
arr1: .word 1, 1, 1, 1, 1
arr2: .word 1, 1, 1, 1, 1
arr3: .word 0, 0, 0, 0, 0

found: .asciiz "\nFound"
notFound: .asciiz "\nNot Found"

.text
.globl main

main:
	li $t0, 0
	la $t1, arr1
	la $t2, arr2
	la $t3, arr3

	loop:
		beq $t0, 5, exit

		lw $t4, 0($t1)
		lw $t5, 0($t2)
		add $t6, $t5, $t4
		sw $t6, 0($t3)
		
		lw $t6, 0($t3)
		li $v0, 1
		move $a0, $t6
		syscall

		addi $t0, $t0, 1

		addi $t1, $t1, 4
		addi $t2, $t2, 4
		addi $t3, $t3, 4
		j loop

	exit:
		li $v0, 10
		syscall