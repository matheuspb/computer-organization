.data
# Arranjo a ser ordenado:
_v: .word 29,28,27,26,25,24,23,22,21,-1
_k: .word 2 # Valor de k

.text
.globl main

main:
# Inicialização dos parâmetros:
	la $a0,_v
	lw $a1,_k
	jal swap
	li $v0,10 #Exit syscall
	syscall

# corpo do procedimento
swap:
	sll $t0, $a1, 2
	add $t0, $a0, $t0
	lw $t1, 0($t0)
	lw $t2, 4($t0)
	sw $t2, 0($t0)
	sw $t1, 4($t0)
	# retorno ao programa principal
	jr $ra

