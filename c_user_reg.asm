;==USART task
.def URX0 = R1			; buffer
.def URX1 = R2
.def URXC = R3			; buffer state

.def UCC0 = R4			; received command
.def UCC1 = R5			; received parameter

;==BEEPER task
.def STATE = R6			; current state of beeper output pin
.def ENABLED = R7			; enabled/disabled state
.equ BEEPER_MASK = 0b00001000		; port pin mask
.equ DELAY = 7			; number used for SetTimerTask (beeper freq)

;==LED task
.def LED_STATE = R8			; which leds are on
.def LED_COUNTER = R9			; second counter (task freq is too high, need to lower it)
.def LED_SWITCH = R10			; alarm led os other leds is on

.equ LED_CNT_TOP = 20			; top value for second counter
.equ LED_DELAY = 255			; number for SetTimerTask

.equ LED_PORTD_MASK = 0b11000000		; output pins
.equ LED_PORTB_MASK = 0b00000111

