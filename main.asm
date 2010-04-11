.CSEG

Main:	
	outi DDRC, BEEPER_MASK		; set beeper pin to output
	outi DDRD, LED_PORTD_MASK
	outi DDRB, LED_PORTB_MASK

	rcall WDR_Reset		; set timer
	SetTimerTask TS_WDR, WDR_TS_DELAY	; launch watchdog task

RtosLoop:	rcall ProcessTaskQueue		; run scheduled tasks
	rcall Task_Idle		; idle sleep								
	rjmp RtosLoop		; main rtos loop
