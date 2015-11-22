
_DoorManager_Init:

;DoorManager.c,9 :: 		void DoorManager_Init(Door *sys)
;DoorManager.c,11 :: 		sys->State=1;
	MOVLW       7
	ADDWF       FARG_DoorManager_Init_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Init_sys+1, 0 
	MOVWF       FSR1H 
	MOVLW       1
	MOVWF       POSTINC1+0 
;DoorManager.c,12 :: 		}
L_end_DoorManager_Init:
	RETURN      0
; end of _DoorManager_Init

_PushOpenSequence:

;DoorManager.c,26 :: 		void PushOpenSequence(Door *sys,char delay,char OpenT)
;DoorManager.c,29 :: 		InvalidPeriod = sys->InvalidTime/2;
	MOVLW       5
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       PushOpenSequence_InvalidPeriod_L0+0 
	RRCF        PushOpenSequence_InvalidPeriod_L0+0, 1 
	BCF         PushOpenSequence_InvalidPeriod_L0+0, 7 
;DoorManager.c,31 :: 		SignalingSystem_AddSignal(& sys->SigSys,delay,2);
	MOVLW       8
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        FARG_PushOpenSequence_delay+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,32 :: 		SignalingSystem_AddSignal(& sys->SigSys,delay+OpenT,3);
	MOVLW       8
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        FARG_PushOpenSequence_OpenT+0, 0 
	ADDWF       FARG_PushOpenSequence_delay+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CLRF        FARG_SignalingSystem_AddSignal+1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       3
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,33 :: 		SignalingSystem_AddSignal(& sys->SigSys,delay+OpenT+sys->AutoCloseTime-InvalidPeriod,5);
	MOVLW       8
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        FARG_PushOpenSequence_OpenT+0, 0 
	ADDWF       FARG_PushOpenSequence_delay+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CLRF        FARG_SignalingSystem_AddSignal+1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       4
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FSR2H 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        POSTINC2+0, 0 
	ADDWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        PushOpenSequence_InvalidPeriod_L0+0, 0 
	SUBWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVLW       0
	SUBWFB      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       5
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,34 :: 		SignalingSystem_AddSignal(& sys->SigSys,delay+OpenT+sys->AutoCloseTime+InvalidPeriod,4);
	MOVLW       8
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        FARG_PushOpenSequence_OpenT+0, 0 
	ADDWF       FARG_PushOpenSequence_delay+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CLRF        FARG_SignalingSystem_AddSignal+1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       4
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FSR2H 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        POSTINC2+0, 0 
	ADDWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        PushOpenSequence_InvalidPeriod_L0+0, 0 
	ADDWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,35 :: 		SignalingSystem_AddSignal(& sys->SigSys,delay+OpenT+sys->AutoCloseTime+sys->CloseTime-InvalidPeriod,5);
	MOVLW       8
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        FARG_PushOpenSequence_OpenT+0, 0 
	ADDWF       FARG_PushOpenSequence_delay+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CLRF        FARG_SignalingSystem_AddSignal+1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       4
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FSR2H 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        POSTINC2+0, 0 
	ADDWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       3
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FSR2H 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        POSTINC2+0, 0 
	ADDWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        PushOpenSequence_InvalidPeriod_L0+0, 0 
	SUBWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVLW       0
	SUBWFB      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       5
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,36 :: 		SignalingSystem_AddSignal(& sys->SigSys,delay+OpenT+sys->AutoCloseTime+sys->CloseTime+InvalidPeriod,1);
	MOVLW       8
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVF        FARG_PushOpenSequence_OpenT+0, 0 
	ADDWF       FARG_PushOpenSequence_delay+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CLRF        FARG_SignalingSystem_AddSignal+1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       4
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FSR2H 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        POSTINC2+0, 0 
	ADDWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       3
	ADDWF       FARG_PushOpenSequence_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_PushOpenSequence_sys+1, 0 
	MOVWF       FSR2H 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        POSTINC2+0, 0 
	ADDWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVF        PushOpenSequence_InvalidPeriod_L0+0, 0 
	ADDWF       FARG_SignalingSystem_AddSignal+0, 1 
	MOVLW       0
	ADDWFC      FARG_SignalingSystem_AddSignal+1, 1 
	MOVLW       0
	BTFSC       FARG_SignalingSystem_AddSignal+1, 7 
	MOVLW       255
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,38 :: 		}
L_end_PushOpenSequence:
	RETURN      0
