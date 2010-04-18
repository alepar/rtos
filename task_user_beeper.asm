; beeper hanging on PC3

.CSEG

; @spoil GREG
SoundAlarm:	mov BEEPER_ENABLED, UCC1
	tst UCC1
	breq B_Report
	SetTask TS_Beeper
B_Report:	ldi GREG, 0x02		; confirm to usart
	rcall SendByte
	ldi GREG, 0x02
	rcall SendByte
	mov GREG, BEEPER_ENABLED
	rjmp SendByte

Task_Beeper:tst BEEPER_ENABLED		; Beeper enabled?
	breq Beeper_End
	tst BEEPER_STATE
	breq Beeper_On
Beeper_Off:	sti TCCR2B, 0		; switch timer off
	clr BEEPER_STATE
	rjmp Beeper_Sched
Beeper_On:	sti OCR2A, BEEPER_TOP		; switch timer on
	sti TCCR2A, (1<<COM2A0)|(2<<WGM20)
	sti TCCR2B, (5<<CS20)
	inc BEEPER_STATE
Beeper_Sched:
	SetTimerTask TS_Beeper, 0xFF	; schedule task
	ret
Beeper_End:	sti TCCR2B, 0		; turn off completely
	clr BEEPER_STATE
	ret


; CS22 	CS21	CS20	Description
; 0	0	0	No clock source (Timer/Counter stopped).
; 0	0	1	clkT2S/(No prescaling)
; 0	1	0	clkT2S/8 (From prescaler)
; 0	1	1	clkT2S/32 (From prescaler)
; 1	0	0	clkT2S/64 (From prescaler)
; 1	0	1	clkT2S/128 (From prescaler)
; 1	1	0	clkT2S/256 (From prescaler)
; 1	1	1	clkT2S/1024 (From prescaler)

; Compare Output Mode, non-PWM Mode
; COM2A1	COM2A0	Description
; 0	0	Normal port operation, OC0A disconnected.
; 0	1	Toggle OC2A on Compare Match
; 1	0	Clear OC2A on Compare Match
; 1	1	Set OC2A on Compare Match
