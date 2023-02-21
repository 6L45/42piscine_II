global	ft_print_comb

ft_print_comb:
	
	; PROLOGUE -----
	push	rbp
	mov	rbp, rsp
	; --------------

	; sys_write_call
	mov		rax, 1		;sys_write()
	mov		rdi, 1		;fd
	mov		rdx, 1		;len

	; vars init
	mov		rbx, 0x30	; 0
	mov		r9, 0x31	; 1
	mov		r8, 0x32	; 2

	sub		rsp, 8

	main_loop:

		; ------------------- print values + \n

		mov		[rsp], rbx		; donne à la stack (le top de la stack) la valeur de rbx
		mov		rsi, rsp		; donne l'address du top de la stack à sys_write
		syscall
		mov		[rsp], r9
		mov		rsi, rsp		; idem mais avec r9
		syscall
		mov		[rsp], r8
		mov		rsi, rsp		; idem mais avec r8
		syscall
		mov		byte [rsp], 0xa	; < Oxa = 10 = \n
		mov		rsi, rsp		; idem mais avec \n directement passé à rsp
		syscall

		; ---------------------------------------

		inc		r8

		; if(r8 > 9)		
		cmp		r8, 0x39	
		jg		r8_limit					; jump to r8_limit

		; else ()	
		jmp main_loop						; else return main_loop

		r8_limit: ; <<---- jmp point
			inc		r9						; r9++

			; if (r9 > 8)
			cmp		r9, 0x38
			jg		r9_limit				; jump to r_9 limit

			; else ()			
			lea		r8, [r9 + 1]			; r8 = r9 + 1
			jmp main_loop					; return main_loop

			r9_limit: ; <<---- jmp point
				inc		rbx					; rbx++

				; if (rbx > 7)
				cmp		rbx, 0x37
				jg		end_loop			; jump to end_loop
				
				; else ()
				lea		r9, [rbx + 1]		; r9 = rbx + 1
				lea		r8, [r9 + 1]		; r8 = r9 + 1
				jmp main_loop
		
	end_loop: ; <<---- jmp point

	; EPILOGUE -----------
	mov		rsp, rbp
	pop		rbp
	ret
	; --------------------
