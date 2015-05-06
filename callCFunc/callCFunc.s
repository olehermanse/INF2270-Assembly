# Simple demonstration of how to call functions from assembly code
# Author: github.com/olehermanse

.globl callCFunc
.globl _callCFunc       # For OSX Compatibility

_callCFunc:             # For OSX Compatibility
callCFunc:
    push %ebp           # save base pointer for safe return
    movl %esp, %ebp     # store constant stack pointer ref
    
    # Get first argument from stack:
    movl 8(%ebp), %eax
    
    # Push argument on stack for c function call:
    pushl %eax

    # Call the c function from cFunc.c with argument on stack:
    call _cFunc

    # Remove argument from stack after function call:
    # We want to remove the argument from the stack (pop without saving the value)
    addl $4, %esp       # We just move the stack pointer instead of using popl        
    
    # Restore base pointer and return:
    popl %ebp

    # Return with return value in eax:
    ret
