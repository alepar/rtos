.CSEG
Task_WDR:	tst WDR_RST
	brne WDR_Reset
	dec WDR_CNT_LOW
	brne WDR_End
	movi WDR_CNT_LOW, 0xff
	;schedule reset
	ldi GREG, 0x01
	rcall SendByte
	ldi GREG, 0xcc
	rcall SendByte
	; todo toggle reset
WDR_End:	SetTimerTask TS_WDR, WDR_TS_DELAY
	ret

WDR_Reset:	movi WDR_CNT_LOW, 0xff
	clr WDR_RST
	ldi GREG, 0x01
	rcall SendByte
	ldi GREG, 0xaa
	rjmp SendByte
