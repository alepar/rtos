.CSEG
Pcint2Handler:
	push GREG			; save regs
	push Tmp2
	in GREG, SREG
	push GREG

	sti PCICR, 0		; mask pcint2
	SetTimerTask TS_ReenablePcint2, 255	; schedule for enabling it back

	in Tmp2, PIND
	ldi GREG, 0xff
	eor Tmp2, GREG

	ldi GREG, TS_Btn_PD3
	sbrc Tmp2, 3
	rcall SendTask

	ldi GREG, TS_Btn_PD4
	sbrc Tmp2, 4
	rcall SendTask

	ldi GREG, TS_Btn_PD5
	sbrc Tmp2, 5
	rcall SendTask

	pop GREG			; restore regs
	out SREG, GREG
	pop Tmp2
	pop GREG
	reti


