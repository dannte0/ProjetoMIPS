.data
	msg:.asciiz"\nDigite um numero:\n"
	msgPositivo:.asciiz"\nMaior que zero(2x)\n"
	msgNegativo:.asciiz"\nMenor que zero(3x)\n"
.text
main:
	li $v0, 4
	la $a0, msg
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero

sePositivo:
	bgt $t1, $zero, dobro
senao:
	j triplo

dobro:
	li $v0, 4
	la $a0, msgPositivo
	syscall
	mul $t0, $t1, 2
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	j fim
triplo:
	li $v0, 4
	la $a0, msgNegativo
	syscall
	mul $t0, $t1, 3
	li $v0, 1
	add $a0, $t0, $zero
	syscall
	j fim	
fim: