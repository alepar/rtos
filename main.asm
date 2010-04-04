.CSEG
; initial task launch
Main:				; no background tasks

RtosLoop:	rcall ProcessTaskQueue		; run scheduled tasks
	rcall Task_Idle		; idle sleep								
	rjmp RtosLoop		; main rtos loop
