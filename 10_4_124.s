.data
msg1: .asciiz "\nEnter in F: "
msg2: .asciiz "\nC: "

.globl main
.text

main:
	li $v0, 4
	la $a0, msg1
	syscall

	li $v0, 7
	syscall

	li.d $f2, 32.5
	sub.d $f4, $f0, $f2
	li.d $f2, 0.55
	mul.d $f12, $f4, $f2

	li $v0, 4
	la $a0, msg2
	syscall

	li $v0, 3
	syscall

	li $v0, 10
	syscall