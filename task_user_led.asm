.CSEG
SetLedState:mov GREG, UCC1
	mov LED_STATE, GREG
	tst LED_STATE
	breq Led_Off
	clr LED_SWITCH
	SetTimerTask TS_Led, LED_DELAY
	ldi GREG, 0x01
	rcall SendByte
	ldi GREG, 0x01
	rjmp SendByte
Led_Off:	ldi GREG, 0x01
	rcall SendByte
	ldi GREG, 0x00
	rjmp SendByte


Task_Led:	tst LED_STATE		; check if leds turned off
	breq TLed_Off		; if they are off, turn them off
	tst LED_SWITCH
	breq LightAlarm		; light alarm led or rest?
	clr LED_SWITCH
	mov GREG, LED_STATE		; light leds
	andi GREG, 0b00001000		; PORTD lights
	lsl GREG
	lsl GREG
	lsl GREG
	lsl GREG
	in Tmp2, PORTD
	andi Tmp2, 0b00111111
	or GREG, Tmp2
	out PORTD, GREG
	mov GREG, LED_STATE		; PORTB lights
	andi GREG, 0b00000111
	in Tmp2, PORTB
	andi Tmp2, 0b11111000
	or GREG, Tmp2
	out PORTB, GREG
	rjmp TLed_End
LightAlarm:	inc LED_SWITCH
	in GREG, PORTD		;light alarm
	andi GREG, 0b00111111
	sbr GREG, 0b01000000
	out PORTD, GREG
	in GREG, PORTB
	andi GREG, 0b11111000
	out PORTB, GREG
TLed_End:	SetTimerTask TS_Led, LED_DELAY	
TLed_Ret:	ret
	
TLed_Off:	in GREG, PORTD		;light alarm
	andi GREG, 0b00111111
	out PORTD, GREG
	in GREG, PORTB
	andi GREG, 0b11111000
	out PORTB, GREG
	ret
