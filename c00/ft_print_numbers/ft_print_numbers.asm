global	ft_print_numbers

ft_print_numbers:
	push 	rbp
	mov		rbp, rsp

	mov		rax, 1
	mov		rdi, 1
	mov		rdx, 1

	mov		rbx, '0'
	sub		rsp, 8

	nbrs_increment:
		mov [rsp], rbx
		mov	rsi, rsp
		syscall
		inc	rbx
		cmp	rbx, '9'
		jle	nbrs_increment


	mov		rsp, rbp
	pop		rbp
	ret

