; ��� ��������� ������������� �����
			CLEAR_RAM			; ������ ������� ���������� � ���������
	
			USART_INIT			; ������ USART
	
			INIT_RTOS			; ���������� � ������� �� - ������� � ������������� ��������

			STI	TIMSK0,0<<TOIE0 	; ��������� ���������� RTOS - ������ ��
                        OUTI    TIFR0, 1<<OCF0A
			
			INIT_LCD			; ������������� � ������ �������. ������������ ������� � ��� ������� � �����
								; lcd4.asm � lcd4_macro.inc

;������������� ������ ����� ������. � ��������� ������.
			SBI		BTA_P,BTA
			SBI		BTB_P,BTB
			SBI		BTC_P,BTC
			SBI		BTD_P,BTD
			
			CBI		BTA_D,BTA
			CBI		BTB_D,BTB
			CBI		BTC_D,BTC
			CBI		BTD_D,BTD
			

