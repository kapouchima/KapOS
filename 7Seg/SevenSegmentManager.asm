
_EnableSegment:

;SevenSegmentManager.c,9 :: 		void EnableSegment(char seg)
;SevenSegmentManager.c,11 :: 		switch(seg)
	GOTO        L_EnableSegment0
;SevenSegmentManager.c,13 :: 		case 0:
L_EnableSegment2:
;SevenSegmentManager.c,14 :: 		Digit1En=EnableLogic;
	BSF         PORTD+0, 0 
;SevenSegmentManager.c,16 :: 		Digit2En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,19 :: 		Digit3En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,22 :: 		Digit4En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,24 :: 		break;
	GOTO        L_EnableSegment1
;SevenSegmentManager.c,26 :: 		case 1:
L_EnableSegment3:
;SevenSegmentManager.c,27 :: 		Digit2En=EnableLogic;
	BSF         PORTD+0, 0 
;SevenSegmentManager.c,28 :: 		Digit1En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,30 :: 		Digit3En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,33 :: 		Digit4En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,35 :: 		break;
	GOTO        L_EnableSegment1
;SevenSegmentManager.c,37 :: 		case 2:
L_EnableSegment4:
;SevenSegmentManager.c,38 :: 		Digit3En=EnableLogic;
	BSF         PORTD+0, 0 
;SevenSegmentManager.c,39 :: 		Digit1En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,40 :: 		Digit2En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,42 :: 		Digit4En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,44 :: 		break;
	GOTO        L_EnableSegment1
;SevenSegmentManager.c,46 :: 		case 3:
L_EnableSegment5:
;SevenSegmentManager.c,47 :: 		Digit4En=EnableLogic;
	BSF         PORTD+0, 0 
;SevenSegmentManager.c,48 :: 		Digit1En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,49 :: 		Digit2En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,50 :: 		Digit3En=DisableLogic;
	BCF         PORTD+0, 0 
;SevenSegmentManager.c,51 :: 		break;
	GOTO        L_EnableSegment1
;SevenSegmentManager.c,53 :: 		}
L_EnableSegment0:
	MOVF        FARG_EnableSegment_seg+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_EnableSegment2
	MOVF        FARG_EnableSegment_seg+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_EnableSegment3
	MOVF        FARG_EnableSegment_seg+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_EnableSegment4
	MOVF        FARG_EnableSegment_seg+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_EnableSegment5
L_EnableSegment1:
;SevenSegmentManager.c,54 :: 		}
L_end_EnableSegment:
	RETURN      0
; end of _EnableSegment

_PlayAnimation:

;SevenSegmentManager.c,68 :: 		void PlayAnimation(char animCode)
;SevenSegmentManager.c,71 :: 		}
L_end_PlayAnimation:
	RETURN      0
; end of _PlayAnimation

_SetChar:

;SevenSegmentManager.c,87 :: 		void SetChar(char ch)
;SevenSegmentManager.c,89 :: 		char i=ch;
	MOVF        FARG_SetChar_ch+0, 0 
	MOVWF       SetChar_i_L0+0 
;SevenSegmentManager.c,91 :: 		if(i.b7)SegDp=On;
	BTFSS       SetChar_i_L0+0, 7 
	GOTO        L_SetChar6
	BSF         PORTB+0, 7 
	GOTO        L_SetChar7
L_SetChar6:
;SevenSegmentManager.c,92 :: 		else SegDp=Off;
	BCF         PORTB+0, 7 
L_SetChar7:
;SevenSegmentManager.c,94 :: 		i.b0=0;
	BCF         SetChar_i_L0+0, 0 
;SevenSegmentManager.c,96 :: 		switch(ch)
	GOTO        L_SetChar8
;SevenSegmentManager.c,98 :: 		case 0x00:
L_SetChar10:
;SevenSegmentManager.c,99 :: 		SegA=On;SegB=On;SegC=On;SegD=On;SegE=On;SegF=On;SegG=Off;break;
	BSF         PORTB+0, 0 
	BSF         PORTB+0, 1 
	BSF         PORTB+0, 2 
	BSF         PORTB+0, 3 
	BSF         PORTB+0, 4 
	BSF         PORTB+0, 5 
	BCF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,101 :: 		case 0x01:
L_SetChar11:
;SevenSegmentManager.c,102 :: 		SegA=0;SegB=On;SegC=On;SegD=Off;SegE=Off;SegF=Off;SegG=Off;break;
	BCF         PORTB+0, 0 
	BSF         PORTB+0, 1 
	BSF         PORTB+0, 2 
	BCF         PORTB+0, 3 
	BCF         PORTB+0, 4 
	BCF         PORTB+0, 5 
	BCF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,104 :: 		case 0x02:
