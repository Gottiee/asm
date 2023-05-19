BITS 64

global _start

section .data
    _argc db 'Waiting for main argc', 0xa, 0x0
    _argcLen equ $-_argc

section .text
_start:
    push rbp
    mov rbp, rsp
    lea rsi, [rsp+8]
    mov rsi, [rsi]
    cmp rsi, 1
    je _printExit
    lea rsi, [rsp+8*3]
    mov rsi, [rsi]
    call ft_strlen
    mov rdx, rax
    mov rax, 1
    mov rdi, 1
    syscall
    jmp _exit

ft_strlen:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov [rsp], rsi
    mov rax, 0
    mov rdx, [rsp]
    mov r8b, byte [rdx]
    jmp loop

loop:
    cmp r8b, 0
    je endStrLen
    inc rax
    inc rdx
    mov r8b, byte [rdx]
    jmp loop

endStrLen:
    leave
    ret

_printExit:
    mov rax, 1
    mov rdi, 1
    mov rsi, _argc
    mov rdx, _argcLen
    syscall
    jmp _exit

_exit:
    mov rax, 60
    mov rdi, 0
    syscall
