.data
	msg1: .asciiz "\nDigite o valor da largura:\n"
	msg2: .asciiz "\nDigite o valor da profundidade:\n"
	saida1: .asciiz "\nA area do terreno = "
	saida2: .asciiz " m2"
.text
main:
	#print ($v0, 4) | Digite o valor de largura ($a0, msg1):
	li $v0, 4
	la $a0, msg1
	syscall
	#input ($v0, 5)	
	li $v0, 5
	syscall
	#largura ($t1) = input 
	add $t1, $v0, $zero
	
	#print ($v0, 4) | Digite o valor da profundidade ($a0, msg2):
	li $v0, 4
	la $a0, msg2
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#profundidade ($t2) = input 
	add $t2, $v0, $zero
	
	#area ($t0) = largura ($t0) * profundidade ($t1)
	mul $t0, $t1, $t2
	
saida:
	#print ($v0, 4) | A area do terreno é igual a: ($a0, saida1)
	li $v0, 4
	la $a0, saida1
	syscall
	#print ($v0, 1) | {area} ($a0, $t0, $zero)
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	#print ($v0, 4) | m2 ($v0, saida2)
	li $v0, 4
	la $a0, saida2
	syscall
	
	