L_SetChar12:
;SevenSegmentManager.c,105 :: 		SegA=On;SegB=On;SegC=Off;SegD=On;SegE=On;SegF=Off;SegG=On;break;
	BSF         PORTB+0, 0 
	BSF         PORTB+0, 1 
	BCF         PORTB+0, 2 
	BSF         PORTB+0, 3 
	BSF         PORTB+0, 4 
	BCF         PORTB+0, 5 
	BSF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,107 :: 		case 0x03:
L_SetChar13:
;SevenSegmentManager.c,108 :: 		SegA=On;SegB=On;SegC=On;SegD=On;SegE=Off;SegF=Off;SegG=Off;break;
	BSF         PORTB+0, 0 
	BSF         PORTB+0, 1 
	BSF         PORTB+0, 2 
	BSF         PORTB+0, 3 
	BCF         PORTB+0, 4 
	BCF         PORTB+0, 5 
	BCF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,110 :: 		case 0x04:
L_SetChar14:
;SevenSegmentManager.c,111 :: 		SegA=Off;SegB=On;SegC=On;SegD=Off;SegE=Off;SegF=On;SegG=On;break;
	BCF         PORTB+0, 0 
	BSF         PORTB+0, 1 
	BSF         PORTB+0, 2 
	BCF         PORTB+0, 3 
	BCF         PORTB+0, 4 
	BSF         PORTB+0, 5 
	BSF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,113 :: 		case 0x05:
L_SetChar15:
;SevenSegmentManager.c,114 :: 		SegA=On;SegB=Off;SegC=On;SegD=On;SegE=Off;SegF=On;SegG=On;break;
	BSF         PORTB+0, 0 
	BCF         PORTB+0, 1 
	BSF         PORTB+0, 2 
	BSF         PORTB+0, 3 
	BCF         PORTB+0, 4 
	BSF         PORTB+0, 5 
	BSF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,116 :: 		case 0x06:
L_SetChar16:
;SevenSegmentManager.c,117 :: 		SegA=On;SegB=Off;SegC=On;SegD=On;SegE=On;SegF=On;SegG=On;break;
	BSF         PORTB+0, 0 
	BCF         PORTB+0, 1 
	BSF         PORTB+0, 2 
	BSF         PORTB+0, 3 
	BSF         PORTB+0, 4 
	BSF         PORTB+0, 5 
	BSF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,119 :: 		case 0x07:
L_SetChar17:
;SevenSegmentManager.c,120 :: 		SegA=On;SegB=On;SegC=On;SegD=Off;SegE=Off;SegF=Off;SegG=Off;break;
	BSF         PORTB+0, 0 
	BSF         PORTB+0, 1 
	BSF         PORTB+0, 2 
	BCF         PORTB+0, 3 
	BCF         PORTB+0, 4 
	BCF         PORTB+0, 5 
	BCF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,122 :: 		case 0x08:
L_SetChar18:
;SevenSegmentManager.c,123 :: 		SegA=On;SegB=On;SegC=On;SegD=On;SegE=On;SegF=On;SegG=On;break;
	BSF         PORTB+0, 0 
	BSF         PORTB+0, 1 
	BSF         PORTB+0, 2 
	BSF         PORTB+0, 3 
	BSF         PORTB+0, 4 
	BSF         PORTB+0, 5 
	BSF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,125 :: 		case 0x09:
L_SetChar19:
;SevenSegmentManager.c,126 :: 		SegA=On;SegB=On;SegC=On;SegD=On;SegE=Off;SegF=On;SegG=On;break;
	BSF         PORTB+0, 0 
	BSF         PORTB+0, 1 
	BSF         PORTB+0, 2 
	BSF         PORTB+0, 3 
	BCF         PORTB+0, 4 
	BSF         PORTB+0, 5 
	BSF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,128 :: 		case '-':
L_SetChar20:
;SevenSegmentManager.c,129 :: 		SegA=Off;SegB=Off;SegC=Off;SegD=Off;SegE=Off;SegF=Off;SegG=On;break;
	BCF         PORTB+0, 0 
	BCF         PORTB+0, 1 
	BCF         PORTB+0, 2 
	BCF         PORTB+0, 3 
	BCF         PORTB+0, 4 
	BCF         PORTB+0, 5 
	BSF         PORTB+0, 6 
	GOTO        L_SetChar9
