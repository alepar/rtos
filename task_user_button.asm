.CSEG

ReenablePcint2:
	sti PCICR, 1<<PCIE2		; setup pin change interrupt for buttons
	ret	
