.CSEG
; initial task launch
Main:	rcall Send		; Отсыл байт в UART 

Loop:	rcall ProcessTaskQueue	; run scheduled tasks
	rcall Idle		; idle sleep								
	rjmp Loop		; main rtos loop
