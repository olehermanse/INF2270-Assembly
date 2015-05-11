# Workaround to avoid absolute address warning on mac

.globl    _variables
_variables:
    pushl   %ebp
    movl    %esp, %ebp
    calll   funcStart
funcStart:
    popl    %ecx
    movl    num-funcStart(%ecx), %eax       # Get value from relative address
    
    # Do something with num:
    addl    $10, num-funcStart(%ecx)        # Add 10 to value directly
    movl    num-funcStart(%ecx), %eax       # Move new value to register
    addl    $10, %eax                       # Add 10 to value in register
    movl    %eax, num-funcStart(%ecx)       # Move new value back to where it came from
    movl    num-funcStart(%ecx), %eax       # Get the same value back to register
    
    # Return:
    popl    %ebp
    retl

.data
num:
    .long    48
