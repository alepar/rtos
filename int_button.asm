.CSEG
Pcint2Handler:
	push GREG			; save regs
	push Tmp2
	in GREG,SREG
	push GREG

	sti PCICR, 0		; mask pcint2
	SetTimerTask TS_ReenablePcint2, 255	; schedule for enabling it back

	in GREG, PIND		; report
	rcall SendByte

	pop GREG			; restore regs
	out SREG,GREG
	pop Tmp2
	pop GREG
	reti


