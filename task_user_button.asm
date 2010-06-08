.CSEG

ReenablePcint2:
	sti PCICR, 1<<PCIE2		; setup pin change interrupt for buttons
	ret	

Btn_PD3:	ldi GREG, 0xa3
	rcall SendByte
	ret

Btn_PD4:	ldi GREG, 0xa4
	rcall SendByte
	ret

Btn_PD5:	ldi GREG, 0xa5
	rcall SendByte
	ret
