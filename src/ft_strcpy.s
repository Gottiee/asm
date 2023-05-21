global _start

section .text

_start:
   cmp byte [rsp], 1
   je _exit
   lea rsi, [rsp + 16]
   mov rsi, [rsi]
   sub rsp, 0x8
   mov rdi, rsp
   call _ft_strcpy
   call _ft_strlen
   jmp _print

_ft_strcpy:
    cld
    mov rax, rdi
    jmp _loop

_cpy:
    movsb

_loop:
    cmp byte [rsi], 0
    jne _cpy
    movsb

_ret:
    ret

_ft_strlen:
    xor r9, r9
	jmp loop

_inc:
    inc r9

loop:
    cmp byte [rax+r9], 0
    jne _inc

return:
    ret

_print:
    mov rsi, rax
    mov rax, 1
    mov rdi, 1
    mov rdx, r9
    syscall

_exit:
    mov rax, 60
    mov rdi, 0
    syscall
    
; sous l'architecture x86-64, les six premiers arguments sont généralement passés dans les registres rdi, rsi, rdx, rcx, r8 et r9, respectivement.