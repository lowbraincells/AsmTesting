section .data
    fDigit db  "First digit: ", 0
    sDigit db  "Second digit: ", 0
    fDigitHigher    db  "first digit is higher", 10, 0
    sDigitHigher    db  "second digit is higher", 10, 0
    bDigitsEqual    db  "both digits are equal", 10, 0
    NL  db  10, 0
section .bss
    input   resb  2
    fDigitContent   resb  2
    sDigitContent   resb  2
section .text
    global main 
    extern prints
    extern reads
    extern copybuffer
main:
    push rbp
    mov rbp,rsp
    mov rdi,fDigit
    call prints
    mov rdi,input
    mov rsi,1
    call reads
    mov rcx,0x2
    mov rdi,input
    mov rsi,fDigitContent
    call copybuffer
    mov rdi, input
    call prints
    mov rdi,NL
    call prints
    mov rdi,sDigit
    call prints
    mov rdi,input
    mov rsi,1
    call reads
    ;mov r9,input
    mov rdi,fDigitContent
    call prints
    jmp exits
    ;mov rsi,input
    ;mov rdx,inputL
    ;call reads
    ;mov r9,[rsi]
    ;call prints
    ;lea rax,exits
    ;push rax
    ;cmp r8,r9
    ;jl fLowerDigit
    ;jg sLowerDigit
    ;je equalDigits
sLowerDigit:
    mov rsi,fDigitHigher
    call prints
    pop rax
    jmp rax
fLowerDigit:
    mov rsi,sDigitHigher
    call prints
    pop rax
    jmp rax
equalDigits:
    mov rsi,bDigitsEqual
    call prints
    pop rax
    jmp rax
exits:
    mov rax,60
    xor rdi,rdi
    syscall