# middle.asm program
#

.data
    # TODO: Complete these declarations / initializations
    prompt: .asciiz "Enter the next number:\n"
    result: .asciiz "Second Largest: "
    newline: .asciiz "\n"

#Text Area (i.e. instructions)
.text
main:
    # TODO: Write your code here
    # You can have other labels expressed here, if you need to

    # Get First Number
    li $v0, 4
	la $a0, prompt
	syscall
    li $v0, 5
    syscall
    move $t0, $v0

    # Get Second Number
    li $v0, 4
	la $a0, prompt
	syscall
    li $v0, 5
    syscall
    move $t1, $v0

    # Get Third Number
    li $v0, 4
	la $a0, prompt
	syscall
    li $v0, 5
    syscall
    move $t2, $v0

# Determine the Second Largest
    # Check Equal
    beq $t0, $t1, equal1 # equal
    beq $t1, $t2, equal2 # equal
    beq $t2, $t0, equal3 # equal

    # Check Solution $t0
    slt $t4, $t0, $t1
    slt $t5, $t0, $t2
    and $t3, $t4, $t5
    beq $t3, $zero, resOne #$t0 is result

    # Check Solution $t1
    slt $t4, $t1, $t0
    slt $t5, $t1, $t2
    and $t3, $t4, $t5
    beq $t3, $zero, resTwo #$t1 is result

    # Check Solution $t2
    slt $t4, $t2, $t0
    slt $t5, $t2, $t1
    and $t3, $t4, $t5
    beq $t3, $zero, resThree #$t2 is result

# If Equal 1    
equal1: 
    li $v0 4
    la $a0 result
    syscall
    li $v0 4
    la $a0 newline
    syscall
    li $v0 1
    move $a0 $t0
    syscall
    li $v0 4
    la $a0 newline
    syscall
    j exit

# If Equal 2    
equal2: 
    li $v0 4
    la $a0 result
    syscall
    li $v0 4
    la $a0 newline
    syscall
    li $v0 1
    move $a0 $t1
    syscall
    li $v0 4
    la $a0 newline
    syscall
    j exit

# If Equal 3    
equal3: 
    li $v0 4
    la $a0 result
    syscall
    li $v0 4
    la $a0 newline
    syscall
    li $v0 1
    move $a0 $t2
    syscall
    li $v0 4
    la $a0 newline
    syscall
    j exit

# If $t0    
resOne: 
    li $v0 4
    la $a0 result
    syscall
    li $v0 4
    la $a0 newline
    syscall
    li $v0 1
    move $a0 $t0
    syscall
    li $v0 4
    la $a0 newline
    syscall
    j exit

# If $t1    
resTwo: 
    li $v0 4
    la $a0 result
    syscall
    li $v0 4
    la $a0 newline
    syscall
    li $v0 1
    move $a0 $t1
    syscall
    li $v0 4
    la $a0 newline
    syscall
    j exit

# If $t2    
resThree: 
    li $v0 4
    la $a0 result
    syscall
    li $v0 4
    la $a0 newline
    syscall
    li $v0 1
    move $a0 $t2
    syscall
    li $v0 4
    la $a0 newline
    syscall
    j exit

exit:
    # TODO: Write code to properly exit a SPIM simulation
    li $v0 10
    syscall
