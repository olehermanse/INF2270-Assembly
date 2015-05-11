# Simple example of a memcpy like function in asm (AT&T)
# Author: github.com/olehermanse

# declaration:
# extern int memCopy(char* dest, char* src, int n);

# memCopy should be globally available:
.globl memCopy
.globl _memCopy             # Mac OSX Compatibility

_memCopy:                   # Mac OSX Compatibility
memCopy:
    # Standard:
    push %ebp               # save base pointer for safe return
    movl %esp, %ebp         # store constant stack pointer ref
    
    # Since the function that called memCopy might be using %edi and %esi
    # we should save their values before overwriting them ( and restore them before ret )
    # (Calle-save conventention)
    pushl %esi              # save source index register (callee-saved)
    pushl %edi              # save destination index register (callee-saved)

    # Get arguments:
    movl 16(%ebp), %ecx     # n, a count of how many bytes
    movl 12(%ebp), %esi     # src, a pointer for where to get data from
    movl 8(%ebp), %edi      # dest, a pointer for where to put data
    
    # Since there is no jump here, execution will continue down, to iteration:

# Copy 1 byte, update pointers and counter, repeat until done:
iteration:
    # Check if done:
    cmpl $0, %ecx
    jz return               # if counter == 0 Return 
    decl %ecx               # else --counter
    
    # Copy data:
    # Need to go via %eax, mov doesnt take 2 memory addresses
    movb (%esi), %al        # Get data from source (%al is the 8 LSB of %eax)
    movb %al, (%edi)        # Write data to dest
    
    # Update pointers:
    incl %esi               # Increment src pointer (address)
    incl %edi               # Increment dest pointer (address)
    jmp iteration           # repeat this routine

# restore and return
return:
    popl %edi               # Restore callee-saved value
    popl %esi               # Restore callee-saved value
    pop %ebp                # Standard, restore base pointer
    xorl %eax, %eax           # Return value, 0
    ret
