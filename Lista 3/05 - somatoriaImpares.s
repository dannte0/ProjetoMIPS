#LISTA 3 - ATIVIDADE 5
.data
	msg1:.asciiz"\nDigite o primeiro valor: "
	msg2:.asciiz"\nDigite o segundo valor: "
	msgSaida:.asciiz"\nO resultado da somatoria dos numeros entre os valores digitados: "
.text
main:
input:
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
	
	
verificaMaior:
	bgt $t1, $t2, enquantoN1maior
	bgt $t2, $t1, enquantoN1menor 
	beq $t1, $t2, fim
	
enquantoN1maior:
	add $t0, $t2, $zero
	somatoriaMaior:
	addi $t3, $t2, 1
	rem $t4, $t3, 2
	beqz $t4, contadorMaior
	add $t0, $t0, $t3
	contadorMaior:
	add $t2, $t2, 1
	blt $t2, $t1, somatoriaMaior
	j fim

enquantoN1menor:
	add $t0, $t1, $zero
	somatoriaMenor:
	addi $t3, $t1, 1
	rem $t4, $t3, 2
	beqz $t4, contadorMenor
	add $t0, $t0, $t3
	contadorMenor:
	add $t1, $t1, 1
	blt $t1, $t2, somatoriaMenor
	
fim:
	li $v0, 4
	la $a0, msgSaida
	syscall
	li $v0, 1
	add $a0, $t0, $zero
	syscall
