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
Pong:	ldi GREG, 0x02
	rcall SendByte
	ldi GREG, 0xBA
	rcall SendByte
	ldi GREG, 0xBE
	rjmp SendByte

; reply to firmware version request task
; used to detect if firmware is compatible with daemon
; @spoil GREG
Firmware:	ldi GREG, 0x02
	rcall SendByte
	ldi GREG, 0x01
	rcall SendByte
	ldi GREG, 0x01
	rjmp SendByte

; reply with cuurent status
; @spoil GREG
StatusReport:
	ldi GREG, 0x03
	rcall SendByte
	mov GREG, LED_STATE
	rcall SendByte
	mov GREG, BEEPER_ENABLED
	rcall SendByte
	mov GREG, WDR_ARMED
	rjmp SendByte
