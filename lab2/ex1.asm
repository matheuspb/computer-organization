.data
# Seção 1: variáveis f, g, h, i, j
# armazenadas em memória (inicialização)
_f: .word 7
_g: .word 12
_h: .word 1
_i: .word 13
_j: .word 6

# Seção 2: jump address table
jat:
.word L0
.word L1
.word L2
.word L3
.word L4
.word default

.text
.globl main
main:
# Seção 3: registradores recebem valores
# inicializados (exceto variável k)
lw $s0,_f
lw $s1,_g
lw $s2,_h
lw $s3,_i
lw $s4,_j

# carrega em $t4 o endereco-base de jat:
la $t4,jat

# Seção 4: testa se k no intervalo [0,4],
# caso contrário default

addi $s5, $zero, 5 # k = 5

sltiu $t0, $s5, 4
beq $t0, $zero, default

# Seção 5: calcula o endereço de jat[k]

sll $t0, $s5, 2
add $t0, $t4, $t0

# Seção 6: desvia para o endereço em jat[k]

lw $t1, 0($t0)
jr $t1

# Seção 7: codifica as alternativas de execução

L0:
	add $t0, $s3, $s4
	sub $s0, $t0, $s5
	j exit

L1:
	sub $s0, $s1, $s2
	j exit

L2:
	add $t0, $s1, $s2
	add $s0, $t0, $s5
	j exit

L3:
	sub $s0, $s3, $s2
	j exit

L4:
	sub $s0, $s4, $s3
	j exit

default:
	sub $t0, $s3, $s4
	addi $s0, $t0, 2
	j exit

exit:
