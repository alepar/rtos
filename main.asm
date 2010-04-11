.CSEG

Main:	
	outi DDRC, MASK		; set beeper pin to output
	outi DDRD, 0b11000000
	outi DDRB, 0b00000111

RtosLoop:	rcall ProcessTaskQueue		; run scheduled tasks
	rcall Task_Idle		; idle sleep								
	rjmp RtosLoop		; main rtos loop
