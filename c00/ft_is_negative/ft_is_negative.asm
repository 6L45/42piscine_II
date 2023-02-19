global	ft_is_negative

ft_is_negative:
	push	rbp
	mov		rbp, rsp

	movsx   rdi, edi   ; sign-extend 32-bit integer in edi to 64 bits in rdi
	mov		rbx, rdi

	mov		rax, 1
	mov		rdi, 1
	mov		rdx, 1

	cmp		rbx, 0
	jns		No_block
	
Yes_block:
	mov		[rsi], byte 'Y'
	jmp		End_block
No_block:
	mov		[rsi], byte 'N'
End_block:
	syscall

	mov		rsp, rbp
	pop		rbp
	ret

