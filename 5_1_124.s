.data
arr: .word 1,2,3,4,5,6,7,8,9,10

largest: .asciiz "\nLargest element: "

.text
.globl main

main:
	la $t0, arr
	lw $t1, 0($t0)
	li $t3, 1

	loop:
		beq $t3, 10, exit

		addi $t0, $t0, 4
		lw $t2, 0($t0)
		
		addi $t3, $t3, 1

		bge $t2, $t1, change
		j loop

	change:
		move $t1, $t2
		j loop

	exit:
		li $v0, 4
		la $a0, largest
		syscall
		li $v0, 1
		move $a0, $t1
		syscall
	
		li $v0, 10
		syscall

.end main