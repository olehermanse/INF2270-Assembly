# The very basics of assembly programming (AT&T syntax)
# Author: github.com/olehermanse

# ===INTRODUCTION:===
# This is meant as a quick reference for beginners (with a background in C).

# COMMENTS
# Hash symbol # is used for comments

# INSTRUCTIONS
# In assembly language we use instructions to program the cpu.
# Instructions take 0 to 2 operands (arguments)
# and often have a byte, word and long version (1 byte, 2 bytes, 4 bytes)
# Example: mov(bwl) src, dest  ->  movl %eax, %ebx
# The long version of mov is movl
# movl takes two long (4 byte) values as arguments
# mov copies the value from src to dest
# In this example we copied the value of the %eax register to the %ebx register

# CONSTANTS
# Constants are written with a dollar sign $: 
# $0, $'c', $0xFF, $0b10110100...

# REGISTER VALUES
# Registers are prefixed with a percentage sign %:
# %eax, %ebx, %ecx, %edx...

# MEMORY ADDRESSES
# Sometimes registers contain addresses(pointers)
# and we want to edit the data at the address, not the address itself:
# Parentheses () are used to get value at an address:
# (%eax), (%ebx), (%ecx), (%edx) ...
# We can also add an offset to the addresses:
# 1(%eax), 4(%ebp), 8(%esp), 

# REGISTERS
# Every register has a purpose, 
# you should try to follow these standards when possible:
# EAX: Accumulator ( and return value )
# EBX: Base Index ( when using arrays )
# ECX: Counter
# EDX: Misc / Extend Precision of EAX
# ESI: Source index ( Copying data )
# EDI: Destination index ( Copying data )
# ESP: Stack pointer ( Used by push and pop )
# EBP: Stack Base Frame pointer

# Caller / Callee convention:
# Callee saved, these are registers you should save before using:
# EBX EDI ESI EBP (ESP)         # Leave the stack pointer alone!
# Caller saved, you dont need to save these:
# EAX ECX EDX

# Splitting registers into words and bytes:
# You can use byte or word operations on only part of a 32 bit register:
# %ax is the 16 LSB of %eax, %al is the 8 LSB of %ax, %ah is the 8 MSB of %ax
# %bx is the 16 LSB of %ebx, %bl is the 8 LSB of %bx, %bh is the 8 MSB of %bx
# %cx is the 16 LSB of %ecx, %cl is the 8 LSB of %cx, %ch is the 8 MSB of %cx
# %dx is the 16 LSB of %edx, %dl is the 8 LSB of %dx, %dh is the 8 MSB of %dx

# ===END OF INTRODUCTION===

# EXAMPLE CODE

# This will declare asmBasics() as a global function:
# Which means we can call it from our main function in asmBasics.c
.globl asmBasics
.globl _asmBasics               # This is for Mac OS Compatibility


# Our "function" starts here:
_asmBasics:                     # This is for Mac OS Compatibility
asmBasics:
    # We (usually) cant have all our data in registers.
    # The values we are not currently working on will be stored in memory or on the stack
    # "pushl" pushes a long (4 byte) value onto the stack:
    pushl %ebp                  # Save Base Frame pointer for later
                                # Its old value is now at 4(%esp)
    movl %esp, %ebp             # Set %ebp to point to where the stack is now
    
    # Save the registers we are responsible for saving before using: (See REGISTERS)
    pushl %ebx
    pushl %edi
    pushl %esi
    
    # We can now use almost all the registers freely.
    
    # MOVING / COPYING DATA:
    # the mov instruction can copy data from one place to another:
    # mov(bwl) src, dest
    movl $0, %eax
    movl %eax, %ebx
    movl %ebx, %ecx
    movl %ecx, %edx         # All 4 registers are 0, similar to: a = b = c = d = 0 in C.
    # xor is also commonly used to clear a register:
    xorl %eax, %eax
    
    # INCREMENT: (+1)
    incl %eax               # The value in %eax is now 1 more than before
    
    # DECREMENT: (-1)
    decl %eax               # The value in %eax is now 1 less than before
    
    # ADDITION: (+)
    addb $7, %al            # Add constant 7 to the 8 LSB of EAX (and AX)
    addb $18, %ah           # Add constant 18 to the 8 MSB of AX
    # EAX: 00 | 00 | 12 | 07
    
    # SUBTRACTION: (-)
    subb $9, %ah           # Subtract 9 from the 8 MSB of AX ( bits 8-15 in EAX)
    # 18 - 9 = 9
    
    # MULTIPLICATION: (*)
    imulb %ah               # Multiplies %al with %ah and puts answer in %ax
    # 7 * 9 = 63

return:
    # Restore callee-saved registers:
    popl %esi
    popl %edi
    popl %ebx
    
    # We can set the stack pointer to what it was,
    # this isnt neccessary as long as we have pushed and popped correctly:
    movl %ebp, %esp
    
    # Always Restore base frame pointer:
    popl %ebp
    
    # Return, the return value (int) is in %eax:
    ret