; end of _PushOpenSequence

_DoorManager_Task:

;DoorManager.c,55 :: 		void DoorManager_Task(Door *sys)
;DoorManager.c,59 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,1))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task0
;DoorManager.c,60 :: 		sys->State=1;
	MOVLW       7
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR1H 
	MOVLW       1
	MOVWF       POSTINC1+0 
L_DoorManager_Task0:
;DoorManager.c,62 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,2))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task1
;DoorManager.c,63 :: 		sys->State=2;
	MOVLW       7
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR1H 
	MOVLW       2
	MOVWF       POSTINC1+0 
L_DoorManager_Task1:
;DoorManager.c,65 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,3))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       3
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task2
;DoorManager.c,66 :: 		sys->State=3;
	MOVLW       7
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR1H 
	MOVLW       3
	MOVWF       POSTINC1+0 
L_DoorManager_Task2:
;DoorManager.c,68 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,4))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task3
;DoorManager.c,69 :: 		{sys->State=4; sys->ClosingStartTime=sys->SigSys.SystemEPOCH;}
	MOVLW       7
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR1H 
	MOVLW       4
	MOVWF       POSTINC1+0 
	MOVLW       222
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR1H 
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       R1 
	MOVLW       210
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
L_DoorManager_Task3:
;DoorManager.c,71 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,5))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       5
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task4
;DoorManager.c,72 :: 		sys->State=5;
	MOVLW       7
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR1H 
	MOVLW       5
	MOVWF       POSTINC1+0 
L_DoorManager_Task4:
;DoorManager.c,76 :: 		if((sys->State == 4) && (IRin == sys->IRMode))
	MOVLW       7
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager_Task7
	MOVLW       6
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR2H 
	CLRF        R1 
	BTFSC       PORTC+0, 0 
	INCF        R1, 1 
	MOVF        R1, 0 
	XORWF       POSTINC2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager_Task7
L__DoorManager_Task29:
;DoorManager.c,78 :: 		SignalingSystem_ClearSignal(& sys->SigSys,1);
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;DoorManager.c,79 :: 		SignalingSystem_ClearSignal(& sys->SigSys,2);
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;DoorManager.c,80 :: 		SignalingSystem_ClearSignal(& sys->SigSys,3);
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       3
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;DoorManager.c,81 :: 		SignalingSystem_ClearSignal(& sys->SigSys,4);
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;DoorManager.c,82 :: 		SignalingSystem_ClearSignal(& sys->SigSys,5);
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       5
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;DoorManager.c,83 :: 		sys->State=5;
	MOVLW       7
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR1H 
	MOVLW       5
	MOVWF       POSTINC1+0 
;DoorManager.c,84 :: 		PushOpenSequence(sys,1,Lo(sys->SigSys.SystemEPOCH - sys->ClosingStartTime));
	MOVF        FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_PushOpenSequence_sys+0 
	MOVF        FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_PushOpenSequence_sys+1 
	MOVLW       1
	MOVWF       FARG_PushOpenSequence_delay+0 
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       R1 
	MOVLW       210
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVLW       222
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	SUBWF       R2, 0 
	MOVWF       FSR0 
	MOVLW       0
	SUBWFB      R3, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_PushOpenSequence_OpenT+0 
	CALL        _PushOpenSequence+0, 0
;DoorManager.c,85 :: 		}
L_DoorManager_Task7:
;DoorManager.c,89 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,10))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       10
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task8
;DoorManager.c,90 :: 		OpenRelay=1;
	BSF         PORTD+0, 0 
L_DoorManager_Task8:
;DoorManager.c,92 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,11))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       11
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task9
;DoorManager.c,93 :: 		OpenRelay=0;
	BCF         PORTD+0, 0 
L_DoorManager_Task9:
;DoorManager.c,95 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,12))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       12
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task10
;DoorManager.c,96 :: 		StopRelay=1;
	BSF         PORTD+0, 1 
L_DoorManager_Task10:
;DoorManager.c,98 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,13))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       13
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task11
;DoorManager.c,99 :: 		StopRelay=0;
	BCF         PORTD+0, 1 
