BITS 64

section .text

global _start

_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [rsp+16]
    mov rsi, [rsi]
    mov rdx, 3
    syscall
    mov rax, 60
    xor rdi, rdi
    syscall
