.data
a: .float 1.0
bb: .float 1.0
c: .float 1.0
msg1: .asciiz "\nInput: "
msg2: .asciiz "\nOutput: "

.globl main
.text

main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 6
	syscall

	l.s $f1, a 
	l.s $f2, bb
	l.s $f3, c

	mul.s $f4, $f1, $f0
	mul.s $f4, $f4, $f0

	mul.s $f5, $f5, $f0

	add.s $f6, $f4, $f5
	add.s $f12, $f6, $f3

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 2
	syscall

	li $v0, 10
	syscall