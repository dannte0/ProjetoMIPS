.data
	msg:.asciiz"\nDigite um numero\n"
	msgPar:.asciiz"\nPar (+5)\n"
	msgImpar:.asciiz"\nImpar (+8)\n"
	msgSoma:.asciiz"\nSoma = "
.text
main:
	li $v0, 4
	la $a0, msg
	syscall
	li $v0, 5
	syscall
	add $t1, $v0, $zero
	
	addi $t2, $t2, 2
	rem $t0, $t1, $t2
sePar:
	beq $t0, $zero, somaPar
senao:
	j somaImpar

somaPar:
	li $v0, 4
	la $a0, msgPar
	syscall
	li $v0, 1
	addi $a0, $t1, 5
	syscall
	j fim

somaImpar:
	li $v0, 4
	la $a0, msgImpar
	syscall
	li $v0, 1
	addi $a0, $t1, 8
	syscall
	j fim
fim: