;==========================================================================
;Kernel Macro
;==========================================================================
		.MACRO SetTimerTask
		ldi 	GREG, @0
		ldi 	XL, Low(@1)			;
		ldi 	XH, High(@1)			; ЗАдержка в милисекундах
		rcall 	SetTimer
		.ENDM

;==========================================================================

		.MACRO SetTask
		ldi GREG, @0			; Обращение к процедуре через событийный диспетчер
		rcall SendTask				; 
		.ENDM

;==========================================================================
		.MACRO TimerService
			push 	GREG
			in 		GREG,SREG			; Save Sreg
			push 	GREG				; Сохранение регистра GREG и регистра состояния SREG

			push 	ZL	
			push 	ZH					; сохранение Регистра Z
			push 	Counter				; сохранение Регистра Counter
	
			ldi 	ZL,low(TimersPool)	; Загрузка с регистр Z адреса RAM, 
			ldi 	ZH,high(TimersPool); по которому находится информация о таймерах

			ldi 	Counter,TimersPoolSize ; максимальное количество таймеров
	
Comp1L01:	ld 		GREG,Z				; GREG = [Z] ; Получить номер события
			cpi 	GREG,$FF			; Проверить на "NOP"
			breq 	Comp1L03			; Если NOP то переход к следующей позиции

			clt							; Флаг T используется для сохранения информации об окончании счёта
			ldd 	GREG,Z+1			; 
			subi 	GREG,Low(1) 		; Уменьшение младшей части счётчика на 1
			std 	Z+1,GREG			;
			breq 	Comp1L02			; Если 0 то флаг T не устанавливаем
			set							; 

Comp1L02:	ldd 	GREG,Z+2			;
			sbci 	GREG,High(1) 		; Уменьшение старшей части счётчика на 1
			std 	Z+2,GREG			;
			brne 	Comp1L03			; Счёт не окончен
			brts 	Comp1L03			; Счёт не окончен (по T)	
	
			ld 		GREG,Z				; Получить номер события
			rcall 	SendTask			; послать в системную очередь задач
	
			ldi 	GREG,$FF			; = NOP (задача выполнена, таймер самоудаляется)
			st 		Z, GREG				; Clear Event

Comp1L03:	subi 	ZL,Low(-3)			; Skip Counter
			sbci 	ZH,High(-3)			; Z+=3 - переход к следующему таймеру
			dec 	Counter				; счетчик таймеров
			brne 	Comp1L01			; Loop	

			pop 	Counter				; восстанавливаем переменные
			pop 	ZH
			pop 	ZL

			pop 	GREG				; Восстанавливаем регистры
			out 	SREG,GREG			; 
			pop 	GREG
			.ENDM

;======================================================================================
			.MACRO	INIT_RTOS
			outi SREG, 0x00			; Инициализация SREG 

			rcall ClearTimers	; Очистить список таймеров РТОС
			rcall ClearTaskQueue	; Очистить очередь событий РТОС
	
			.ENDM
;=======================================================================================
;SRAM STS analog for Tiny
			.MACRO	LDR
			PUSH	ZL
			PUSH	ZH

			LDI		ZL,low(@1)
			LDI		ZH,High(@1)

			LD		@0,Z

			POP		ZH
			POP		ZL
			.ENDM



			.MACRO	STR
			PUSH	ZL
			PUSH	ZH

			LDI		ZL,low(@0)
			LDI		ZH,High(@0)

			ST		Z,@1

			POP		ZH
			POP		ZL
			.ENDM


;STSI
			.MACRO STSI
			LDI		GREG,@1
			STS		@0,GREG
			.ENDM
;=======================================================================================
;FLASH
			.MACRO	LDF
			PUSH	ZL
			PUSH	ZH

			LDI		ZL,low(@1*2)
			LDI		ZH,High(@1*2)

			LPM		@0,Z

			POP		ZH
			POP		ZL
			.ENDM

			.MACRO	LDPA
			LDI		ZL,low(@0*2)
			LDI		ZH,High(@0*2)
			.ENDM
;========================================================================================
;XYZ
			.MACRO	LDX
			LDI		XL,low(@0)
			LDI		XH,High(@0)
			.ENDM

			.MACRO	LDY
			LDI		YL,low(@0)
			LDI		YH,High(@0)
			.ENDM

			.MACRO	LDZ
			LDI		ZL,low(@0)
			LDI		ZH,High(@0)
			.ENDM

;========================================================================================

			.MACRO	CLEAR_RAM
RAM_Flush:	LDI		ZL,Low(SRAM_START)
			LDI		ZH,High(SRAM_START)
			CLR		R16
Flush:		ST 		Z+,R16
			CPI		ZH,High(RAMEND)
			BRNE	Flush

			CPI		ZL,Low(RAMEND)
			BRNE	Flush

			CLR		R0
			CLR		R1
			CLR		R2
			CLR		R3
			CLR		R4
			CLR		R5
			CLR		R6
			CLR		R7
			CLR		R8
			CLR		R9
			CLR		R10
			CLR		R11
			CLR		R12
			CLR		R13
			CLR		R14
			CLR		R15

			CLR		R16
			CLR		R17
			CLR		R18
			CLR		R19
			CLR		R20
			CLR		R21
			CLR		R22
			CLR		R23
			CLR		R24
			CLR		R25
			CLR		R26
			CLR		R27
			CLR		R28
			CLR		R29
			CLR		R30
			CLR		R31
			.ENDM
