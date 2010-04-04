.CSEG

; sends one byte to usart
; @param GREG - byte to send
; @spoil Tmp2
SendByte:	lds Tmp2, UCSR0A		
	sbrs Tmp2, UDRE0		; wait for empty transmit buffer
	rjmp SendByte
	sts UDR0, GREG
	ret

; ping reply task
; used to detect presence of watchdog on port
; @spoil GREG
Pong:	ldi GREG, 0xBA
	rcall SendByte
	ldi GREG, 0xBE
	rcall SendByte
	ret


