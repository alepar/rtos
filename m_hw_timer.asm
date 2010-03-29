.macro SETUP_TIMER0
        ; set OCR0A - TOP value 
        outi OCR0A, 0xf0 
        ; set OCIE0A - unmask interrupt 
        sti TIMSK0, (1<<OCIE0A) 
        ; enable CTC mode 
        outi TCCR0A,(2<<WGM00) 
        ; set prescaler (Clk/1) 
        outi TCCR0B, (1<<CS00)
.endmacro
