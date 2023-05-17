# BASIQUE

**At&T** : instruction like $0x1, %eax

**Intel**: instruction eax, 0x1

## Sections

**.bss** = variables not initialisees : ```int a;```

**.data** = variables initialisees: ```int a = 1;```

**.text** = code executable: ```printf("ok");```

___

### .data Section 

```section .data```
Declare a variable:
```asm
_data db 'db is declare byte', 0xa, 0x0 
```
**_data** : le nom de notre variable

**db**: instruction decalre byte

**0xa** : ecrite '\n' a la suite de la string

**0x0** : ecrire '\0' a la fin de la string

___

### .text Section

```section .text```
#### Registre 

16bits | 32bits | 64bits | definition
--- | --- | ---| ---
ax | Eax | rax
bx | Ebx | rbx
cx | Ecs | rcx
dx | Edx | rdx
si | Esi | rsi # src
di | Edi | rsi
sp | Esp | rsp | stack pointer (pointe sur le haut de la stack)
bp | Ebp | rbp
ip | eip | rip | instruction pointer (vers la prochaine action a executer)

[Instruction] [Operand, Value]
mov : met une valeur dans un registres (mov rax, 1)
db : declare un byte
cmp : compare des valeurs et set le RFLAGS
lea :move effective adress | met l'orperand de source dasn dest 

------------------JUMP / IF------------------

[JUMP]
[inconditionel]
jmp <etiquette> : va a l'etiquette <etiquette> et exectute le code
[conditionel]
je/jz == jmp if equal/zero (ZF == 1 ?)
jne/jne == jmp if not equal/zero (ZF == 0 ?)
ja/jnb == jmp if above/ not below (ZF & CF) > / => 
jg == jmp if greater (ZF & OF) >
jb == jmp if bellow (CF) <
jl == jmp if less (CF) <

[Greater?Above?]
less/greater == signed ; int a;
above/below == unsigned; unsigned int a ;

------------------FLAGS------------------

[type]
FLAGS(16bit) | EFLAGS(32bits) | RFLAGS(64bits)
https://fr.wikipedia.org/wiki/RFLAGS | wiki des flags

Il permet de fixer et de connaître l'état du processeur à tout moment grâce aux différents bits qui le composent.
Ce registre permet ainsi d'avoir à tout instant l'état résultant d'une instruction ayant été exécutée par le processeur,
la plupart des instructions des processeurs x86 affectant ce registre.

[carryFlag] 
CF | drapeau arme si l'operation genere une retenue sur le bit le plus significatif
[zeroFlag]
ZF| drapeau arme si operation arithmeique vaut 0
[overflowFlag]
OF | arme si constitue un bit positif ou negatif ne pouvant tenir dans l'operand de destination

------------------GDB------------------

[vmmap]
vmmap ? virtual memory area (permet de print les zone memoir et voir leurs persission [rwx])

------------------COMMANE LINE------------------

[compilation]
compilation : nasm -f elf64 main.asm -o target.o && ld target.o -o target
[strace]
strace ./executable

------------------Code Example------------------

[MainArgument]
argument du main : {
lea rsi, [rsp+8] -> lea recupere l'adress de rsp + 8 qui equivaut a 
rsp + 0 : argc
rsp + 8 : argv**
donc on obtient argv*** qui est deferencer avec l'appelle []
mov rsi, [rsi] -> on dereference le poiteur et on passe de argv ** a argv* (ici on pointe sur argv[0])
}# asm
