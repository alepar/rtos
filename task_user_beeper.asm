; beeper hanging on PC3

.CSEG

; @spoil GREG
SoundAlarm:	ldi GREG, '0'
	cp UCC1, GREG
	breq Turn_Off
Turn_On:	ldi GREG, 1			
	mov ENABLED, GREG		; set ENABLED to 1
	ldi GREG, BEEPER_MASK
	mov STATE, GREG		; set STATE
	out PORTC, STATE		; output STATE
	SetTimerTask TS_Beeper, DELAY	; schedule
	ldi GREG, 1			; send confirmation
	rcall SendByte
	ldi GREG, 1
	rjmp SendByte
Turn_Off:	ldi GREG, 0			
	mov ENABLED, GREG		; set ENABLED to 0
	ldi GREG, 1			; send confirmation
	rcall SendByte
	ldi GREG, 0
	rjmp SendByte

Task_Beeper:tst ENABLED			; check ENABLED state
	breq Beeper_End		; if it is zero - stop task
	ldi GREG, BEEPER_MASK
	eor STATE, GREG
	out PORTC, STATE
	SetTimerTask TS_Beeper, DELAY		
Beeper_End:	ret
