.data
	msg1:.asciiz"\nDigite o primeiro valor: \n"
	msg2:.asciiz"\nDigite o segundo valor: \n"
	msgSaida:.asciiz"\nDiferença do maior para o menor = "
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
	
seN1Maior:
	bgt $t1, $t2, n1Maior
senao:
	j n2Maior
	
n1Maior:
	sub $t0, $t1, $t2
	li $v0, 4
	la $a0, msgSaida
	syscall
	li $v0, 1
	add $a0, $t0, $zero
	syscall	
	j fim

n2Maior:
	sub $t0, $t2, $t1
	li $v0, 4
	la $a0, msgSaida
	syscall
	li $v0, 1
	add $a0, $t0, $zero
	syscall

fim: