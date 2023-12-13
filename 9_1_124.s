.data
len: .word 10
arr: .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
msg: .asciiz "Enter element: "
found: .asciiz "\nFound"
notFound: .asciiz "\nNot Found"

.text
.globl main

main:
	la $t0, arr
	
	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 5
	syscall
	move $a0, $v0

	li $a1, $zero
	la $a2, len
	jal binary

# $t0 = arr
# $a0 = x
# $a1 = l
# $a2 = r
# $t1 = mid

binary:
	ble $a2, $a1, NotFound
	
	addi $t1, $a2, -1
	div $t1, $t1, 2
	add $t1, $t1, $a1

	lw $t2, 0($t0)
	mult $t1, 4
	mflo $t1
	add $t0, $t0, $t1
	
	beq $t2, $a0, Found 
	
	bgt $t2, $a0, recursiveLeft

	addi $a1, $t1, 1
	jal binary

	recursiveLeft:
		addi $a2, $t1, -1
		jal binary

	Found:
		li $v0, 4
		la $a0, found
		syscall

		li $v0, 10
		syscall

	NotFound:
		li $v0, 4
		la $a0, notFound
		syscall

		li $v0, 10
		syscall