.CSEG
Send:	SetTimerTask TS_Send, 25
	ldi GREG, 48
	rcall SendByte
	ldi GREG, 49
	rcall SendByte
	ldi GREG, 50
	rcall SendByte
	ret

SendByte:	lds Tmp2, UCSR0A
	sbrs Tmp2, UDRE0	; wait for empty transmit buffer
	rjmp SendByte
	sts UDR0, GREG
	ret
