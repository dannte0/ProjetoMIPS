.data
	msg1:.asciiz"\nDigite o dividendo:\n"
	msg2:.asciiz"\nDigite o divisor:\n"
	msgErro:.asciiz"\nDivisor deve ser maior que zero!\n"
	saida:.asciiz"\nResultado da operacao: "
.text
main:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
divisor:	
	li $v0, 4
	la $a0, msg2
	syscall
	li $v0, 5
	syscall
	add $t2, $v0, $zero
	
seIgualZero:
	beq $t2, $zero, repeticao
senao:
	j divisao
	
repeticao:
	li $v0, 4
	la $a0, msgErro
	syscall
	j divisor
	
divisao:
	li $v0, 4
	la $a0, saida
	syscall
	div $t0, $t1, $t2
	li $v0, 1
	add $a0, $t0, $zero
	syscall