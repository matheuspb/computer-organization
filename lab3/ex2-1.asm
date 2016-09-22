.data
_save: .word 99999, 9, 6, 6, 6, 6, 7, 5, 6, 0, 6
_k: .word 6
_error: .asciiz "Index Out of Bounds Exception"

.text
.globl main
main: # inicialização
	add $s3, $zero, $zero
	la $s5, _k
	lw $s5, 0($s5)
	la $s6, _save
	lw $t2, 4($s6)

Loop: # corpo do laço
	sltu $t0, $s3, $t2
	beq $t0, $zero, IndexOutOfBounds 
	sll $t1, $s3, 2
	add $t1, $t1, $s6
	lw $t0, 8($t1)
	bne $t0, $s5, Exit
	addi $s3, $s3, 1
	j Loop
Exit:
	addi $v0,$zero, 1
	add $a0,$zero, $s3
	syscall
	j End
IndexOutOfBounds:
	addi $v0,$zero, 4
	la $a0,_error
	syscall
End:
