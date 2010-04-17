.CSEG
Task_WDR:	tst WDR_ARMED		; checking if WDR armed
	breq WDR_End
	tst WDR_RST			; checking if WDR reset triggered
	brne WDR_Reset
	dec WDR_CNT_LOW		; checking counter
	brne WDR_End
	movi WDR_CNT_LOW, 0xff		; counter compare match, resetting
	ldi GREG, 0x01		; send confirmation to usart
	rcall SendByte
	ldi GREG, 0xcc
	rcall SendByte
	; TODO toggle reset
WDR_End:	SetTimerTask TS_WDR, WDR_TS_DELAY
	ret

WDR_Reset:	movi WDR_CNT_LOW, 0xff
	clr WDR_RST
	ldi GREG, 0x01
	rcall SendByte
	ldi GREG, 0xaa
	rjmp SendByte

WDR_Arm:	tst UCC1
	breq WDR_Unarm		; send confirmation to usart
	ldi GREG, 0x01
	rcall SendByte
	ldi GREG, 0x05
	rcall SendByte
	inc WDR_ARMED		; set ARMED flag
	SetTimerTask TS_WDR, WDR_TS_DELAY	; schedule task
	ret
WDR_Unarm:	clr WDR_ARMED		; clear ARMED flag
	ret
