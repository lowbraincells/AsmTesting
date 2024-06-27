section .data
section .bss
section .text
global copybuffer

copybuffer:
    push  rbp
    mov   rbp, rsp
    push rax
.copy_loop:
    mov   rax, [rdi]        ; load byte from source
    mov   [rsi], rax        ; store byte to destination
    inc   rdi              ; move to next byte in source
    inc   rsi              ; move to next byte in destination
    loop  .copy_loop       ; repeat for all bytes
    pop rax
    leave
    ret