L_DoorManager_Task11:
;DoorManager.c,101 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,14))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       14
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task12
;DoorManager.c,102 :: 		CloseRelay=1;
	BSF         PORTD+0, 2 
L_DoorManager_Task12:
;DoorManager.c,104 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,15))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       15
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task13
;DoorManager.c,105 :: 		CloseRelay=0;
	BCF         PORTD+0, 2 
L_DoorManager_Task13:
;DoorManager.c,110 :: 		if(SignalingSystem_CheckSignal(& sys->SigSys,50))
	MOVLW       8
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_SignalingSystem_CheckSignal+1 
	MOVLW       50
	MOVWF       FARG_SignalingSystem_CheckSignal+0 
	CALL        _SignalingSystem_CheckSignal+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task14
;DoorManager.c,111 :: 		{DoorShouldBe=0; ActionTaken=0;}
	CLRF        _DoorShouldBe+0 
	CLRF        _ActionTaken+0 
L_DoorManager_Task14:
;DoorManager.c,115 :: 		if((DoorShouldBe) && (sys->State==1) && (ActionTaken==0))
	MOVF        _DoorShouldBe+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task17
	MOVLW       7
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager_Task17
	MOVF        _ActionTaken+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager_Task17
L__DoorManager_Task28:
;DoorManager.c,116 :: 		DoorManager_Open(sys);
	MOVF        FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_DoorManager_Open+0 
	MOVF        FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_DoorManager_Open+1 
	CALL        _DoorManager_Open+0, 0
L_DoorManager_Task17:
;DoorManager.c,118 :: 		if((DoorShouldBe) && (sys->State==4) && (ActionTaken==0))
	MOVF        _DoorShouldBe+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Task20
	MOVLW       7
	ADDWF       FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager_Task20
	MOVF        _ActionTaken+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager_Task20
L__DoorManager_Task27:
;DoorManager.c,119 :: 		DoorManager_Open(sys);
	MOVF        FARG_DoorManager_Task_sys+0, 0 
	MOVWF       FARG_DoorManager_Open+0 
	MOVF        FARG_DoorManager_Task_sys+1, 0 
	MOVWF       FARG_DoorManager_Open+1 
	CALL        _DoorManager_Open+0, 0
L_DoorManager_Task20:
;DoorManager.c,121 :: 		}
L_end_DoorManager_Task:
	RETURN      0
; end of _DoorManager_Task

_DoorManager_Open:

;DoorManager.c,134 :: 		void DoorManager_Open(Door *sys)
;DoorManager.c,136 :: 		switch(sys->Type)
	MOVF        FARG_DoorManager_Open_sys+0, 0 
	MOVWF       FLOC__DoorManager_Open+0 
	MOVF        FARG_DoorManager_Open_sys+1, 0 
	MOVWF       FLOC__DoorManager_Open+1 
	GOTO        L_DoorManager_Open21
;DoorManager.c,138 :: 		case 0:
L_DoorManager_Open23:
;DoorManager.c,139 :: 		SignalingSystem_AddSignal(& sys->SigSys,1,12); //Stop Relay ON
	MOVLW       8
	ADDWF       FARG_DoorManager_Open_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Open_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       1
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       12
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,140 :: 		SignalingSystem_AddSignal(& sys->SigSys,2,13); //Stop Relay OFF
	MOVLW       8
	ADDWF       FARG_DoorManager_Open_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Open_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       2
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       13
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,141 :: 		SignalingSystem_AddSignal(& sys->SigSys,3,10); //Open Relay ON
	MOVLW       8
	ADDWF       FARG_DoorManager_Open_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Open_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       3
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       10
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,142 :: 		SignalingSystem_AddSignal(& sys->SigSys,4,11); //Open Relay OFF
	MOVLW       8
	ADDWF       FARG_DoorManager_Open_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Open_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       4
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       11
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,143 :: 		break;
	GOTO        L_DoorManager_Open22
;DoorManager.c,145 :: 		case 1:
L_DoorManager_Open24:
;DoorManager.c,146 :: 		break;
	GOTO        L_DoorManager_Open22
