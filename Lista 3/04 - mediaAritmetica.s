#LISTA 3 - ATIVIDADE 4
.data
	msg1:.asciiz"\nDigite a primeira nota: \n"
	msg2:.asciiz"\nDigite a segunda nota: \n"
	msg3:.asciiz"\nDigite a terceira nota: \n"
	msg4:.asciiz"\nDigite a quarta nota: \n"
	msgMedia:.asciiz"\nA media final foi: "
	msgAprovado:.asciiz"\nAprovado"
	msgRetido:.asciiz"\nRetido"
	msgExame:.asciiz"\nExame"
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
	
	li $v0, 4
	la $a0, msg4
	syscall
	li $v0, 5
	syscall
	add $t4, $v0, $zero
	
#Calculo da media
	add $t5, $t1, $t2
	add $t6, $t3, $t4
	add $t7, $t5, $t6
	div $t0, $t7, 4
	
	li $v0, 4
	la $a0, msgMedia
	syscall
	li $v0, 1
	add $a0, $t0, $zero
	syscall

seNotaMaiorIgual6:
	bge $t0, 6, aprovado
senaoSeNotaMenor3:
	blt $t0, 3, retido
senao:
	j exame
	
	

aprovado:
	li $v0, 4
	la $a0, msgAprovado
	syscall
	j fim
retido:
	li $v0, 4
	la $a0, msgRetido
	syscall
	j fim
exame:
	li $v0, 4
	la $a0, msgExame
	syscall
fim:
