.CSEG
; initial task launch
Main:	rcall Task_Send		; uart send task 

Loop:	rcall ProcessTaskQueue		; run scheduled tasks
	rcall Task_Idle		; idle sleep								
	rjmp Loop			; main rtos loop
 
