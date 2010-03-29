.macro OUTI
	ldi GREG, @1
	out @0, GREG
.endmacro

.macro STI
        LDI GREG, @1
        STS @0, GREG
.endmacro

.macro INIT_STACK
	OUTI SPL, low(@0)
	OUTI SPH, high(@0)
.endmacro

