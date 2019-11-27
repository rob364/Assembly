.data
	msg1: .asciiz "\nDigite um numero inteiro: "
	msgigual: .asciiz "\nSão iguais"
	msgmaior: .asciiz "\nO primeiro e maior que o segundo"
	msgmenor: .asciiz "\nO segundo e maior que o primeiro"
.text
main:
	
	
	li $v0, 4			
	la $a0, msg1			
	syscall
	
	li $v0, 5 				
	syscall					
	add $t1, $v0, $zero	 # primeiro

	li $v0, 4				
	la $a0, msg1			
	syscall
	
	li $v0, 5 				
	syscall					
	add $t2, $v0, $zero		

	beq $t1, $t2, igual		
	sgt $t3,$t1, $t2
	beq $t3,$zero,maior
	slt $t4,$t1, $t2	
	beq $t4,$zero,menor

	igual:
	      li $v0, 4
	      la $a0, msgigual
	      syscall
	      j $ra					

	maior:
	      li $v0, 4
	      la $a0, msgmenor
	      syscall
	      j $ra					
	
	menor:
	      li $v0, 4
	      la $a0, msgmaior
	      syscall
	      j $ra	
	
	j$ra
	
	