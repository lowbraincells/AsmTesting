section .data
    fDigit db  "First digit: ", 0
    sDigit db  "Second digit: ", 0
    fDigitHigher    db  "first digit is higher", 10, 0
    sDigitHigher    db  "second digit is higher", 10, 0
    bDigitsEqual    db  "both digits are equal", 10, 0
    input   db  256 dup(0)
section .bss
section .text
    global main 
    extern prints
    extern reads
main:
    push rbp
    mov rbp,rsp
    mov rdi,fDigit
    call prints
    mov rdi,input
    mov rsi,3
    call reads
    mov rdi,input
    call prints
    jmp exits
    ;mov r8,[rsi]
    ;call prints
    ;mov rsi,sDigit
    ;call prints
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
;---------------------------------------------
;prints:
    ; args rsi (content address) rdi (content length)
;    push rbp
;    mov rbp,rsp
;    mov rax,1
;    mov rdi,1
;    syscall
;    leave
;    ret
;---------------------------------------------
;reads:
    ; args rsi (contain address) rdi (content length)
;    push rbp
;    mov rbp,rsp
;    xor rax,rax
;    mov rdi,1
;    syscall
;    leave
;    ret
;---------------------------------------------
exits:
    mov rax,60
    xor rdi,rdi
    syscall