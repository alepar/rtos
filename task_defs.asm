.CSEG
TaskProcs:			; task jump addresses and indexes
	.equ TS_Idle = 0
	.dw Task_Idle        

	.equ TS_Send = 1
	.dw Task_Send

	.equ TS_Dispatch = 2
	.dw Task_Dispatch
