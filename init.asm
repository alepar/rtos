; ��� ��������� ������������� �����
			CLEAR_RAM			; ������ ������� ���������� � ���������
	
			USART_INIT			; ������ USART
	
			INIT_RTOS			; ���������� � ������� �� - ������� � ������������� ��������

			OUTI	TIMSK,0<<TOIE0|1<<OCF2|0<<TOIE0		; ��������� ���������� RTOS - ������ ��
			
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
			

