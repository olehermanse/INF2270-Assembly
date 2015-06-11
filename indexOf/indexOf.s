# Example of indexOf Function in asm
# Author: github.com/olehermanse

.globl indexOf
.globl _indexOf             # Mac OSX Compatibility

# Name: indexOf.
# Synopsis: What is the index of c in str.
# C-signature: int indexOf(char c, char* str).
# Registers: 
# BL:   char c
# ESI:  char* str
# EAX:  int i (Counter / Index)
_indexOf:
indexOf:
    push %ebp                   # save base pointer for safe return
    movl %esp, %ebp             # store constant stack pointer ref
    
    pushl %ebx                  # callee saved register
    pushl %esi                  # callee saved register
    
    xorl %eax, %eax             # eax = 0
    xorl %ebx, %ebx             # ebx = 0
    xorl %esi, %esi             # esi = 0
    
    movb 8(%ebp), %bl           # bl = c
    movl 12(%ebp), %esi         # esi = str
    
    cmpl $0, %esi
    je notfound
    
stringloop:                     # while(1){
    cmpb %bl, (%esi)            #     if(c == *str)
    je return                   #         return i / goto return
    cmpb $0, (%esi)             #     if(*str == 0)
    je notfound                 #         return -1 / goto notfound
    incl %esi                   #     ++str
    incl %eax                   #     ++i
    jmp stringloop              # }
    
notfound:
    movl $-1, %eax              # return -1
    
return:
    # Restore and return:
    popl %esi                   # Restore callee saved register
    popl %ebx                   # Restore callee saved register
    movl %ebp, %esp             # Restore stack pointer if we fucked up push/pops
    popl %ebp                   # Standard
    ret

.globl contains
.globl _contains             # Mac OSX Compatibility
# Name: contains.
# Synopsis: Returns 1 if string contains c and 0 otherwise
# C-signature: int contains(char c, char* str).
# Registers: 
# BL:   char c
# ESI:  char* str
_contains:
contains:
    push %ebp                   # save base pointer for safe return
    movl %esp, %ebp             # store constant stack pointer ref
    
    pushl %ebx                  # callee saved register
    pushl %esi                  # callee saved register
    
    xorl %eax, %eax             # eax = 0
    xorl %ebx, %ebx             # ebx = 0
    xorl %esi, %esi             # esi = 0
    
    movb 8(%ebp), %bl           # bl = c
    movl 12(%ebp), %esi         # esi = str
    pushl %esi
    pushl %ebx
    call indexOf
    subl $8, %esp
    
    cmpl $-1, %eax
    je false
    
true:
    movl $1, %eax               # return 1
    jmp creturn
    
false:
    movl $0, %eax               # return 0
    
creturn:
    # Restore and return:
    popl %esi                   # Restore callee saved register
    popl %ebx                   # Restore callee saved register
    movl %ebp, %esp             # Restore stack pointer if we fucked up push/pops
    popl %ebp                   # Standard
    ret
