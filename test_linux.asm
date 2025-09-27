    section .data           ; using section .data tells the assembler that everything following
                            ; this line (until another section is declared) should be treated
                            ; as initialized data
    num1 dd 5               ; dd define double word (4 bytes)
    num2 dd 3               ; which means variable num1, num2, result will occupy 4 bytes.
    result dd 0             ; initialize num1 to 5, num2 to 3, result to 0


;When the assembler sees section .text, it knows that the following lines will contain 
;machine instructions, such as arithmetic operations, data movement, and system calls. 
;This section is essential because the operating system loads the code from the .text section 
;into memory and executes it when your program runs. 
;Organizing code in this way helps keep data and instructions separate, 
;which is important for both program structure and security.
;CPU directive does not generate machine code or get executed by CPU


section .text               ; directive, tell the assembler that the following lines are code
    global _start           ; declare the entry point for the program

_start:                     ; program execution starts here
    mov eax, [num1]         ; instructions. copy the value of num1 stored at the memory address into eax register
    add eax, [num2]         ; [] indicate that you are accessing the value at the memory address, not the address itself
    mov [result], eax       ; store result into memory

    cmp eax, 10             ; compare eax with 10
    jg greater_than_10      ; jump if greater than 10, otherwise continue,jg is "jump if greater", greater_than_10 is a label
    mov ebx, 0              ; set ebx to 0 if eax <= 10
    jmp unconditional_jump  ; jmp means unconditional jump to the label unconditional_jump  

greater_than_10:            ; label for when eax > 10
    mov ebx, 1              ; set ebx to 1 if eax > 10  

unconditional_jump:         ; label for unconditional jump

    mov ebx, [result]       ; copy the value of result stored at the memory address into ebx register
    sub ebx, 2              ; subtract 2 from ebx
    mov [result], ebx       ; store updated result

    ; exit syscall
    mov  eax,1              ; syscall number for exit
    xor ebx, ebx            ; status 0
    int 0x80                ; interrupt to invoke syscall ，0x80 is the designated system call entry point in Linux.


