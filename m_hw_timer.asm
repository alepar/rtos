.macro SETUP_TIMER0		
        .equ TimerTOP = MainClock/64/@0			; TOP counter value formula, @0 - Hz requested

        sts TCNT0,ZERO

;        outi OCR0A, low(TimerTOP)			; set OCR0A - TOP value 
        outi OCR0A, 0xFF
        sti TIMSK0, (1<<OCIE0A) 			; set OCIE0A - unmask interrupt 
        outi TCCR0A,(2<<WGM00) 				; enable CTC mode 
        outi TCCR0B, (5<<CS00)				; set prescaler
.endmacro


; Clock Select Bit Description (TCCR0B)

; CS02 	CS01 	CS00 	Description
; 0 	0 	0 	No clock source (Timer/Counter stopped)
; 0 	0 	1 	clkI/O/(No prescaling)
; 0 	1 	0 	clkI/O/8 (From prescaler)
; 0 	1 	1 	clkI/O/64 (From prescaler)
; 1 	0 	0 	clkI/O/256 (From prescaler)
; 1 	0 	1 	clkI/O/1024 (From prescaler)
; 1 	1 	0 	External clock source on T0 pin. Clock on falling edge.
; 1 	1 	1 	External clock source on T0 pin. Clock on rising edge.
