#Pretende-se criar uma tabela na memória do procesador com os
#valores 3^(i+1) + 5*i
#Quando o i varia de 0 a 10

.data
i: .word 1

.text
la x10,i
lw x11, 0(x10) 
li x12, 9 #número de ciclos 
li x13, 3 #load do número 3
li x14, 5 #load do número 5
li x15, 3
li x20, 3
li x21, 0


loop: bge x21, x12, end
mul x15, x15, x13
mul x20, x14, x11
add x20, x20, x15
sw x20, 4(x10)
addi x10, x10, 0x4
addi x11, x11, 1 
addi x21, x21, 1
j loop
end:


li x17, 10
ecall