;SevenSegmentManager.c,131 :: 		case 0x0A:
L_SetChar21:
;SevenSegmentManager.c,132 :: 		PlayAnimation(1);
	MOVLW       1
	MOVWF       FARG_PlayAnimation_animCode+0 
	CALL        _PlayAnimation+0, 0
;SevenSegmentManager.c,133 :: 		}
	GOTO        L_SetChar9
L_SetChar8:
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar10
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar11
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar12
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar13
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar14
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar15
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar16
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar17
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       8
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar18
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       9
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar19
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       45
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar20
	MOVF        FARG_SetChar_ch+0, 0 
	XORLW       10
	BTFSC       STATUS+0, 2 
	GOTO        L_SetChar21
L_SetChar9:
;SevenSegmentManager.c,134 :: 		}
L_end_SetChar:
	RETURN      0
; end of _SetChar

_SevenSegmentManager_Task:

;SevenSegmentManager.c,146 :: 		void SevenSegmentManager_Task(SevenSegment *sys)
;SevenSegmentManager.c,148 :: 		EnableSegment(sys->RefreshCounter);
	MOVLW       4
	ADDWF       FARG_SevenSegmentManager_Task_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_SevenSegmentManager_Task_sys+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_EnableSegment_seg+0 
	CALL        _EnableSegment+0, 0
;SevenSegmentManager.c,149 :: 		SetChar(sys->Display[sys->RefreshCounter]);
	MOVLW       4
	ADDWF       FARG_SevenSegmentManager_Task_sys+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_SevenSegmentManager_Task_sys+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC2+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	ADDWF       FARG_SevenSegmentManager_Task_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_SevenSegmentManager_Task_sys+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_SetChar_ch+0 
	CALL        _SetChar+0, 0
;SevenSegmentManager.c,152 :: 		sys->RefreshCounter=sys->RefreshCounter+1;
	MOVLW       4
	ADDWF       FARG_SevenSegmentManager_Task_sys+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_SevenSegmentManager_Task_sys+1, 0 
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
;SevenSegmentManager.c,153 :: 		if(sys->RefreshCounter >= DIGITS)
	MOVLW       4
	ADDWF       FARG_SevenSegmentManager_Task_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_SevenSegmentManager_Task_sys+1, 0 
	MOVWF       FSR0H 
	MOVLW       4
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_SevenSegmentManager_Task22
;SevenSegmentManager.c,154 :: 		sys->RefreshCounter=0;
	MOVLW       4
	ADDWF       FARG_SevenSegmentManager_Task_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_SevenSegmentManager_Task_sys+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
L_SevenSegmentManager_Task22:
;SevenSegmentManager.c,155 :: 		}
L_end_SevenSegmentManager_Task:
	RETURN      0
; end of _SevenSegmentManager_Task

_SevenSegmentManager_AnimationEPOCH:

;SevenSegmentManager.c,168 :: 		void SevenSegmentManager_AnimationEPOCH(SevenSegment *sys)
;SevenSegmentManager.c,170 :: 		if(sys->AnimationCounter >= 255)
	MOVLW       5
	ADDWF       FARG_SevenSegmentManager_AnimationEPOCH_sys+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_SevenSegmentManager_AnimationEPOCH_sys+1, 0 
	MOVWF       FSR0H 
	MOVLW       255
	SUBWF       POSTINC0+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_SevenSegmentManager_AnimationEPOCH23
;SevenSegmentManager.c,171 :: 		sys->AnimationCounter=0;
	MOVLW       5
	ADDWF       FARG_SevenSegmentManager_AnimationEPOCH_sys+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_SevenSegmentManager_AnimationEPOCH_sys+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	GOTO        L_SevenSegmentManager_AnimationEPOCH24
L_SevenSegmentManager_AnimationEPOCH23:
;SevenSegmentManager.c,173 :: 		sys->AnimationCounter=sys->AnimationCounter+1;
	MOVLW       5
	ADDWF       FARG_SevenSegmentManager_AnimationEPOCH_sys+0, 0 
	MOVWF       R1 
	MOVLW       0
	ADDWFC      FARG_SevenSegmentManager_AnimationEPOCH_sys+1, 0 
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
L_SevenSegmentManager_AnimationEPOCH24:
;SevenSegmentManager.c,174 :: 		}
L_end_SevenSegmentManager_AnimationEPOCH:
	RETURN      0
; end of _SevenSegmentManager_AnimationEPOCH
