.CSEG
UartRxInt:	push GREG		; save regs
	in GREG,SREG
	push GREG

	lds GREG,UDR0	; read byte
	sts UDR0,GREG

	pop GREG		; restore regs
	out SREG,GREG
	pop GREG
	reti
