BITS 64

global _start

section .bss
    number resb 8

section .data
    strs db 'Je call la boucle ', 0x0
    strLen equ $-strs
    backSlachN db 0xa, 0x0
    backSlachNLen equ $-backSlachN

section .text

_start:
    mov r12, 0
    jmp _loop

_loop:
    cmp r12, 9
    je _exit
    inc r12
    call _print
    jmp _loop
    
_print:
    mov rax, 1
    mov rdi, 1
    mov rsi, strs
    mov rdx, strLen
    syscall
    mov rax, 1
    mov rsi, number 
    mov rcx, r12
    add rcx, 48
    mov [number], rcx
    mov rdx, 10
    syscall
    mov rax, 1
    mov rsi, backSlachN
    mov rdx, backSlachNLen
    syscall
    ret

_exit:
    mov rax, 60
    xor rdi, rdi
    syscall