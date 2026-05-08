.data
	msg:.asciiz"\nDigite o numero: "
	msgNegativo:.asciiz"\nNumero nao pode ser negativo digite novamente!"
	msgMaior:.asciiz"\nMaior numero: "
	msgMenor:.asciiz"\nMenor numero: "
.text
main:
	loop:
	li $v0, 4
	la $a0, msg
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero
	
	bltz $t0, negativo
	
	bgt $t4, 0, verifica
	add $t1, $t0, $zero
	add $t2, $t0, $zero

	
	verifica:
	#se input > maior
	bge $t0, $t1, atribuiMaior
	#se input < menor
	ble $t0, $t2, atribuiMenor
	j contador
	
	
	atribuiMaior:
	add $t1, $t0, $zero
	j contador
	
	atribuiMenor:
	add $t2, $t0, $zero
	
	contador:
	#se cont > 5
	add $t4, $t4, 1
	bge $t4, 10, fim
	j loop
	
negativo:
	li $v0, 4
	la $a0, msgNegativo
	syscall
	j loop	
	
fim:
	li $v0, 4
	la $a0, msgMaior
	syscall
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	
	li $v0, 4
	la $a0, msgMenor
	syscall
	li $v0, 1
	add $a0, $t2, $zero
	syscall