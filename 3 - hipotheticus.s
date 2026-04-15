.data
	msg1:.asciiz"\nDigite a quantidade de horas trabalhadas: "
	msg2:.asciiz"\nDigite a quantidade de horas extras trabalhadas: "
	msg3:.asciiz"\nDigite o desconto a ser aplicado (R$): "
	moeda:.asciiz"R$"
	saida1:.asciiz"\nSalario Bruto = "
	saida2:.asciiz"\nSalario Liquido = "
.text
main:
	#print ($v0, 4) | Digite a quantidade de horas trabalhadas ($a0, msg1)
	li $v0, 4
	la $a0, msg1
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#horas_trabalhadas($t1) = input
	add $t1, $v0, $zero
	
	#print ($v0, 4) | Digite a quantidade de horas extras trabalhadas ($a0, msg2)
	li $v0, 4
	la $a0, msg2
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#horasExtras_trabalhadas($t2) = input
	add $t2, $v0, $zero
	
	#print ($v0, 4) | Digite o desconto a ser aplicado(R$) ($a0, msg3)
	li $v0, 4
	la $a0, msg3
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#desconto($t3) = input
	add $t3, $v0, $zero
	
	#valor_hora($t4) = horas_trabalhadas($t1) * 10
	mul $t4, $t1, 10
	#valor_horaExtra($t5) = horasExtras_trabalhadas($t2) * 15
	mul $t5, $t2, 15
	#salario_bruto($t6) = valor_hora + valor_horaExtra
	add $t6, $t4, $t5
	
	#salario_liquido($t0) = salario_bruto($t6) - desconto($t3)
	sub $t0, $t6, $t3

saida:
	#Saida salario_bruto:
	#print ($v0, 4) | Salario Bruto = ($a0, saida1)
	li $v0, 4
	la $a0, saida1
	syscall
	#print ($v0, 4) | R$ ($a0, moeda)
	li $v0, 4
	la $a0, moeda
	syscall
	#print ($v0, 1) | {salario_bruto} ($a0, $t6, $zero)
	li $v0, 1
	add $a0, $t6, $zero
	syscall
	
	#Saida salario_liquido:
	#print ($v0, 4) | Salario Liquido = ($a0, saida2)
	li $v0, 4
	la $a0, saida2
	syscall
	#print ($v0, 4) | R$ ($a0, moeda)
	li $v0, 4
	la $a0, moeda
	syscall	
	#print ($v0, 1) | {salario_liquido} ($a0, $t0, $zero)
	li $v0, 1
	add $a0, $t0, $zero
	syscall

	#base_maior + base_menor
	
	