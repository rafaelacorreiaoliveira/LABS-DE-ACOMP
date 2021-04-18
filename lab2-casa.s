# (a xor b) OR (c xor d)

.data

a: .word 0
b: .word 1
c: .word 0
d: .word 0
y: .word 0

.text
lw x11, a
lw x12, b
li x13, 2
li x14, -2
li x15, -1

rede_neuronal_xor: 
la x20 c
la x21 d
la x22 y
jal x1,neuronio
sw x10, 0(x20)
li x13 -2
li x14 2
jal x1,neuronio
sw x10, 0(x21)
lw x11, 0(x20)
lw x12, 0(x21)
li x13 2
li x14 2
jal x1,neuronio
sw x10, 0(x22)

li x17, 1
ecall
li x17,10
ecall

neuronio: 
addi sp, sp, -24
sw x11, 20(sp)
sw x12, 16(sp)
sw x13, 12(sp)
sw x14, 8(sp)
sw x15, 4(sp)
sw x1, 0(sp)
jal x1, multiplica
lw s2, 0(sp)
addi sp, sp, 4
sw x12, 20(sp)
sw x14, 12(sp)
jal x1, multiplica
lw s3, 0(sp)
addi sp,sp,4
add s2, s2, s3
lw x15, 4(sp)
add s4, s2, x15 #s = x1 * w1 + x2 * w2 - 1
lw x1, 0(sp)
addi sp, sp, 24

bge s4, x0 return
li x10, 0
ret
return:
li x10, 1
ret

multiplica: 
lw t1, 20(sp) # e oq ta no x11
lw t2, 12(sp) # e oq ta no x13
li t3, 0
bltz t2, negativo # verifica se t2 e negativo (se for vai para o negativo,
# se nao for vai para o else)

else:
add t3, t3, t1
addi t2, t2, -1
bgtz t2, else
addi sp,sp, -4
sw t3, 0(sp)
ret
negativo:
neg t2, t2
add t3, t3, t1
addi t2, t2, -1
bgtz t2, negativo
neg t3,t3
addi sp,sp, -4
sw t3, 0(sp)
ret
