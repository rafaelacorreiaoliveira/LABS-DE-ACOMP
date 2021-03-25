#Pretende-se criar uma tabela na memória do processador com os valores de 
#i!+3^i, quando o i varia de 0 até 10

.data 
x: .word 1 #i!
y: .word 1 # 3^0
z: .word 2

.text 
la x10,x
la x11,y
la x12,z
li x13,1
li x16,3
li x18,10
lw x14,x
lw x15,y
foorlop: 

blt x18,x13,fim
mul x14,x14,x13  #i!
mul x15,x15,x16 #3^i
add x17,x14,x15
sw x17,4(x12)
addi x13,x13,1
addi x12,x12,4
j foorlop

fim:

li x17, 1
ecall
li x17, 10
ecall

