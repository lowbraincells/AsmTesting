section .data
msg db 'Hello from assembly!', 0
section .text
global main
extern prints
;extern lib2_function

main:
    push rbp
    mov rbp, rsp

    ; Call lib1_function
    mov rdi, msg
    call prints

    ; Save result
    ;mov rbx, rax

    ; Call lib2_function with the result of lib1_function
    ;mov rdi, rbx
    ;mov rsi, 2
    ;call lib2_function

    ; Function epilogue
    leave
    ret
