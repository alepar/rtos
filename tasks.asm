.include "task_rtos.asm"		; rtos tasks

.include "task_user_usart.asm"		; usart transmit
.include "task_user_dispatch.asm"		; dispatch commands received from usart
.include "task_user_beeper.asm"		; beeper task
.include "task_user_led.asm"		; led task


.include "task_defs.asm"		; task definitions
