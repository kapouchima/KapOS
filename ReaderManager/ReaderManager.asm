
_ReaderManager_Init:

;ReaderManager.c,6 :: 		void ReaderManager_Init(Reader *sys)
;ReaderManager.c,8 :: 		sys->TimeOutCounter=0;
	MOVFF       FARG_ReaderManager_Init_sys+0, FSR1
	MOVFF       FARG_ReaderManager_Init_sys+1, FSR1H
	CLRF        POSTINC1+0 
;ReaderManager.c,9 :: 		sys->BufferCounter=0;
	MOVLW       1
	ADDWF       FARG_ReaderManager_Init_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_ReaderManager_Init_sys+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;ReaderManager.c,10 :: 		sys->TagExists=0;
	MOVLW       34
	ADDWF       FARG_ReaderManager_Init_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_ReaderManager_Init_sys+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;ReaderManager.c,11 :: 		}
L_end_ReaderManager_Init:
	RETURN      0
; end of _ReaderManager_Init

_ReaderManager_DataRecieved:

;ReaderManager.c,28 :: 		void ReaderManager_DataRecieved(Reader *sys, char dat)
;ReaderManager.c,30 :: 		sys->TimeOutCounter=0;
	MOVFF       FARG_ReaderManager_DataRecieved_sys+0, FSR1
	MOVFF       FARG_ReaderManager_DataRecieved_sys+1, FSR1H
	CLRF        POSTINC1+0 
;ReaderManager.c,31 :: 		sys->Buffer[sys->BufferCounter]=dat;
	MOVLW       2
	ADDWF       FARG_ReaderManager_DataRecieved_sys+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_ReaderManager_DataRecieved_sys+1, 0 
	MOVWF       R1 
	MOVLW       1
	ADDWF       FARG_ReaderManager_DataRecieved_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_ReaderManager_DataRecieved_sys+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        FARG_ReaderManager_DataRecieved_dat+0, 0 
	MOVWF       POSTINC1+0 
;ReaderManager.c,32 :: 		sys->BufferCounter=sys->BufferCounter+1;
	MOVLW       1
	ADDWF       FARG_ReaderManager_DataRecieved_sys+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_ReaderManager_DataRecieved_sys+1, 0 
	MOVWF       R2 
	MOVFF       R1, FSR0
	MOVFF       R2, FSR0H
	MOVF        POSTINC0+0, 0 
	ADDLW       1
	MOVWF       R0 
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;ReaderManager.c,33 :: 		}
L_end_ReaderManager_DataRecieved:
	RETURN      0
; end of _ReaderManager_DataRecieved

_CRCCheck:

;ReaderManager.c,47 :: 		char CRCCheck(Reader *sys)
;ReaderManager.c,49 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ReaderManager.c,50 :: 		}
L_end_CRCCheck:
	RETURN      0
; end of _CRCCheck

_ProcessPacket:

;ReaderManager.c,66 :: 		void ProcessPacket(Reader *sys)
;ReaderManager.c,70 :: 		if(CRCCheck(sys))
	MOVF        FARG_ProcessPacket_sys+0, 0 
	MOVWF       FARG_CRCCheck_sys+0 
	MOVF        FARG_ProcessPacket_sys+1, 0 
	MOVWF       FARG_CRCCheck_sys+1 
	CALL        _CRCCheck+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_ProcessPacket0
;ReaderManager.c,72 :: 		for(i=TAGINFOSTARTADDRESS;i<=TAGINFOSTOPADDRESS;i++)
	MOVLW       3
	MOVWF       ProcessPacket_i_L0+0 
L_ProcessPacket1:
	MOVF        ProcessPacket_i_L0+0, 0 
	SUBLW       14
	BTFSS       STATUS+0, 0 
	GOTO        L_ProcessPacket2
;ReaderManager.c,73 :: 		sys->TagInfo[i-TAGINFOSTARTADDRESS]=sys->Buffer[i];
	MOVLW       22
	ADDWF       FARG_ProcessPacket_sys+0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      FARG_ProcessPacket_sys+1, 0 
	MOVWF       R3 
	MOVLW       3
	SUBWF       ProcessPacket_i_L0+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	ADDWF       R2, 0 
	MOVWF       FSR1 
	MOVF        R1, 0 
	ADDWFC      R3, 0 
	MOVWF       FSR1H 
	MOVLW       2
	ADDWF       FARG_ProcessPacket_sys+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_ProcessPacket_sys+1, 0 
	MOVWF       R1 
	MOVF        ProcessPacket_i_L0+0, 0 
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;ReaderManager.c,72 :: 		for(i=TAGINFOSTARTADDRESS;i<=TAGINFOSTOPADDRESS;i++)
	INCF        ProcessPacket_i_L0+0, 1 
