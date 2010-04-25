.CSEG

Main:	
	SETUP_USART0	; setup usart0

	outi DDRB, LED_PORTB_MASK | BPR_PORTB_MASK	; set beeper\led pins to output
	outi DDRC, WDR_PORTC_MASK	; set wdr pin to output
	outi DDRD, LED_PORTD_MASK	; set led pins to output\btn pins to input
	
	outi PORTD, BTN_PULLUP_MSK	; pullup btn pins

	
	sti PCICR, 1<<PCIE2		; setup pin change interrupt for buttons
	sti PCMSK2, (1<<PCINT19)|(1<<PCINT20)|(1<<PCINT21)

	;pullup unused pins
	outi PORTB, ~(LED_PORTB_MASK | BPR_PORTB_MASK)
	outi PORTC, ~(WDR_PORTC_MASK)


RtosLoop:	rcall ProcessTaskQueue		; run scheduled tasks
	rcall Task_Idle		; idle sleep								
	rjmp RtosLoop		; main rtos loop
