			.include "m168Pdef.inc"	; ���������� ATMega8

                        .include "config.asm"
			.include "macro.asm"	; ��� ������� � ��� ���



;============DSEG=============================================================
.DSEG
; ������� ������������ �������
.equ TaskQueueSize = 20				; ������ ������� �����
.equ TimersPoolSize = 20			; ���������� ��������

TaskQueue:
	.byte TaskQueueSize	 		; ����� ������� ����� � SRAM
TimersPool:	
	.byte TimersPoolSize*3			; ������ ���������� � �������� (�������)


;===========CSEG==============================================================
.include "vectors.asm"		; ��� ������� ���������� �������� � ���� �����

.ORG INT_VECTORS_SIZE		; ����� ������� ����������


;=============================================================================!
; Interrupts procs ===========================================================!
;=============================================================================!
; Output Compare 2 interrupt 
; Main Timer Service - ������ �������� ���� ���� - ���������� ����������
OutComp2Int:
	TimerService				; ������ ������� RTOS 
	RETI					; ������� �� ����������

;.............................................................................

;���������� �� ���������� ����� � UART
RX_OK:
	PUSH GREG
	IN GREG,SREG			; Save Sreg
	PUSH GREG

	LDS GREG,UDR0
	STS UDR0,GREG

	POP GREG				; ��������������� ��������
	OUT SREG,GREG			;
	POP GREG
	RETI					; ������� �� ����������

;=============================================================================!
; Main code ==================================================================!
;=============================================================================!
Reset:
	INIT_STACK RAMEND								
	.include "init.asm"				; ��� ������������� ���.


; ������ ������� ���������
Background:	
	RCALL	Send				; ����� ���� � UART 
			

Main:
	rcall 	ProcessTaskQueue		; ��������� ������� ���������
	rcall 	Idle				; ������� ����
								
	RJMP 	Main				; �������� ���� ��������� ����

;=============================================================================
;Tasks
;=============================================================================
Idle:		RET		; ������� ����. �� ������������

;-----------------------------------------------------------------------------
; ������ ������� ������ ����� ��������
Send:
        SetTimerTask TS_Send, 25
        ldi GREG, 48
        rcall SendByte
        ldi GREG, 49
        rcall SendByte
        ldi GREG, 50
        rcall SendByte
        ret

SendByte:
	lds tmp2, UCSR0A
	sbrs tmp2, UDRE0			; Wait for empty transmit buffer
	rjmp SendByte
	sts UDR0, GREG
	ret

;=============================================================================
; RTOS Here
;=============================================================================
; ��� ������� ����������� ������� � �������� �����. ������� ������ ���� ����������, �� �����
; �������� ������� ������ ��

.include "kernel.asm"		; ���������� ���� ��

; ������� (������) �����.
.equ TS_Idle 	= 0
.equ TS_Send 	= 1


; � ��� �� ������ �� �����. �� ������� ����������� �������� � ������� ������� � ���������� 
; ������� � ������
TaskProcs:
.dw Idle        ; [00] 
.dw Send        ; [01] 
