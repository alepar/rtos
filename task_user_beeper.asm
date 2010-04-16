; beeper hanging on PC3

.CSEG

; @spoil GREG
SoundAlarm:	outi DDRB, 0b00001000
	ldi GREG, '0'
	cp UCC1, GREG
	breq Turn_Off
Turn_On:	sti OCR2A, 156
	sti TCCR2A, (1<<COM2A0)|(2<<WGM20)
	sti TCCR2B, (5<<CS20)
Turn_Off:	ret


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
