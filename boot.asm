.include "m168Pdef.inc"

; macro defs here
.include "config.asm"		; config here
.include "macro.asm"		; macro proc, rtos and user

; code starts here
.include "vectors.asm"		; interrupt vector
.include "int.asm"		; interrupt procedures

.include "main.asm"		; main
.include "tasks.asm"		; tasks
.include "kernel.asm"		; kernel scheduling procedures

.include "dseg.asm"		; data segment definitions
