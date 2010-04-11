.macro OUTI
	ldi GREG, @1
	out @0, GREG
.endmacro

.macro STI
	ldi GREG, @1
	sts @0, GREG
.endmacro

.macro MOVI
	ldi GREG, @1
	mov @0, GREG
.endmacro

.macro INIT_STACK
	OUTI SPL, low(@0)
	OUTI SPH, high(@0)
.endmacro
