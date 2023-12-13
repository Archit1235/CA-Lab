.data
in1: .asciiz "Enter x: "
in2: .asciiz "Enter y: "
outa: .asciiz "\nAddition: "
outs: .asciiz "\nSubtraction: "
outm: .asciiz "\nMultiplication: "
outd: .asciiz "\nDivision: "

.globl main
.text

main:
	li $v0, 4
	la $a0, in1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0

	li $v0, 4
	la $a0, in2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0

	move $a0, $t0
	move $a1, $t1
	jal addition
	move $t3, $v0

	li $v0, 4
	la $a0, outa
	syscall

	li $v0, 1
	move $a0, $t3
	syscall

	move $a0, $t0
	move $a1, $t1
	jal subtract
	move $t3, $v0

	li $v0, 4
	la $a0, outs
	syscall

	li $v0, 1
	move $a0, $t3
	syscall

	move $a0, $t0
	move $a1, $t1
	jal multiply
	move $t3, $v0

	li $v0, 4
	la $a0, outm
	syscall

	li $v0, 1
	move $a0, $t3
	syscall

	move $a0, $t0
	move $a1, $t1
	jal divide
	move $t3, $v0

	li $v0, 4
	la $a0, outd
	syscall

	li $v0, 1
	move $a0, $t3
	syscall

	li $v0, 10
	syscall

addition:
	add $v0, $a0, $a1
	jr $ra

subtract:
	sub $v0, $a0, $a1
	jr $ra

multiply:
	mult $a0, $a1
	mflo $v0
	jr $ra

divide:
	div $a0, $a1
	mflo $v0
	jr $ra
