.def LED_STATE = R10
.def LED_COUNTER = R11
.def LED_SWITCH = R12

.equ LED_CNT_TOP = 20
.equ LED_DELAY = 255

.CSEG
SetLedState:mov GREG, UCC1
	subi GREG, '0'
	mov LED_STATE, GREG
	tst LED_STATE
	breq Led_End
	clr LED_COUNTER
	clr LED_SWITCH
	SetTimerTask TS_Led, LED_DELAY
Led_End:	ret

Task_Led:	tst LED_STATE		; check if leds turned off
	breq TLed_Off		; if they are off, turn them off
	inc LED_COUNTER
	mov GREG, LED_COUNTER		
	cpi GREG, LED_CNT_TOP		; check if it is time to switch
	brne TLed_End
	clr LED_COUNTER		; reset counter
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
