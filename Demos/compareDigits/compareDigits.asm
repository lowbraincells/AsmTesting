section .data
    fDigit db  "First digit: ", 0
    fDigitLen equ $-fDigit-1
    sDigit db  "Second digit: ", 0
    sDigitLen equ $-sDigit-1
    fDigitHigher    db  "first digit is higher", 10, 0
    fDigitHigherLen equ $-fDigitHigher-1
    sDigitHigher    db  "second digit is higher", 10, 0
    sDigitHigherLen equ $-sDigitHigher-1
    bDigitsEqual    db  "both digits are equal", 10, 0
    bDigitsEqualLen equ $-bDigitsEqual-1
    inputL    equ 2
section .bss
    input   resb    inputL+1
section .text
    global main
main:
    push rbp
    mov rbp,rsp
    mov rsi,fDigit
    mov rdx,fDigitLen
    call prints
    mov rsi,input
    mov rdx,inputL
    call reads
    mov r8,[rsi]
    call prints
    mov rsi,sDigit
    mov rdx,sDigitLen
    call prints
    mov rsi,input
    mov rdx,inputL
    call reads
    mov r9,[rsi]
    call prints
    lea rax,exits
    push rax
    cmp r8,r9
    jl fLowerDigit
    jg sLowerDigit
    je equalDigits
sLowerDigit:
    mov rsi,fDigitHigher
    mov rdx,fDigitHigherLen
    call prints
    pop rax
    jmp rax
fLowerDigit:
    mov rsi,sDigitHigher
    mov rdx,sDigitHigherLen
    call prints
    pop rax
    jmp rax
equalDigits:
    mov rsi,bDigitsEqual
    mov rdx,bDigitsEqualLen
    call prints
    pop rax
    jmp rax
;---------------------------------------------
prints:
    ; args rsi (content address) rdi (content length)
    push rbp
    mov rbp,rsp
    mov rax,1
    mov rdi,1
    syscall
    leave
    ret
;---------------------------------------------
reads:
    ; args rsi (contain address) rdi (content length)
    push rbp
    mov rbp,rsp
    xor rax,rax
    mov rdi,1
    syscall
    leave
    ret
;---------------------------------------------
isInteger:
    push rbp
    mov rbp,rsp
    
    leave
    ret
;---------------------------------------------
getSingleDigit:
    push rbp
    mov rbp,rsp
    push r8
    ;mov r8,r15
    ;SUB r8,30

    pop r8
    leave
    ret
;---------------------------------------------
exits:
    mov rax,60
    xor rdi,rdi
    syscall