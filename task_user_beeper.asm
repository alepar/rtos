; beeper hanging on PC3

.CSEG

; @spoil GREG
SoundAlarm:	ldi GREG, '0'
	cp UCC1, GREG
	breq Turn_Off
Turn_On:	ldi GREG, 1			
	mov BEEPER_ENABLED, GREG	; set ENABLED to 1
	ldi GREG, BEEPER_MASK
	mov BEEPER_STATE, GREG		; set STATE
	out PORTC, BEEPER_STATE		; output STATE
	SetTimerTask TS_Beeper, BEEPER_DELAY; schedule
	ldi GREG, 1			; send confirmation
	rcall SendByte
	ldi GREG, 1
	rjmp SendByte
Turn_Off:	ldi GREG, 0			
	mov BEEPER_ENABLED, GREG	; set ENABLED to 0
	ldi GREG, 1			; send confirmation
	rcall SendByte
	ldi GREG, 0
	rjmp SendByte

Task_Beeper:tst BEEPER_ENABLED		; check ENABLED state
	breq Beeper_End		; if it is zero - stop task
	ldi GREG, BEEPER_MASK
	eor BEEPER_STATE, GREG
	out PORTC, BEEPER_STATE
	SetTimerTask TS_Beeper, BEEPER_DELAY		
Beeper_End:	ret
