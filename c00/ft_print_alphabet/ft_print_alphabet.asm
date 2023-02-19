global	ft_print_alphabet

ft_print_alphabet:
	push	rbp
	mov		rbp, rsp

	mov		rax, 1
	mov		rdi, 1
	mov		rdx, 1

	mov		rbx, 'a'
	sub		rsp, 8

	alphabet_increase:
		mov [rsp], rbx
		mov	rsi, rsp
		syscall
		inc	rbx
		cmp	rbx, 'z'
		jle alphabet_increase
		

	mov		rsp, rbp
	pop		rbp
	ret
	
