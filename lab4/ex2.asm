.data
_array: .word 1,2,3,4,5,6,7,8,9,2,3
_size: .word 11

.text
.globl main

main:
	jal clear2
	li $v0, 10
	syscall

clear2:
	la $a0, _array
	lw $a1, _size
	add $t0, $a0, $zero
	sll $t1, $a1, 2
	add $t2, $a0, $t1
Loop2:
	slt $t3, $t0, $t2
	beq $t3, $zero, Exit
	sw $zero, 0($t0)
	addi $t0, $t0, 4
	j Loop2
Exit:
	jr $ra
