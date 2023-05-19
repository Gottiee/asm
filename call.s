global _start

section .text

_start: 
    push rbp
    mov rbp, rsp
    call function
    jmp _exit

function:
    push rbp
    mov rbp, rsp
    sub rsp, 16
    leave
    ret

_exit:
    mov rax, 60
    mov rdi, 0
    syscall