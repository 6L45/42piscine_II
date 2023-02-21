section .text
global ft_putchar

ft_putchar:
	push	rbp
	mov		rbp, rsp
	
	sub		rsp, 8		; allocate 8 bytes for the buffer
	
	mov		[rsp], dil	; store the character in the buffer
	
	mov		rax, 1		; sys_write system call number
	mov		rdi, 1		; stdout file descriptor
	lea		rsi, [rsp]	; pointer to the buffer
	mov		rdx, 1		; number of bytes to write
	
	syscall
	
	mov		rsp, rbp
	pop		rbp
	ret

