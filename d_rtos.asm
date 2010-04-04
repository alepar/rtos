.DSEG

TaskQueue:	.byte TaskQueueSize	; Очереди задач в SRAM
TimersPool:	.byte TimersPoolSize*3	; Адреса информации о таймерах (очередь)
