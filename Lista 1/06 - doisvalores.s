.data
	msg1:.asciiz"\nDigite o valor de A:\n"
	msg2:.asciiz"\nDigite o valor de B:\n"
	saidaSoma1:.asciiz"\nValores iguais\n"
	saidaSoma2:.asciiz"\nSoma = "
	saidaMult1:.asciiz"\nValores diferentes\n"
	saidaMult2:.asciiz"\nMultiplicacao = "
.text
main:
	#print ($v0, 4) | Digite o valor de A: ($a0, msg1)
	li $v0, 4
	la $a0, msg1
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#a ($t1) = input
	add $t1, $v0, $zero
	
	#print ($v0, 4) | Digite o valor de B: ($a0, msg2)
	li $v0, 4
	la $a0, msg2
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#b ($t2) = input
	add $t2, $v0, $zero
	
seIgual:
	#se a ($t1) = b ($t2) vai para soma
	beq $t1, $t2, soma
senao:	
	#se nao for, pula para multiplicacao
	j multiplicacao

soma:
	#res ($t0) = a ($t1) + b ($t2)
	add $t0, $t1, $t2
	#print ($v0, 4) | Valores iguais ($a0, saidaSoma1)
	li $v0, 4
	la $a0, saidaSoma1
	syscall
	#print ($v0,4) | Soma = ($a0, saidaSoma2)
	li $v0, 4
	la $a0, saidaSoma2
	syscall
	#print ($v0, 1) | {res} ($a0, $t0, $zero)
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	j fim

multiplicacao:
	#res ($t0) = a ($t1) * b ($t2)
	mul $t0, $t1, $t2
	#print ($v0, 4) | Valores diferentes ($a0, saidaMult1)
	li $v0, 4
	la $a0, saidaMult1
	syscall
	#print ($v0,4) | Multiplicacao = ($a0, saidaMult2)
	li $v0, 4
	la $a0, saidaMult2
	syscall
	#print ($v0, 1) | {res} ($a0, $t0, $zero)
	li $v0, 1
	add $a0, $t0, $zero 
	syscall
	j fim
	
fim: