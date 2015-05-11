# Simple example of a memcpy like function in asm (AT&T)
# Author: github.com/olehermanse

# declaration:
# extern float floatMultiply(char* dest, char* src, int n);

# floatMultiply should be globally available:
.globl floatMultiply
.globl _floatMultiply           # Mac OSX Compatibility

_floatMultiply:                 # Mac OSX Compatibility
floatMultiply:
    # Standard:
    push %ebp                   # save base pointer for safe return
    movl %esp, %ebp             # store constant stack pointer ref
  
    # Get arguments:
    flds 8(%ebp)
    flds 12(%ebp)
    flds 16(%ebp)
    fmulp
    fmulp

    # Result is on float stack, this is the return value

    pop %ebp                    # Standard, restore base pointer
    # Value is not returned using eax
    ret
