; BITS 64

; global ft_strlen

; section .text

; ft_strlen:
;     xor rax, rax
;     mov r8b, byte [rdi]

; loop:
;     cmp r8b, 0
;     jmp return
;     call _inc
;     jmp loop

; _inc:
;     inc rax
;     inc rdi
;     mov r8b, byte [rdx]
;     ret


; return:
;     ret


section	.text
global	_ft_strlen

; delete RAX

_ft_strlen:
			xor		rax, rax			; i = 0
			jmp		compare
increment:
			inc		rax					; i++
compare:
			cmp		BYTE [rdi + rax], 0	; str[i] == 0
			jne		increment
done:
			ret							; return i