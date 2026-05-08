.data
	msg1: .asciiz"\nDigite a quantidade de camisetas pequenas:\n"
	msg2: .asciiz"\nDigite a quantidade de camisetas medias:\n"
	msg3: .asciiz"\nDigite a quantidade de camisetas grandes:\n"
	moeda: .asciiz"\nR$ "
	saida1: .asciiz" em camisetas pequenas"
	saida2: .asciiz" em camisetas medias"
	saida3: .asciiz" em camisetas grandes"
.text
main:
	#print ($v0, 4) | Digite a quantidade de camisetas pequenas: ($a0, msg1)
	li $v0, 4
	la $a0, msg1
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#camisetas_p ($t1) = input
	add $t1, $v0, $zero
	
	#print ($v0, 4) | Digite a quantidade de camisetas medias: ($a0, msg2)
	li $v0, 4
	la $a0, msg2
	syscall
	#input ($v0, 5)	
	li $v0, 5
	syscall
	#camisetas_m ($t2) = input
	add $t2, $v0, $zero
	
	#print($v0, 4) | Digite a quantidade de camisetas grandes: ($a0, msg3)
	li $v0, 4
	la $a0, msg3
	syscall
	#input ($v0, 5)	
	li $v0, 5
	syscall
	#camisetas_g ($t3) = input
	add $t3, $v0, $zero

saida:	
	#Saida camisetas pequenas:
	#valor($t0) = camisetas_p($t1) * 10
	mul $t0, $t1, 10
	
	#print ($v0, 4) | R$ ($a0, moeda)
	li $v0, 4
	la $a0, moeda
	syscall
	#print ($v0, 1) | {valor} ($a0, $t0, $zero)
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	#print ($v0, 4) | em camisetas pequenas ($a0, saida1)
	li $v0, 4
	la $a0, saida1
	syscall
	
	#Saida camisetas medias:
	#valor($t0) = camisetas_m($t2) * 12
	mul $t0, $t2, 12
	
	#print ($v0, 4) | R$ ($a0, moeda)
	li $v0, 4
	la $a0, moeda
	syscall
	#print ($v0, 1) | {valor} ($a0, $t0, $zero)
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	#print ($v0, 4) | em camisetas medias ($a0, saida2)
	li $v0, 4
	la $a0, saida2
	syscall
	
	#Saida camisetas grandes:
	#valor($t0) - camisetas_g($t3) * 15
	mul $t0, $t3, 15
	
	#print ($v0, 4) | R$ ($a0, moeda)
	li $v0, 4
	la $a0, moeda
	syscall
	#print ($v0, 1) | {valor} ($a0, $t0, $zero)
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	#print ($v0, 4) | em camisetas grandes ($a0, saida3)
	li $v0, 4
	la $a0, saida3
	syscall