# Simple demonstration of how to find ascii value of a number from 0 to 9 in assembly
# Author: github.com/olehermanse

.globl asciiConvert
.globl _asciiConvert        # Mac OSX Compatibility

# Finds the ascii value of a number form 0 to 9
# All other inputs return -1

_asciiConvert:              # Mac OSX Compatibility
asciiConvert:
    push %ebp               # save base pointer for return
    movl %esp, %ebp         # store constant stack pointer ref
    
    # movl src, dest
    movl $'0', %eax         # Start with ascii value of '0' in eax register (return)
    
    cmpl $0, 8(%ebp)        # Compare the input argument to 0
    jl returnEarly          # Return -1 if input is less than 0

    cmpl $9, 8(%ebp)        # Compare the input argument to 9
    jg returnEarly          # Return -1 if input is over 9

    # Add the input value to the ascii value of '0' (in %eax).
    # ( 0 + '0' = 48, ... , 9 + '0' = '9' = 57 )
    addl 8(%ebp), %eax
    
    # restore ebp and return
    pop %ebp
    ret

# Return -1 on invalid inputs
returnEarly:
    movl $-1, %eax          # Set return value -1
    pop %ebp                # Restore %ebp register
    ret                     # Return
