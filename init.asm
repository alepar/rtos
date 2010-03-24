; Тут первичная инициализация всего
			CLEAR_RAM			; Полная очистка оперативки и регистров
	
			USART_INIT			; Запуск USART
	
			INIT_RTOS			; Подготовка к запуску ОС - очистка и инициализация очередей

			OUTI	TIMSK,0<<TOIE0|1<<OCF2|0<<TOIE0		; Разрешаем прерывание RTOS - запуск ОС
			
			INIT_LCD			; Инициализация и запуск дисплея. Конфигурация дисплея и его выводов в файле
								; lcd4.asm и lcd4_macro.inc

;Инициализация портов ввода вывода. В частности кнопок.
			SBI		BTA_P,BTA
			SBI		BTB_P,BTB
			SBI		BTC_P,BTC
			SBI		BTD_P,BTD
			
			CBI		BTA_D,BTA
			CBI		BTB_D,BTB
			CBI		BTC_D,BTC
			CBI		BTD_D,BTD
			

