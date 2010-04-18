.CSEG

Main:	
	outi DDRD, LED_PORTD_MASK	; set led pins to output
	outi DDRB, LED_PORTB_MASK | BEEPER_MASK	; set beeper\led pins to output

RtosLoop:	rcall ProcessTaskQueue		; run scheduled tasks
	rcall Task_Idle		; idle sleep								
	rjmp RtosLoop		; main rtos loop
