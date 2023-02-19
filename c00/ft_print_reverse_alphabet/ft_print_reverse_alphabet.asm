global	ft_print_reverse_alphabet

ft_print_reverse_alphabet:
	push	rbp
	mov		rbp, rsp

	mov		rax, 1
	mov		rdi, 1
	mov		rdx, 1

	mov		rbx, 'z'
	sub		rsp, 8

	alphabet_increase:
		mov [rsp], rbx
		mov	rsi, rsp
		syscall
		dec	rbx
		cmp	rbx, 'a'
		jge alphabet_increase
		

	mov		rsp, rbp
	pop		rbp
	ret
	
