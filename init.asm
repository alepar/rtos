; bootstrap
CLEAR_RAM			; ������ ������� ���������� � ���������
SETUP_USART0		; ������ USART
INIT_RTOS			; ���������� � ������� �� - ������� � ������������� ��������

sei					; ��������� ��������� ����������
SETUP_TIMER0 10000  ; set up rtos timer

