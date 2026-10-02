.data
y:     .word 126        
h:     .word 2          
space: .string " "      

.text
main:
    li   a7, 5
    ecall

    la   t0, y          
    lw   t0, 0(t0)      
    la   t3, h
    lw   t3, 0(t3)

    blt  a0, t0, x_less 

    mv   t1, t0
    mv   t2, a0
    j    loop

x_less:
    mv   t1, a0
    mv   t2, t0

loop:
    bgt  t1, t2, done  

    mv   a0, t1         
    li   a7, 1
    ecall

    la   a0, space 
    li   a7, 4     
    ecall

    add  t1, t1, t3    
    j    loop

done:
    li   a7, 10         
    ecall