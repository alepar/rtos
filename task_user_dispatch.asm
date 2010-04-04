.equ MIN_TS = 3
.equ MAX_TS = 5

.CSEG
Task_Dispatch:
	mov GREG, UCC0
	subi GREG, 48		; convert ASCII digit to byte	
	ret

DispatchTable:
