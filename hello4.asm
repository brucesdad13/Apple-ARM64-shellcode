.global _main
.align 4

_main:
	bl	hello_function

	mov	X0, #0			; Use 0 return code
	mov	X16, #1			; Unix exit system call
	svc	#0xFFFF			; call kernel to end program

hello_function:
	mov	X8, #0x480A		; move output str to X8 and X9
	movk	X8, #0x6C65, lsl#16
	movk	X8, #0x6F6C, lsl#32
	movk	X8, #0x4D20, lsl#48
	mov	X9, #0x2D31		; second half to X9
	movk	X9, #0x6F57, lsl#16
	movk	X9, #0x6C72, lsl#32
	movk	X9, #0x2164, lsl#48
	stp	X8, X9, [SP, #-16]!	; push output string to stack
	mov	X2, XZR			; initialize strlen X2 with 0
loop:
	cmp	X2, #16        	; test if X2 > 16...
	b.cs	end_loop    ; ...if yes, end loop
	add     X2, X2, #1  ; increment X2
	mov	X0, #1			; arg[0] = 1 = STDOUT
	mov	X1, SP			; arg[1] point X1 to string
;	mov	X2, #16			; arg[2] = NOTE: strlen now set by loop
	mov	X16, #4			; Unix write system call
	svc	#0xBEEF			; call kernel to output string
	b	loop
end_loop:
	ret					; return from hello_function

;helloworld:	.ascii "\nHello M1-World!"
