.data
no1: .float 3.2
no2: .double 0.0002
msg1: .asciiz "float no1 = "
msg2: .asciiz "double no2 = "

.globl main
.text

main:
	li $v0, 4
	la $a0, msg1
	syscall
		
	l.s $f12, no1
	li $v0, 2
	syscall

	li $v0, 4
	la $a0, msg2
	syscall

	l.d $f12, no2
	li $v0, 3
	syscall

	li $v0, 10
	syscall