# Simple template for assembly code ( AT&T syntax )
# Author: github.com/olehermanse

.globl asmtemplate
.globl _asmtemplate	# Mac OSX Compatibility

# Simple beginner function in asm, equivalent to:
# int asmtemplate(int input)
# 	return input + 9000;

_asmtemplate:				# Mac OSX Compatibility
asmtemplate:
	push %ebp				# save base pointer for safe return
	movl %esp, %ebp			# store constant stack pointer ref
	
	# Get first argument from stack:
	# Stack pointer is at (%ebp), nothing is there (yet)
	# Old %ebp is on stack, at 4(%ebp)
	# Argument is at 8(%ebp)
	movl 8(%ebp), %eax		# ( movl src, dest )
	
	# Add 9000 to the value
	addl $9000, %eax
	
	# restore and return
	pop %ebp
	ret
