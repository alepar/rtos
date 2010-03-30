@ECHO OFF
"C:\bin\Atmel\AVR Tools\AvrAssembler2\avrasm2.exe" -S "c:\temp\rtos_atmega168\labels.tmp" -fI -W+ie -C V2E -o "c:\temp\rtos_atmega168\rtos.hex" -d "c:\temp\rtos_atmega168\rtos.obj" -e "c:\temp\rtos_atmega168\rtos.eep" -m "c:\temp\rtos_atmega168\rtos.map" -l "c:\temp\rtos_atmega168\rtos.lst" "c:\temp\rtos_atmega168\main.asm"
