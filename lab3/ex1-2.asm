.data
_save: .word 6, 6, 6, 6, 6, 6, 6, 6, 6
_k: .word 6
.text
.globl main
main: # inicialização
	add $s3, $zero, $zero
	la $s5, _k
	lw $s5, 0($s5)
	la $s6, _save

Loop: # corpo do laço
	sll $t1,$s3,2
	add $t1, $t1, $s6
	lw $t0, 0($t1)
	bne $t0, $s5, Exit
	addi $s3, $s3, 1
	j Loop
Exit:
# rotina para imprimir inteiro no console
	addi $v0,$zero, 1
	add $a0,$zero, $s3
	syscall
