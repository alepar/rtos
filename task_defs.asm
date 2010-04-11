.CSEG
TaskProcs:			; task jump addresses and indexes
	.equ TS_Idle = 0
	.dw Task_Idle        

	.equ TS_Dispatch = 1
	.dw Task_Dispatch

	.equ TS_Beeper = 2
	.dw Task_Beeper

	.equ TS_Led = 3
	.dw Task_Led

	.equ TS_WDR = 4
	.dw Task_WDR
