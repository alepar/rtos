.CSEG
TaskProcs:			; task jump addresses and indexes
	.equ TS_Idle = 0
	.dw Task_Idle        

	.equ TS_Dispatch = 1
	.dw Task_Dispatch

	.equ TS_Led = 2
	.dw Task_Led

	.equ TS_WDR = 3
	.dw Task_WDR
