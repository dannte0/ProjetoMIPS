.data
	msg:.asciiz"\nDigite a altura (cm): \n"
	msgMaior:.asciiz"\nMaior altura: "
	msgMenor:.asciiz"\nMenor altura: "
	medida:.asciiz" cm"
.text
main:
loop:
	li $v0, 4
	la $a0, msg
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero

	bge $t5, 1, verificaAlturas
	add $t1, $t0, $zero
	add $t2, $t0, $zero

verificaAlturas:
	bgt $t0, $t1, atribuiMaior
	blt $t0, $t2, atribuiMenor
	j contador
atribuiMaior:
	add $t1, $t0, $zero
	j contador
atribuiMenor:	
	add $t2, $t0, $zero
	j contador
contador:		
	add $t5, $t5, 1
	ble $t5, 14, loop
fimLoop:
	li $v0, 4
	la $a0, msgMaior
	syscall
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	li $v0, 4
	la $a0, medida
	syscall
	
	li $v0, 4
	la $a0, msgMenor
	syscall
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	li $v0, 4
	la $a0, medida
	syscall