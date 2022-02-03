# Pow.asm program
#

# C++ (NON-RECURSIVE) code snippet of pow(x,n):
#	int x, n, pow=1; 
#   cout << "Enter a number x:\n"; 
#   cin >> x;
#   cout << "Enter the exponent n:\n"; 
#   cin >> n; 
#   for (int i = 1; i <= n; i++) { 
#   	pow = pow * x; 
#   } 
#   cout << "Power(x,n) is:\n" << pow << "\n";
#
# Assembly (NON-RECURSIVE) code version of pow(x,n):
#
.data
	# TODO: Write your initializations here
	prompt1: .asciiz "Enter the number x:\n"
	prompt2: .asciiz "Enter the exponent n:\n"
	output: .asciiz "Power(x,n) is:\n"
	newline: .asciiz "\n"


#Text Area (i.e. instructions)
.text
main:
	# TODO: Write your code here
	# Get First Input
    li $v0, 4
	la $a0, prompt1
	syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Get Second Input
    li $v0, 4
	la $a0, prompt2
	syscall
    li $v0, 5
    syscall
    move $t1, $v0

	# Declare pow
	li $t3, 1
	li $t2, 0
	
loop:
	bge $t2, $t1, finish
	mult $t3, $t0
	mflo $t3
	addi $t2, 1
	j loop

finish:
	li $v0, 4
	la $a0, output
	syscall
	li $v0, 1
	move $a0, $t3
	syscall
	li $v0, 4
	la $a0, newline
	syscall
	j exit

exit:
	# TODO: Write code to properly exit a SPIM simulation
	li $v0 10
    syscall