;DoorManager.c,147 :: 		}
L_DoorManager_Open21:
	MOVFF       FLOC__DoorManager_Open+0, FSR0
	MOVFF       FLOC__DoorManager_Open+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Open23
	MOVFF       FLOC__DoorManager_Open+0, FSR0
	MOVFF       FLOC__DoorManager_Open+1, FSR0H
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_DoorManager_Open24
L_DoorManager_Open22:
;DoorManager.c,149 :: 		if(sys->State == 1)
	MOVLW       7
	ADDWF       FARG_DoorManager_Open_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Open_sys+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_DoorManager_Open25
;DoorManager.c,150 :: 		PushOpenSequence(sys,4, sys->OpenTime);
	MOVF        FARG_DoorManager_Open_sys+0, 0 
	MOVWF       FARG_PushOpenSequence_sys+0 
	MOVF        FARG_DoorManager_Open_sys+1, 0 
	MOVWF       FARG_PushOpenSequence_sys+1 
	MOVLW       4
	MOVWF       FARG_PushOpenSequence_delay+0 
	MOVLW       2
	ADDWF       FARG_DoorManager_Open_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Open_sys+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_PushOpenSequence_OpenT+0 
	CALL        _PushOpenSequence+0, 0
	GOTO        L_DoorManager_Open26
L_DoorManager_Open25:
;DoorManager.c,152 :: 		PushOpenSequence(sys,4, Lo(sys->SigSys.SystemEPOCH - sys->ClosingStartTime));
	MOVF        FARG_DoorManager_Open_sys+0, 0 
	MOVWF       FARG_PushOpenSequence_sys+0 
	MOVF        FARG_DoorManager_Open_sys+1, 0 
	MOVWF       FARG_PushOpenSequence_sys+1 
	MOVLW       4
	MOVWF       FARG_PushOpenSequence_delay+0 
	MOVLW       8
	ADDWF       FARG_DoorManager_Open_sys+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Open_sys+1, 0 
	MOVWF       R1 
	MOVLW       210
	ADDWF       R0, 0 
	MOVWF       R2 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       R3 
	MOVLW       222
	ADDWF       FARG_DoorManager_Open_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_DoorManager_Open_sys+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	SUBWF       R2, 0 
	MOVWF       FSR0 
	MOVLW       0
	SUBWFB      R3, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_PushOpenSequence_OpenT+0 
	CALL        _PushOpenSequence+0, 0
L_DoorManager_Open26:
;DoorManager.c,154 :: 		ActionTaken=1;
	MOVLW       1
	MOVWF       _ActionTaken+0 
;DoorManager.c,156 :: 		}
L_end_DoorManager_Open:
	RETURN      0
; end of _DoorManager_Open

_DoorManager_CarEntered:

;DoorManager.c,173 :: 		void DoorManager_CarEntered(Door *sys)
;DoorManager.c,175 :: 		DoorShouldBe=1;
	MOVLW       1
	MOVWF       _DoorShouldBe+0 
;DoorManager.c,176 :: 		SignalingSystem_ClearSignal(& sys->SigSys,50);
	MOVLW       8
	ADDWF       FARG_DoorManager_CarEntered_sys+0, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_CarEntered_sys+1, 0 
	MOVWF       FARG_SignalingSystem_ClearSignal+1 
	MOVLW       50
	MOVWF       FARG_SignalingSystem_ClearSignal+0 
	CALL        _SignalingSystem_ClearSignal+0, 0
;DoorManager.c,177 :: 		SignalingSystem_AddSignal(& sys->SigSys,sys->CarPassTime,50);
	MOVLW       8
	ADDWF       FARG_DoorManager_CarEntered_sys+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_CarEntered_sys+1, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVLW       1
	ADDWF       FARG_DoorManager_CarEntered_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_DoorManager_CarEntered_sys+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       0
	MOVWF       FARG_SignalingSystem_AddSignal+1 
	MOVWF       FARG_SignalingSystem_AddSignal+2 
	MOVWF       FARG_SignalingSystem_AddSignal+3 
	MOVLW       50
	MOVWF       FARG_SignalingSystem_AddSignal+0 
	CALL        _SignalingSystem_AddSignal+0, 0
;DoorManager.c,178 :: 		}
L_end_DoorManager_CarEntered:
	RETURN      0
; end of _DoorManager_CarEntered
