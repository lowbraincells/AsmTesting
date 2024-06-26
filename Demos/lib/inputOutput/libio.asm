section .data
section .bss
section .text
global prints
global reads

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
    je    .pdone
    mov   rsi,rdi     ; rdi contains address of string
    mov   rax, 1      ; 1 = write
    mov   rdi, 1      ; 1 = stdout
    syscall
.pdone:
    pop r12
    leave
    ret
reads:
section .data
        .NL    db    0xa
section .bss
        .inputchar       resb       1
section .text
push  rbp
mov   rbp, rsp
      push  r12              ; callee saved
      push  r13              ; callee saved
      push  r14              ; callee saved
      mov   r12, rdi    ; address of inputbuffer
      mov   r13, rsi    ; max length in r13
      xor   r14, r14    ; character counter
.readc:
      mov   rax, 0           ; read
      mov   rdi, 1           ; stdin
      lea   rsi, [.inputchar]     ; address of input
      mov   rdx, 1           ; # of characters to read
      syscall
      mov   al, [.inputchar]      ; char is NL?
      cmp   al, byte[.NL]
      je    .rdone            ; NL end
      cmp   al, 97           ; lower than a?
      jl    .readc           ; ignore it
      cmp   al, 122          ; higher than z?
      jg    .readc           ; ignore it
      inc   r14                    ; inc counter
      cmp   r14, r13
      ja    .readc           ; buffer max reached, ignore
      mov   byte [r12], al   ; safe the char in the buffer
      inc   r12              ; point to next char in buffer
      jmp   .readc
.rdone:
      inc   r12
      mov   byte [r12],0     ; add end 0 to inputbuffer
      pop   r14              ; callee saved
      pop   r13              ; callee saved
      pop   r12              ; callee saved
leave
ret