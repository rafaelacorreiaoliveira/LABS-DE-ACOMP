#Sequencia de Fibonacci

.data
vet:.zero 40
a: .word 1
b: .word 1
c: .word 0

.text
lw x10, a
lw x11, b
lw x12, c
lw x13, vet

sw x11, 0(x13) 

li x20, 1 #i
li x21, 10 #número máximo 

#loop

for:
beq x20, x21 end
addi x13,x13,4
sw x11, 0(x13)
or x12, x0, x11
add x11, x11, x10
or x10,x0,x12
addi x20, x21,1
j for

end:
li x17,1
ecall

li x17,10
ecall