.data
str: .asciiz "Hello"

.text
.globl main

main:
	li $t1, 0
	la $t0, str

	loop:
		lb $t2, 0($t0)
		beqz $t2, exit
		addi $t1, $t1, 1
		addi $t0, $t0, 1
		j loop

	exit:
		li $v0, 1
  		add $a0, $0, $t1
		syscall

		li $v0, 10
		syscall

.end main