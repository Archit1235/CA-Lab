.data
pi: .float 3.14
msg1: .asciiz "\nEnter Radius: "
msg2: .asciiz "\nArea: "

.globl main
.text

main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 6
	syscall	

	mul.s $f1, $f0, $f0
	l.s $f2, pi
	mul.s $f12, $f2, $f1

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 2
	syscall

	li $v0, 10
	syscall