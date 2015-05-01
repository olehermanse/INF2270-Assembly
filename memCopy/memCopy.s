# Simple sample for a memcpy like function in asm (AT&T)
# Author: github.com/olehermanse

.globl memCopy
.globl _memCopy	# Mac OSX Compatibility

# Simple beginner function in asm, equivalent to:
# int memCopy(int input)
# 	return input + 9000;

_memCopy:				# Mac OSX Compatibility
memCopy:
	push %ebp			# save base pointer for safe return
	movl %esp, %ebp			# store constant stack pointer ref

	
	movl 16(%ebp), %ecx		# ( movl src, dest )
	movl 12(%ebp), %esi
	movl 8(%ebp), %edi

iteration:
	cmpl $0, %ecx
	jz return
	decl %ecx
	movl (%esi), %eax
	movl %eax, (%edi)
	incl %esi
	incl %edi
	jmp iteration

return:	
	# restore and return
	pop %ebp
	movl $0, %eax # Return value
	ret
