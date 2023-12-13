.data
msg1: .asciiz "\nfloat no1 = "
msg2: .asciiz "\ndouble no2 = "

.globl main
.text

main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 6
	syscall
	mov.s $f1, $f0	

	li $v0, 4
	la $a0, msg2
	syscall
	
	li $v0, 7
	syscall
	mov.d $f2, $f0

	li $v0, 4
	la $a0, msg1
	syscall

	mov.s $f12, $f1
	li $v0, 2
	syscall

	li $v0, 4
	la $a0, msg2
	syscall

	mov.d $f12, $f2
	li $v0, 3
	syscall

	li $v0, 10
	syscall