# Simple demonstration of how to call functions from assembly code
# Author: github.com/olehermanse

.globl callCFunc
.globl _callCFunc	# For OSX Compatibility

_callCFunc:			# For OSX Compatibility
callCFunc:
	push %ebp		# save base pointer for safe return
	movl %esp, %ebp	# store constant stack pointer ref
	
	# Get first argument from stack:
	movl 8(%ebp), %eax
	
	# Push argument on stack for c function call:
	pushl %eax

	# Call our c function from cFunc.c with argument on stack:
	call _cFunc

	# Remove argument from stack after function call:
	popl %ecx
	
	# Restore base pointer and return:
	pop %ebp

	# Return with return value in eax:
	ret
