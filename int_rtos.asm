.CSEG
.ORG INT_VECTORS_SIZE		; start right after interrupt vector

RtosInt:	TimerService	
	reti

Reset:	INIT_STACK RAMEND	; setup stack top
	CLEAR_RAM		; clear ram
	INIT_RTOS		; prepare task queues

	SETUP_USART0	; setup usart0
	SETUP_TIMER0 1000	; setup rtos timer
	sei
	rjmp Main		; jump to entry point
