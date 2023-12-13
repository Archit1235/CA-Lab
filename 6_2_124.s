.data
str: .asciiz "Hello"
rev: .asciiz ""

.text
.globl main

main:

	li $t1, 1
	la $t0, str
	la $t2, rev

	loop:
		lb $t3, 0($t0)
		beqz $t3, reverse
		addi $t1, $t1, 1
		addi $t0, $t0, 1
		j loop

	
	reverse:
		addi $t0, $t0, -1
		addi $t1, $t1, -1
		beqz $t1, exit
		lb $t3, 0($t0)
		sb $t3, 0($t2)
		addi $t2, $t2, 1
		j reverse

	exit:
		li $v0, 4
		la $a0, rev
		syscall

		li $v0, 10
		syscall

.end main