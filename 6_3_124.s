.data
is: .asciiz "Palindrome"
isNot: .asciiz "Not Palindrome"
str: .asciiz "naman"
rev: .asciiz ""

.text
.globl main

main:

	li $t1, 1
	la $t0, str
	la $t2, rev

	loop:
		lb $t3, 0($t0)
		beqz $t3, next
		addi $t1, $t1, 1
		addi $t0, $t0, 1
		j loop


	next:
		addi $t5, $t1, -1
		reverse:
			addi $t0, $t0, -1
			addi $t1, $t1, -1
			beqz $t1, palindrome
			lb $t3, 0($t0)
			sb $t3, 0($t2)
			addi $t2, $t2, 1
			j reverse

	palindrome:
		la $t0, str
		la, $t1, rev

		check:
			lb $t2, 0($t0)
			lb $t3, 0($t1)
			bne $t2, $t3, exit0
			beqz $t4, exit1			
			addi $t4, $t4, -1
			addi $t0, $t0, 1
			addi $t1, $t1, 1
			j check

	exit0:
		li $v0, 4
		la $a0, isNot
		syscall

		li $v0, 10
		syscall
	

	exit1:
		li $v0, 4
		la $a0, is
		syscall

		li $v0, 10
		syscall

.end main