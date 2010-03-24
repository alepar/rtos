@ECHO OFF
"D:\avr\studio4\AvrAssembler2\avrasm2.exe" -S "D:\avr\work\rtos_atmega168\labels.tmp" -fI -W+ie -C V2E -o "D:\avr\work\rtos_atmega168\Demo16-RTOS.hex" -d "D:\avr\work\rtos_atmega168\Demo16-RTOS.obj" -e "D:\avr\work\rtos_atmega168\Demo16-RTOS.eep" -m "D:\avr\work\rtos_atmega168\Demo16-RTOS.map" "D:\avr\work\rtos_atmega168\Demo16-RTOS.asm"
