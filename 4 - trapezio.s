.data
	msg1:.asciiz"\nDigite o tamanho da base menor do trapezio:\n"
	msg2:.asciiz"\nDigite o tamanho da base maior do trapezio:\n"
	msg3:.asciiz"\nDigite a altura do trapezio:\n"
	saida1:.asciiz"\nArea do trapezio = "
	saida2:.asciiz" m2"
.text
main:
	#print ($v0, 4) | Digite o tamanho da base menor do trapezio ($a0, msg1)
	li $v0, 4
	la $a0, msg1
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#base_menor ($t1) = input
	add $t1, $v0, $zero
	
	#print ($v0, 4) | Digite o tamanho da base maior do trapezio ($a0, msg2)
	li $v0,4
	la $a0, msg2
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#base_maior ($t2) = input
	add $t2, $v0, $zero
	
	#print ($v0, 4) | Digite a altura do trapezio ($a0, msg3)
	li $v0, 4
	la $a0, msg3
	syscall
	#input ($v0, 5)
	li $v0, 5
	syscall
	#altura ($t3) = input
	add $t3, $v0, $zero
	
	#area ($t0) = base_menor ($t1) + base_maior ($t2)
	add $t0, $t1, $t2
	#area ($t0) = area ($t0) * altura ($t3)
	mul $t0, $t0, $t3
	#area ($t0) = area ($t0) / 2
	div $t0, $t0, 2
saida:
	#print ($v0, 4) | Area do trapezio = ($a0, saida1)
	li $v0, 4
	la $a0, saida1
	syscall
	#print ($v0, 1) | {area} ($a0, $t0, $zero)
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	#print ($v0, 4) | m2 ($a0, saida2)
	li $v0, 4
	la $a0, saida2
	syscall
	
	