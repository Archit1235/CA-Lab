.data
str1: .asciiz "Hello"
str2: .asciiz ", World"
str: .asciiz ""

.text
.globl main

main:
	la $t0, str1
	la $t1, str2
	la $t3, str

	loop:
		lb $t4, 0($t0)
		sb $t4, 0($t3)	
		beqz $t4, next	
		addi $t0, $t0, 1
		addi $t3, $t3, 1
		j loop


	next:
		lb $t4, 0($t1)
		sb $t4, 0($t3)		
		beqz $t4, exit
		addi $t1, $t1, 1
		addi $t3, $t3, 1
		j next

	exit:
		li $v0, 4
		la $a0, str
		syscall

		li $v0, 10
		syscall

.end main