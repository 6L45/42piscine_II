global	ft_print_comb2

ft_print_comb2:

	push	rbp
	mov		rbp, rsp

	; first number
	mov		r8, 0x30
	mov		r9, 0x30

	; second number
	mov		r10, 0x30
	mov		r12, 0x31
	; r8 - r9 - r10 - r12
	;   [00]  -    [01]

	; write sys_call
	mov		rax, 1	   ; write
	mov		rdi, 1	   ; fd output
	mov		rdx, 1	   ; len
	sub		rsp, 8

	main_loop:

		; write loop -----------------
		mov		byte [rsp], 0x5b
		mov		rsi, rsp
		syscall

		mov		[rsp], r8
		mov		rsi, rsp
		syscall
		
		mov		[rsp], r9
		mov		rsi, rsp
		syscall

		mov		byte [rsp], 0x2d
		mov		rsi, rsp
		syscall
		
		mov		[rsp], r10
		mov		rsi, rsp
		syscall
		
		mov		[rsp], r12
		mov		rsi, rsp
		syscall

		mov		byte [rsp], 0x5d
		mov		rsi, rsp
		syscall

		mov		byte [rsp], 0xa
		mov		rsi, rsp
		syscall
		; --------------------------

		; if r12 > '9'
		; jump firstTenPlusPlus
		inc		r12;
		cmp		r12, 0x39

		; else
		jg		firstTenPlusPlus
		jmp		main_loop ; <--------- jump point main loop

		firstTenPlusPlus:
			; r10++
			inc		r10
			
			; if r10 > '9'
			; jump secondUnitPlusPlus
			cmp		r10, 0x39
			jg		secondUnitPlusPlus

			; else
			mov		r12, 0x30 ; r12 = '0'
			jmp		main_loop ; <----- jump point main loop
			
			secondUnitPlusPlus:
				; r9++
				inc		r9

				; if r9 > '9'
				; secondTenPlusPlus
				cmp		r9, 0x39
				jg		secondTenPlusPlus

				; else
				cmp		r9, 0x39
				je		endTen

				lea		r12, [r9 + 1]
				lea		r10, [r8]
				jmp		main_loop

					endTen:
						mov		r12, 0x30
						lea		r10, [r8 + 1]

						cmp		r10, 0x39
						jg		endpoint

						jmp		main_loop ; <- jump point main loop

				secondTenPlusPlus:
					; r8++
					inc		r8

					mov		r9, 0x30
					lea		r12, [r9 + 1]
					lea		r10, [r8]
					jmp		main_loop ;jump point main loop

	endpoint:
		mov		rsp, rbp
		pop		rbp
		ret

