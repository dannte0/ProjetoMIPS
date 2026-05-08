#LISTA 3 - ATIVIDADE 1
.data
	msg1:.asciiz"\nDigite a altura (cm): \n"
	msg2:.asciiz"\nDigite a largura (cm): \n"
	msg3:.asciiz"\nDigite a comprimento (cm): \n"
	msgSaida:.asciiz"\nVolume = "
	medida:.asciiz" cm3"
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	
	li $v0, 4
	la $a0, msg3
	syscall
	li $v0, 5
	syscall
	add $t3, $v0, $zero
	
	#Calculo volume
	mul $t4, $t3, $t2
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
	
	