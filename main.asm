.CSEG

Main:	
	outi DDRC, BEEPER_MASK		; set beeper pin to output
	outi DDRD, LED_PORTD_MASK
	outi DDRB, LED_PORTB_MASK

RtosLoop:	rcall ProcessTaskQueue		; run scheduled tasks
	rcall Task_Idle		; idle sleep								
	rjmp RtosLoop		; main rtos loop
