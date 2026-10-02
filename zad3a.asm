.data
num: .word 2

.text
main:
    li   a7, 5        
    ecall

    la   t0, num    
    lw   t1, 0(t0)     
    bne  a0, t1, no

    li   a0, 1
    j    out
no:
    li   a0, 0
out:
    li   a7, 1
    ecall
    li   a7, 10
    ecall
