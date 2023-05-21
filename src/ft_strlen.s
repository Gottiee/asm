BITS 64

global _ft_strlen

section .text

_ft_strlen:
    xor rax, rax
	jmp loop

_inc:
    inc rax

loop:
    cmp byte [rdi+rax], 0
    jne _inc

return:
    ret
