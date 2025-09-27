.section __DATA,__data
num1:   .quad 5              ; 64-bit value 5
num2:   .quad 3              ; 64-bit value 3  
result: .quad 0              ; 64-bit value 0

.section __TEXT,__text
.global _main

_main:
    // Load num1 into x0
    adrp x1, num1@PAGE
    add x1, x1, num1@PAGEOFF
    ldr x0, [x1]
    
    // Load num2 and add to x0
    adrp x2, num2@PAGE
    add x2, x2, num2@PAGEOFF
    ldr x3, [x2]
    add x0, x0, x3
    
    // Store result
    adrp x4, result@PAGE
    add x4, x4, result@PAGEOFF
    str x0, [x4]
    
    // Compare with 10
    cmp x0, #10
    b.gt greater_than_10
    mov x5, #0
    b unconditional_jump
    
greater_than_10:
    mov x5, #1
    
unconditional_jump:
    // Load result, subtract 2, store back
    ldr x0, [x4]
    sub x0, x0, #2
    str x0, [x4]
    
    // Exit with status 0
    mov x0, #0              ; exit status
    mov x16, #1             ; exit system call number
    svc #0x80               ; system call