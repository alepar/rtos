.equ UsartDiv = MainClock/(16*UsartBaudRate)-1

.macro SETUP_USART0        
        STI UBRR0L,low(UsartDiv)			; setup BaudRate
        STI UBRR0H,high(UsartDiv)        
        STI UCSR0A, 0				; clear status register        
        STI UCSR0B, (1<<TXEN0)|(1<<RXEN0)|(1<<RXCIE0)	; enable TX, RX        
        STI UCSR0C, (3<<UCSZ00)			; set mode (async, 8 data, 1 stop)
.endmacro
