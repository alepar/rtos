@ECHO OFF
"D:\avr\studio4\AvrAssembler2\avrasm2.exe" -S "D:\avr\work\rtos_atmega168\labels.tmp" -fI -W+ie -C V2E -o "D:\avr\work\rtos_atmega168\rtos.hex" -d "D:\avr\work\rtos_atmega168\rtos.obj" -e "D:\avr\work\rtos_atmega168\rtos.eep" -m "D:\avr\work\rtos_atmega168\rtos.map" "D:\avr\work\rtos_atmega168\main.asm"