;ReaderManager.c,73 :: 		sys->TagInfo[i-TAGINFOSTARTADDRESS]=sys->Buffer[i];
	GOTO        L_ProcessPacket1
L_ProcessPacket2:
;ReaderManager.c,75 :: 		sys->TagExists=1;
	MOVLW       34
	ADDWF       FARG_ProcessPacket_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_ProcessPacket_sys+1, 0 
	MOVWF       FSR1H 
	MOVLW       1
	MOVWF       POSTINC1+0 
;ReaderManager.c,76 :: 		}
L_ProcessPacket0:
;ReaderManager.c,77 :: 		}
L_end_ProcessPacket:
	RETURN      0
; end of _ProcessPacket

_ReaderManager_Task:

;ReaderManager.c,91 :: 		void ReaderManager_Task(Reader *sys)
;ReaderManager.c,93 :: 		if(sys->TimeOutCounter >= TIMEOUTDELAY)
	MOVFF       FARG_ReaderManager_Task_sys+0, FSR0
	MOVFF       FARG_ReaderManager_Task_sys+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVLW       10
	SUBWF       R1, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_ReaderManager_Task4
;ReaderManager.c,94 :: 		sys->BufferCounter=0;
	MOVLW       1
	ADDWF       FARG_ReaderManager_Task_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_ReaderManager_Task_sys+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
L_ReaderManager_Task4:
;ReaderManager.c,96 :: 		if(sys->BufferCounter >= BUFFERSIZE)
	MOVLW       1
	ADDWF       FARG_ReaderManager_Task_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_ReaderManager_Task_sys+1, 0 
	MOVWF       FSR0H 
	MOVLW       20
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_ReaderManager_Task5
;ReaderManager.c,97 :: 		{ProcessPacket(sys); sys->BufferCounter=0;}
	MOVF        FARG_ReaderManager_Task_sys+0, 0 
	MOVWF       FARG_ProcessPacket_sys+0 
	MOVF        FARG_ReaderManager_Task_sys+1, 0 
	MOVWF       FARG_ProcessPacket_sys+1 
	CALL        _ProcessPacket+0, 0
	MOVLW       1
	ADDWF       FARG_ReaderManager_Task_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_ReaderManager_Task_sys+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
L_ReaderManager_Task5:
;ReaderManager.c,99 :: 		}
L_end_ReaderManager_Task:
	RETURN      0
; end of _ReaderManager_Task

_ReaderManager_TimeOutEPOCH:

;ReaderManager.c,113 :: 		void ReaderManager_TimeOutEPOCH(Reader *sys)
;ReaderManager.c,115 :: 		if(sys->TimeOutCounter <= TIMEOUTDELAY)
	MOVFF       FARG_ReaderManager_TimeOutEPOCH_sys+0, FSR0
	MOVFF       FARG_ReaderManager_TimeOutEPOCH_sys+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	SUBLW       10
	BTFSS       STATUS+0, 0 
	GOTO        L_ReaderManager_TimeOutEPOCH6
;ReaderManager.c,116 :: 		sys->TimeOutCounter=sys->TimeOutCounter+1;
	MOVFF       FARG_ReaderManager_TimeOutEPOCH_sys+0, FSR0
	MOVFF       FARG_ReaderManager_TimeOutEPOCH_sys+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	MOVFF       FARG_ReaderManager_TimeOutEPOCH_sys+0, FSR1
	MOVFF       FARG_ReaderManager_TimeOutEPOCH_sys+1, FSR1H
	MOVF        R0, 0 
	ADDLW       1
	MOVWF       POSTINC1+0 
L_ReaderManager_TimeOutEPOCH6:
;ReaderManager.c,117 :: 		}
L_end_ReaderManager_TimeOutEPOCH:
	RETURN      0
; end of _ReaderManager_TimeOutEPOCH
