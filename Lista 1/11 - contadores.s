.data
	msg1:.asciiz"\nDigite um numero de 0 a 100:\n"
	msg2:.asciiz"\nDigite um numero menor ou igual a 100!!!"
	cnt1:.asciiz"\n[0-25] = "
	cnt2:.asciiz"\n[26-50] = "
	cnt3:.asciiz"\n[51-75] = "
	cnt4:.asciiz"\n[76-100] = "
.text
main:
	
inicio:
	li $v0, 4
	la $a0, msg1
	syscall
	li $v0, 5
	syscall
	add $t0, $v0, $zero

	blt $t0, $zero, fim
	ble $t0, 25, cont1
	ble $t0, 50, cont2
	ble $t0, 75, cont3
	ble $t0, 100, cont4
	bgt $t0, 100, inicio
	
cont1:
	addi $t1, $t1, 1
	j exibe 
cont2:
	addi $t2, $t2, 1
	j exibe
cont3:
	addi $t3, $t3, 1
	j exibe
cont4:
	addi $t4, $t4, 1
	j exibe

exibe:
	li $v0, 4
	la $a0, cnt1
	syscall
	li $v0, 1
	add $a0, $t1, $zero
	syscall
	
	li $v0, 4
	la $a0, cnt2
	syscall
	li $v0, 1
	add $a0, $t2, $zero
	syscall
	
	li $v0, 4
	la $a0, cnt3
	syscall
	li $v0, 1
	add $a0, $t3, $zero
	syscall
	
	li $v0, 4
	la $a0, cnt4
	syscall
	li $v0, 1
	add $a0, $t4, $zero
	syscall
	j inicio
fim: