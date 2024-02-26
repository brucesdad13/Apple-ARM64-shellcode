.global _main
.align 4

_main:
	mov	X0, #1			; arg[0] = 1 = STDOUT
	adr	X1, helloworld		; arg[1] = string to print
	mov	X2, #16			; arg[2] = length of string
	mov	X16, #4			; Unix write system call
	svc	#0x80			; call kernel to output string

	mov	X0, #0			; Use 0 return code
	mov	X16, #1			; Unix exit system call
	svc	#0xFFFF			; call kernel to end program

helloworld:	.ascii "Hello M1-World!\n"
