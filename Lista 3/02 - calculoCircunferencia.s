#LISTA 3 - ATIVIDADE 2
#2 pi R
.data
	msg1:.asciiz"\nDigite o raio (cm): \n"
	msgSaida:.asciiz"\nComprimento da circunferencia = "
	medida:.asciiz" cm"
.text
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	#atribuição de constantes
	add $t2, $zero, 2
	add $t3, $zero, 3
	
	#calculo circunferencia
	mul $t4, $t2, $t3
	mul $t0, $t4, $t1
	
	li $v0, 4
	la $a0, msgSaida
	syscall
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	li $v0, 4
	la $a0, medida
	syscall