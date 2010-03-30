; bootstrap
CLEAR_RAM			; Полная очистка оперативки и регистров
SETUP_USART0		; Запуск USART
INIT_RTOS			; Подготовка к запуску ОС - очистка и инициализация очередей

sei					; Разрешить обработку прерываний
SETUP_TIMER0 10000  ; set up rtos timer

