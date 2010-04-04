.CSEG
TaskProcs:			; task jump addresses and indexes
	.equ TS_Idle = 0
	.dw Task_Idle        

	.equ TS_Dispatch = 1
	.dw Task_Dispatch
