.CSEG
; initial task launch
Main:	rcall Send		; uart send task 

Loop:	rcall ProcessTaskQueue	; run scheduled tasks
	rcall Idle		; idle sleep								
	rjmp Loop		; main rtos loop
 
