.CSEG
UartRxInt:	push GREG			; save regs
	in GREG,SREG
	push GREG

	lds GREG,UDR0		; read byte
	
	tst URXC
	breq UartRx0		
	mov URX1, GREG		; save to URX1
	clr URXC			; URXC = 0
UartComplete:			; process received command
	mov UCC0, URX0
	mov UCC1, URX1
	SetTask TS_Dispatch		; schedule for dispatching
	rjmp UartEnd
UartRx0:	mov URX0, GREG		; save to URX0
	clr URXC			; URXC = 1
	inc URXC
UartEnd:	pop GREG			; restore regs
	out SREG,GREG
	pop GREG
	reti
