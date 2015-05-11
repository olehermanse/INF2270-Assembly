# Demonstration of "variables" (.data) in assembly (AT&T)
# Author: github.com/olehermanse

# variables() should be globally available:
.globl variables
.globl _variables               # Mac OSX Compatibility

_variables:                     # Mac OSX Compatibility
variables:
    push %ebp                   # save base pointer for safe return
    movl %esp, %ebp             # store constant stack pointer ref
    
    movl num, %eax
    movl $0, num
    
    addl 8(%ebp), %eax
    
    # Restore and return:
    pop %ebp
    ret
    
.data
num:    .long   100



