.CSEG

Main:	
	outi DDRB, LED_PORTB_MASK | BPR_PORTB_MASK	; set beeper\led pins to output
	outi DDRC, WDR_PORTC_MASK	; set wdr pin to output
	outi DDRD, LED_PORTD_MASK	; set led pins to output\btn pins to input
	
	outi PORTD, BTN_PULLUP_MSK	; pullup btn pins
	
	;pullup unused pins
	outi PORTB, ~(LED_PORTB_MASK | BPR_PORTB_MASK)
	outi PORTC, ~(WDR_PORTC_MASK)


RtosLoop:	rcall ProcessTaskQueue		; run scheduled tasks
	rcall Task_Idle		; idle sleep								
	rjmp RtosLoop		; main rtos loop
