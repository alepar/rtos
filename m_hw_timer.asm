.macro SETUP_TIMER0		
		.equ TimerTOP = MainClock/64/@0			; TOP counter value formula, @0 - Hz requested

		clr OSRG								; clear counter
		sts TCNT0,OSRG

		outi OCR0A, low(TimerTOP)				; set OCR0A - TOP value 
        sti TIMSK0, (1<<OCIE0A) 				; set OCIE0A - unmask interrupt 
        outi TCCR0A,(2<<WGM00) 					; enable CTC mode 
        outi TCCR0B, (3<<CS00)					; set prescaler (Clk/1) 
.endmacro
