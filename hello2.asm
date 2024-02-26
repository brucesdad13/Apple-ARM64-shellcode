.global _main
.align 4

_main:
	mov	X2, XZR			; initialize X2 with 0
loop:
	cmp	X2, #16        		; test if X2 > 16...
	b.cs	end_loop       		; ...if yes, end loop
	add     X2, X2, #1     		; increment X2
	mov	X0, #1			; arg[0] = 1 = STDOUT
	adr	X1, helloworld		; arg[1] = string to print
;	mov	X2, #16			; arg[2] = NOTE: strlen now set by loop
	mov	X16, #4			; Unix write system call
	svc	#0xFFFF			; call kernel to output string
	b	loop
end_loop:
	mov	X0, #0			; Use 0 return code
	mov	X16, #1			; Unix exit system call
	svc	#0xFFFF			; call kernel to end program

helloworld:	.ascii "\nHello M1-World!"
