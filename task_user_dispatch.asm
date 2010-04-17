.equ MIN_TS = 0
.equ MAX_TS = 5

.CSEG

; dispatch routine
; @param UCC0 command to dispatch
; @param UCC1 parameter
; @spoil GREG
; @spoil Tmp2
Task_Dispatch:
	mov GREG, UCC0
	subi GREG, '0'		; convert ASCII digit to byte
	cpi GREG, MIN_TS		; check range
	brlo DispWrong
	cpi GREG, MAX_TS+1
	brsh DispWrong

	ldi ZH, high(JumpTable)		; Z = &JumpTable
	ldi ZL, low(JumpTable)
	subi GREG, MIN_TS		; shift Z to appropriate task
	clr Tmp2
	add ZL, GREG
	adc ZH, Tmp2

	ijmp			; indirect jump to matched routine
				; appropriate return will be made from it

DispWrong:	ret			; received wrong task number for dispatch
				; skip it
JumpTable:	rjmp Pong
	rjmp Firmware
	rjmp SoundAlarm
	rjmp SetLedState
	rjmp StatusReport
	rjmp WDR_Reset

;todo
; - WDR arm
; - WDR unarm
; - status to include wdr
; - improve beeper task
; - handle external reset\sound
