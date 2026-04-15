.data
	msg1:.asciiz"\nDigite o tamanho do primeiro cateto:\n"
	msg2:.asciiz"\nDigite o tamanho do segundo cateto:\n "
	saida1:.asciiz"\nHipotenusa = "
	saida2:.asciiz" cm"
.text
main:
	#print ($v0, 4) | Digite o tamanho do primeiro cateto
	li $v0, 4
	la $a0, msg1
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#cateto_a ($t1) = input
	add $t1, $v0, $zero
	
	#print ($v0, 4) | Digite o tamanho do segundo cateto
	li $v0, 4
	la $a0, msg2
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#cateto_b ($2) = input
	add $t2, $v0, $zero
	
	#hipotenusa ($t0) = cateto_a ($t1) * cateto_b ($t2)
	mul $t0, $t1, $t2
	
saida:
	#print ($v0, 4) | Hipotenusa = ($a0, saida1)
	li $v0, 4
	la $a0, saida1
	syscall
	#print ($v0, 1) | {hipotenusa} ($a0, $t0, $zero)
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	#print ($v0, 4) | cm ($a0, saida2)
	li $v0, 4
	la $a0, saida2
	syscall