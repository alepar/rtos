; beeper hanging on PC3

.def STATE = R5
.def ENABLED = R6
.equ MASK = 0b00001000
.equ DELAY = 7

.CSEG

; @spoil GREG
SoundAlarm:	ldi GREG, '0'
	cp UCC1, GREG
	breq Turn_Off
Turn_On:	ldi GREG, 1			
	mov ENABLED, GREG		; set ENABLED to 1
	outi DDRC, MASK		; set beeper pin to output
	ldi GREG, MASK
	mov STATE, GREG		; set STATE
	out PORTC, STATE		; output STATE
	SetTimerTask TS_Beeper, DELAY	; schedule
	ret
Turn_Off:	ldi GREG, 0			
	mov ENABLED, GREG		; set ENABLED to 0
	ret

Task_Beeper:tst ENABLED			; check ENABLED state
	breq Beeper_End		; if it is zero - stop task
	ldi GREG, MASK
	eor STATE, GREG
	out PORTC, STATE
	SetTimerTask TS_Beeper, DELAY		
Beeper_End:	ret
