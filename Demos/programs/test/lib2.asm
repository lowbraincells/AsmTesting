section .text
global lib2_function

lib2_function:
    push rbp
    mov rbp, rsp
    mov rax, rdi  ; Assume rdi is the first parameter
    sub rax, rsi  ; Assume rsi is the second parameter
    leave
    ret
