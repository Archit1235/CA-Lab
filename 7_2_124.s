.data
arr: .word 1,2,3,4,5,6,7,8,9
n: .word 9
e: .word 6

.globl main
.text

main:
	la $a0, arr
	jal linearSearch
	move $t1, $v0

	li $v0, 1
	move $a0, $t1
	syscall

	li $v0, 10
	syscall

linearSearch:
	li $t2, 0
	la $t4, e
	move $t6, $a0
	
	loop:
		beq $t2, 9, notFound
		lw $t3, 0($t6)		
		beq $t5, $t3, found
		addi $t6, $t6, 4
		addi $t2, $t2, 1
		j loop

	notFound:
		li $v0, 0
		jr $ra

	found:
		li $v0, 1
		jr $ra