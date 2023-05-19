<h1 align="center" >ASM 64x86 BASIQUE</h1>

<h3 align="center"> Share Essential and Basique info on asm </h3>

**At&T** : instruction like $0x1, %eax

**Intel**: instruction eax, 0x1

## Table of Content

- [Section](#sections)
  - [.bss Section](#bss-section)
  - [.data Section](#data-section)
  - [.text Section](#text-section)
    - [registre](#registre)
  - [Jmp / If](#jmp-if)
  - [Syscall](#syscall)
  - [Flags](#flags)
- [GDB](#gdb)
- [Command Line](#command-line)
- [Code Exemple](#code-example)
  - [Arguments du main](#arguments-du-main)
  - [Call instruction](#call-instruction)
- [Doc](#docu)


<h2 align="center">Sections</h2>

**.bss** = variables not initialisees : ```int a;```

**.data** = variables initialisees: ```int a = 1;```

**.text** = code executable: ```printf("ok");```

___

<h3 align="center">bss Section<h3>

```section .bss```

- Declare a variable:

```asm
  my_data resq 1
```

Directiv | explanation | code | =>
--- | --- | --- | ---
resb | reserve a byte | ```data resb 3``` | reserv 3 bytes
resw | reserve a word (2 byte) | ```data resw 2``` | reserv 4 bytes
resd | reserv a double word (4 byte) | ```data resd 1``` | reserv 4 bytes 
resq | reserv a quad word (8 byte) | ```data resq 1``` | reserv 8 bytes 

___

<h3 align="center">data Section<h3>

```section .data```

- Declare a variable:

```asm
_data db 'db is declare byte', 0xa, 0x0 
```

**_data** : le nom de notre variable

**db**: instruction decalre byte

**0xa** : ecrite '\n' a la suite de la string

**0x0** : ecrire '\0' a la fin de la string

- Variable lenght

```asm
_data_len equ $-_data
```

**$-** : permet de recuperer la longeur de la chaine de caractere donnee

___

<h3 align="center">text Section</h3>

```section .text```
  
<h4 align="center">Registre</h4> 

16bits | 32bits | 64bits | definition
--- | --- | ---| ---
ax | Eax | rax
bx | Ebx | rbx
cx | Ecs | rcx
dx | Edx | rdx
si | Esi | rsi # src
di | Edi | rsi
sp | Esp | rsp | stack pointer (pointe sur le haut de la stack)
bp | Ebp | rbp | base stack pointer (high adress)
ip | eip | rip | instruction pointer (vers la prochaine action a executer)
r8w | r8d | r8
r9w | r9d | r9
r10w | r10d | r10
r11w | r11d | r11
r12w | r12d | r12
r13w | r13d | r13
r14w | r14d | r14
r15w | r15d | r15

___

<h3 align="center">Instruction</h3>

usage ```Operand, Value```

Instruction | definition | precision and specific usage
--- | --- | ---
**mov** | met une valeur dans un registres (mov rax, 1)
**db** | declare un byte
**cmp** | compare des valeurs et set le RFLAGS
**lea** | move effective adress | met l'adress de source dans dest
**jmp** | effectue des sauts inconditionell direct | ne sauvegarde pas l'adress de retour 
**call** | effectue sous routine / appelle de fonctions | sauvergarde l'adress de retour en la pushant sur la stack
**dec** | decremente une valeur contenue dans un registre | usage : ```dec r12```
**inc** | incremente une valeur contenue dans un registre | usage : ```inc r12```
**add** | ajoute une valeur contenue dans un registre
**call** | add rip on the stack and jump | ```push rip && jmp <etiquette>```
**leave** | retinitat stack value to previous push rbp | ```mov rsp, rpb && pop rbp```
**ret** | jump at the top stack adress | ```pop rip && jmp rip```

___

<h3 align="center">JMP IF</h3>

<h4>Unconditionel</h4>

usage ```jmp <etiquette>``` : va a l'etiquette <etiquette> et exectute le code

<h4>Conditionel</h4>

instruction | == | appropriate Flags | sign
--- | --- | --- | ---
**je/jz** | jmp if equal/zero | ZF == 1 ? | ==
**jne/jne** | jmp if not equal/zero | ZF == 0 ? | !=
**ja/jnb** | jmp if above/ not below | ZF & CF | > / => 
**jg** | jmp if greater | ZF & OF | >
**jb** | jmp if bellow | CF | <
**jl** | jmp if less | CF | <

#### usage Greater?Above?
**less/greater** == signed  ```int a;```
**above/below** == unsigned ```unsigned int a;```

___

<h3 align="center">Syscall</h3>

> The syscall instruction is used in 64-bit assembly language to make a system call, requesting a service or functionality from the operating system. It transfers control from user mode to kernel mode, allowing the program to interact with the underlying operating system.

[Syscall Table](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)

Modified register after a syscall:

Register | Value
--- | ---
rax | return value of syscall
rcx, rdx, rsi, r8, r9, r10 | can be modified before and after the syscall depend on what u call
r11 | can contain specified indication or flags depend on what u call
rsp | can be modified if things are push or pop on the stack
___
  
<h3 align="center">Flags</h3>

FLAGS(16bit) | EFLAGS(32bits) | RFLAGS(64bits)
--- | --- | ---
  
-> [Wiki des flags](https://fr.wikipedia.org/wiki/RFLAGS) 

> Il permet de fixer et de connaître l'état du processeur à tout moment grâce aux différents bits qui le composent.
Ce registre permet ainsi d'avoir à tout instant l'état résultant d'une instruction ayant été exécutée par le processeur,
la plupart des instructions des processeurs x86 affectant ce registre.

Flags | abreviation | explication
--- | --- | ---
Carry Flag | CF | drapeau arme si l'operation genere une retenue sur le bit le plus significatif
Zero Flag | ZF| drapeau arme si operation arithmeique vaut 0
Overflow Flag | OF | arme si constitue un bit positif ou negatif ne pouvant tenir dans l'operand de destination

___
  
<h3 align="center">GDB</h3>
  
Command | explication | precision 
--- | --- | ---
```vmmap``` | virtual memory area | permet de print les zone memoir et voir leurs persission [rwx]

___  

<h3 align="center">Command Line</h3>

command | expliquation | precision
--- | --- | ---
```nasm -f elf64 main.asm -o target.o && ld target.o -o target``` | compilation | create oject and linker dynamic
```strace ./executable``` | execute && show syscall

___

<h3 align="center">Code Example</h3>

- **Arguments du main**

```asm
lea rsi, [rsp+8] ; lea recupere l'adress de rsp + 8 qui equivaut a 
rsp + 0 ; argc
rsp + 8 ; argv**
;donc on obtient argv*** qui est deferencer avec l'appelle []
mov rsi, [rsi] ; on dereference le poiteur et on passe de argv ** a argv* (ici on pointe sur argv[0])
```

- **Call instruction**

```asm
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
```


___

<h3 align="center">Docu</h3>

- [Tutorial asm](https://revers.engineering/applied-reverse-engineering-series/)
- [syscall table](https://blog.rchapman.org/posts/Linux_System_Call_Table_for_x86_64/)
- [Wiki des flags](https://fr.wikipedia.org/wiki/RFLAGS)
