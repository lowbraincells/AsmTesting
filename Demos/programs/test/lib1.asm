section .text
global prints

prints:
    push  rbp
    mov   rbp, rsp
    push  r12      ; callee saved
    ; Count characters
    xor   rdx, rdx    ; length in rdx
    mov   r12, rdi
.lengthloop:
    cmp   byte [r12], 0
    je    .lengthfound
    inc   rdx
    inc   r12
    jmp   .lengthloop
.lengthfound:           ; print the string, length in rdx
    cmp   rdx, 0      ; no string (0 length)
    je    .done
    mov   rsi, rdi     ; rdi contains address of string
    mov   rax, 1      ; 1 = write
    mov   rdi, 1      ; 1 = stdout
    syscall
.done:
    pop r12
    leave
    ret
