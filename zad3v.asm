.data
size:  .word 18          
arr:   .space 72         
space: .string " "     

.text
main:
    la   t0, size
    lw   t0, 0(t0)
    la   t1, arr         
    li   t2, 0           

read_loop:
    bge  t2, t0, read_done  

    li   a7, 5          
    ecall                

    beqz  a0, read_done   

    sw   a0, 0(t1)       
    addi t1, t1, 4       
    addi t2, t2, 1       
    j    read_loop

read_done:
    la   t1, arr         
    li   t3, 0          

print_loop:
    bge  t3, t2, done    
    lw   a0, 0(t1)       
    li   a7, 1           
    ecall

    la   a0, space
    li   a7, 4          
    ecall

    addi t1, t1, 4
    addi t3, t3, 1
    j    print_loop

done:
    li   a7, 10          
    ecall