.data
arr: .word 1,2,3,4,5,6,7,8,9

found: .asciiz "\nFound"
notFound: .asciiz "\nNot Found"

.text
.globl main

main:
	li $t0, 77
	la $t1, arr
	li $t2, 0
	li $t3, 10

	loop:
		lw $t4, 0($t1)
		beq $t0, $t4, printFound
		beq $t3, $t2, printNotFound
		addi $t1, $t1, 4
		addi $t2, $t2, 1
		j loop

	printNotFound:
		li $v0, 4
		la $a0, notFound
		syscall
		j exit

	printFound:
		li $v0, 4
		la $a0, found
		syscall
		j exit

	exit:
		li $v0, 10
		syscall