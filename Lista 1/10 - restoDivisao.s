.data
	msg1:.asciiz"\Digite o primeiro valor:\n"
	msg2:.asciiz"\Digite o segundo valor:\n"
	saida:.asciiz"\nResto da divisao: "
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
	
sePrimeiroValorMaior:
	bgt $t1, $t2, op1
senao:
	j op2
	
op1:
	div $t0, $t1, $t2
	mul $t0, $t0, $t2
	sub $t0, $t1, $t0
	j fim

op2:
	div $t0, $t2, $t1
	mul $t0, $t0, $t1
	sub $t0, $t2, $t0
	j fim

fim:
	li $v0, 4
	la $a0, saida
	syscall
	li $v0, 1
	add $a0, $t0, $zero
	syscall	
	