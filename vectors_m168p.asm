.CSEG


.ORG $000       ; Reset Handler				
rjmp Reset

.ORG $002       ; IRQ0 Handler
reti

.ORG $004       ; IRQ1 Handler
reti

.ORG $006       ; PCINT0 Handler
reti

.ORG $008       ; PCINT1 Handler
reti

.ORG $00A       ; PCINT2 Handler
rjmp Pcint2Handler

.ORG $00C       ; Watchdog Timer Handler
reti

.ORG $00E       ; Timer2 Compare A Handler
reti

.ORG $010       ; Timer2 Compare B Handler
reti

.ORG $012       ; Timer2 Overflow Handler
reti

.ORG $014       ; Timer1 Capture Handler
reti

.ORG $016       ; Timer1 Compare A Handler
reti

.ORG $018       ; Timer1 Compare B Handler
reti

.ORG $01A       ; Timer1 Overflow Handler
reti

.ORG $01C       ; Timer0 Compare A Handler
rjmp RtosInt

.ORG $01E       ; Timer0 Compare B Handler
reti

.ORG $020       ; Timer0 Overflow Handler
reti

.ORG $022       ; SPI Transfer Complete Handler
reti

.ORG $024       ; USART, RX Complete Handler
RJMP UartRxInt

.ORG $026       ; USART, UDR Empty Handler
reti

.ORG $028       ; USART, TX Complete Handler
reti

.ORG $02A       ; ADC Conversion Complete Handler
reti

.ORG $02C       ; EEPROM Ready Handler
reti

.ORG $02E       ; Analog Comparator Handler
reti

.ORG $030       ; 2-wire Serial Interface Handler
reti

.ORG $032       ; Store Program Memory Ready Handler
reti
