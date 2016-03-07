
_UserManager_Init:

;UserManager.c,9 :: 		void UserManager_Init(User *usr)
;UserManager.c,12 :: 		usr->Loc=0;
	MOVW       R30, R2
	ADIW       R30, 32
	LDI        R27, 0
	ST         Z+, R27
	ST         Z+, R27
;UserManager.c,14 :: 		for(i=0;i<(16-UUIDLength);i++)
; i start address is: 18 (R18)
	LDI        R18, 0
	LDI        R19, 0
; i end address is: 18 (R18)
L_UserManager_Init0:
; i start address is: 18 (R18)
	LDI        R16, 6
	LDI        R17, 0
	CP         R18, R16
	CPC        R19, R17
	BRLT       L__UserManager_Init44
	JMP        L_UserManager_Init1
L__UserManager_Init44:
;UserManager.c,15 :: 		usr->Flags[0]=0;
	MOVW       R30, R2
	ADIW       R30, 10
	LDI        R27, 0
	ST         Z, R27
;UserManager.c,14 :: 		for(i=0;i<(16-UUIDLength);i++)
	MOVW       R16, R18
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R18, R16
;UserManager.c,15 :: 		usr->Flags[0]=0;
; i end address is: 18 (R18)
	JMP        L_UserManager_Init0
L_UserManager_Init1:
;UserManager.c,18 :: 		}
L_end_UserManager_Init:
	RET
; end of _UserManager_Init

_UserManager_Delete:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;UserManager.c,27 :: 		void UserManager_Delete(User *usr)
;UserManager.c,32 :: 		for(tmp=0;tmp<16;tmp++)
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
; tmp start address is: 18 (R18)
	LDI        R18, 0
; tmp end address is: 18 (R18)
L_UserManager_Delete3:
; tmp start address is: 18 (R18)
	CPI        R18, 16
	BRLO       L__UserManager_Delete46
	JMP        L_UserManager_Delete4
L__UserManager_Delete46:
;UserManager.c,33 :: 		usr->Dataset[tmp]=0xFF;
	MOVW       R16, R2
	SUBI       R16, 240
	SBCI       R17, 255
	MOV        R30, R18
	LDI        R31, 0
	ADD        R30, R16
	ADC        R31, R17
	LDI        R27, 255
	ST         Z, R27
;UserManager.c,32 :: 		for(tmp=0;tmp<16;tmp++)
	MOV        R16, R18
	SUBI       R16, 255
	MOV        R18, R16
;UserManager.c,33 :: 		usr->Dataset[tmp]=0xFF;
; tmp end address is: 18 (R18)
	JMP        L_UserManager_Delete3
L_UserManager_Delete4:
;UserManager.c,35 :: 		MemoryManager_Init(&mem);
	MOVW       R16, R28
	PUSH       R3
	PUSH       R2
	MOVW       R2, R16
	CALL       _MemoryManager_Init+0
	POP        R2
	POP        R3
;UserManager.c,36 :: 		MemoryManager_Write(&mem,usr->Loc,usr->Dataset,16);
	MOVW       R20, R2
	SUBI       R20, 240
	SBCI       R21, 255
	MOVW       R30, R2
	ADIW       R30, 32
	LD         R18, Z+
	LD         R19, Z+
	MOVW       R16, R28
	PUSH       R3
	PUSH       R2
	LDI        R27, 16
	MOV        R8, R27
	MOVW       R6, R20
	MOVW       R4, R18
	MOVW       R2, R16
	CALL       _MemoryManager_Write+0
	POP        R2
	POP        R3
;UserManager.c,37 :: 		}
L_end_UserManager_Delete:
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _UserManager_Delete

_UserManager_Load:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;UserManager.c,46 :: 		void UserManager_Load(unsigned int location, User * usr)
;UserManager.c,51 :: 		MemoryManager_Init(&mem);
	PUSH       R6
	PUSH       R7
	PUSH       R8
	MOVW       R16, R28
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	MOVW       R2, R16
	CALL       _MemoryManager_Init+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;UserManager.c,52 :: 		MemoryManager_Read(&mem,location,usr->Dataset,16);
	MOVW       R18, R4
	SUBI       R18, 240
	SBCI       R19, 255
	MOVW       R16, R28
	PUSH       R5
	PUSH       R4
	PUSH       R3
	PUSH       R2
	LDI        R27, 16
	MOV        R8, R27
	MOVW       R6, R18
	MOVW       R4, R2
	MOVW       R2, R16
	CALL       _MemoryManager_Read+0
	POP        R2
	POP        R3
	POP        R4
	POP        R5
;UserManager.c,54 :: 		for(tmp=0;tmp<UUIDLength;tmp++)
; tmp start address is: 20 (R20)
	LDI        R20, 0
; tmp end address is: 20 (R20)
L_UserManager_Load6:
; tmp start address is: 20 (R20)
	CPI        R20, 10
	BRLO       L__UserManager_Load48
	JMP        L_UserManager_Load7
L__UserManager_Load48:
;UserManager.c,55 :: 		usr->UUID[tmp]=usr->Dataset[tmp];
	MOV        R18, R20
	LDI        R19, 0
	ADD        R18, R4
	ADC        R19, R5
	MOVW       R16, R4
	SUBI       R16, 240
	SBCI       R17, 255
	MOV        R30, R20
	LDI        R31, 0
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	MOVW       R30, R18
	ST         Z, R16
;UserManager.c,54 :: 		for(tmp=0;tmp<UUIDLength;tmp++)
	MOV        R16, R20
	SUBI       R16, 255
	MOV        R20, R16
;UserManager.c,55 :: 		usr->UUID[tmp]=usr->Dataset[tmp];
; tmp end address is: 20 (R20)
	JMP        L_UserManager_Load6
L_UserManager_Load7:
;UserManager.c,57 :: 		for(tmp=0;tmp<16-UUIDLength;tmp++)
; tmp start address is: 22 (R22)
	LDI        R22, 0
; tmp end address is: 22 (R22)
L_UserManager_Load9:
; tmp start address is: 22 (R22)
	CPI        R22, 6
	BRLO       L__UserManager_Load49
	JMP        L_UserManager_Load10
L__UserManager_Load49:
;UserManager.c,58 :: 		usr->Flags[tmp]=usr->Dataset[tmp+UUIDLength];
	MOVW       R16, R4
	SUBI       R16, 246
	SBCI       R17, 255
	MOV        R20, R22
	LDI        R21, 0
	ADD        R20, R16
	ADC        R21, R17
	MOVW       R18, R4
	SUBI       R18, 240
	SBCI       R19, 255
	MOV        R16, R22
	LDI        R17, 0
	SUBI       R16, 246
	SBCI       R17, 255
	MOVW       R30, R16
	ADD        R30, R18
	ADC        R31, R19
	LD         R16, Z
	MOVW       R30, R20
	ST         Z, R16
;UserManager.c,57 :: 		for(tmp=0;tmp<16-UUIDLength;tmp++)
	MOV        R16, R22
	SUBI       R16, 255
	MOV        R22, R16
;UserManager.c,58 :: 		usr->Flags[tmp]=usr->Dataset[tmp+UUIDLength];
; tmp end address is: 22 (R22)
	JMP        L_UserManager_Load9
L_UserManager_Load10:
;UserManager.c,60 :: 		usr->Loc=location;
	MOVW       R30, R4
	ADIW       R30, 32
	ST         Z+, R2
	ST         Z+, R3
;UserManager.c,62 :: 		}
L_end_UserManager_Load:
	POP        R8
	POP        R7
	POP        R6
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _UserManager_Load

_UserManager_GetNewLoc:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;UserManager.c,72 :: 		unsigned int UserManager_GetNewLoc()
;UserManager.c,74 :: 		unsigned int i=0;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
;UserManager.c,78 :: 		MemoryManager_Init(&mem);
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	MOVW       R2, R16
	CALL       _MemoryManager_Init+0
;UserManager.c,80 :: 		for(i=16;i<MemorySize;i=i+16)
; i start address is: 22 (R22)
	LDI        R22, 16
	LDI        R23, 0
; i end address is: 22 (R22)
L_UserManager_GetNewLoc12:
; i start address is: 22 (R22)
	CPI        R23, 16
	BRNE       L__UserManager_GetNewLoc51
	CPI        R22, 0
L__UserManager_GetNewLoc51:
	BRLO       L__UserManager_GetNewLoc52
	JMP        L_UserManager_GetNewLoc13
L__UserManager_GetNewLoc52:
;UserManager.c,82 :: 		MemoryManager_Read(&mem,i+15,&tmp,1);
	MOVW       R20, R28
	MOVW       R18, R22
	SUBI       R18, 241
	SBCI       R19, 255
	MOVW       R16, R28
	SUBI       R16, 255
	SBCI       R17, 255
	PUSH       R23
	PUSH       R22
	LDI        R27, 1
	MOV        R8, R27
	MOVW       R6, R20
	MOVW       R4, R18
	MOVW       R2, R16
	CALL       _MemoryManager_Read+0
	POP        R22
	POP        R23
;UserManager.c,83 :: 		if(tmp==0xFF)
	LDD        R16, Y+0
	CPI        R16, 255
	BREQ       L__UserManager_GetNewLoc53
	JMP        L_UserManager_GetNewLoc15
L__UserManager_GetNewLoc53:
;UserManager.c,84 :: 		break;
	JMP        L_UserManager_GetNewLoc13
L_UserManager_GetNewLoc15:
;UserManager.c,80 :: 		for(i=16;i<MemorySize;i=i+16)
	MOVW       R16, R22
	SUBI       R16, 240
	SBCI       R17, 255
	MOVW       R22, R16
;UserManager.c,85 :: 		}
	JMP        L_UserManager_GetNewLoc12
L_UserManager_GetNewLoc13:
;UserManager.c,86 :: 		return i;
	MOVW       R16, R22
; i end address is: 22 (R22)
;UserManager.c,87 :: 		}
;UserManager.c,86 :: 		return i;
;UserManager.c,87 :: 		}
L_end_UserManager_GetNewLoc:
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 1
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _UserManager_GetNewLoc

_UserManager_Save:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;UserManager.c,95 :: 		void UserManager_Save(User *usr)
;UserManager.c,100 :: 		usr->Loc=UserManager_GetNewLoc();
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
	MOVW       R16, R2
	SUBI       R16, 224
	SBCI       R17, 255
	STD        Y+1, R16
	STD        Y+2, R17
	PUSH       R3
	PUSH       R2
	CALL       _UserManager_GetNewLoc+0
	POP        R2
	POP        R3
	LDD        R18, Y+1
	LDD        R19, Y+2
	MOVW       R30, R18
	ST         Z+, R16
	ST         Z+, R17
;UserManager.c,102 :: 		for(tmp=0;tmp<UUIDLength;tmp++)
; tmp start address is: 20 (R20)
	LDI        R20, 0
; tmp end address is: 20 (R20)
L_UserManager_Save16:
; tmp start address is: 20 (R20)
	CPI        R20, 10
	BRLO       L__UserManager_Save55
	JMP        L_UserManager_Save17
L__UserManager_Save55:
;UserManager.c,103 :: 		usr->Dataset[tmp]=usr->UUID[tmp];
	MOVW       R16, R2
	SUBI       R16, 240
	SBCI       R17, 255
	MOV        R18, R20
	LDI        R19, 0
	ADD        R18, R16
	ADC        R19, R17
	MOV        R30, R20
	LDI        R31, 0
	ADD        R30, R2
	ADC        R31, R3
	LD         R16, Z
	MOVW       R30, R18
	ST         Z, R16
;UserManager.c,102 :: 		for(tmp=0;tmp<UUIDLength;tmp++)
	MOV        R16, R20
	SUBI       R16, 255
	MOV        R20, R16
;UserManager.c,103 :: 		usr->Dataset[tmp]=usr->UUID[tmp];
; tmp end address is: 20 (R20)
	JMP        L_UserManager_Save16
L_UserManager_Save17:
;UserManager.c,105 :: 		for(tmp=0;tmp<16-UUIDLength;tmp++)
; tmp start address is: 20 (R20)
	LDI        R20, 0
; tmp end address is: 20 (R20)
L_UserManager_Save19:
; tmp start address is: 20 (R20)
	CPI        R20, 6
	BRLO       L__UserManager_Save56
	JMP        L_UserManager_Save20
L__UserManager_Save56:
;UserManager.c,106 :: 		usr->Dataset[tmp+UUIDLength]=usr->Flags[tmp];
	MOVW       R18, R2
	SUBI       R18, 240
	SBCI       R19, 255
	MOV        R16, R20
	LDI        R17, 0
	SUBI       R16, 246
	SBCI       R17, 255
	ADD        R18, R16
	ADC        R19, R17
	MOVW       R16, R2
	SUBI       R16, 246
	SBCI       R17, 255
	MOV        R30, R20
	LDI        R31, 0
	ADD        R30, R16
	ADC        R31, R17
	LD         R16, Z
	MOVW       R30, R18
	ST         Z, R16
;UserManager.c,105 :: 		for(tmp=0;tmp<16-UUIDLength;tmp++)
	MOV        R16, R20
	SUBI       R16, 255
	MOV        R20, R16
;UserManager.c,106 :: 		usr->Dataset[tmp+UUIDLength]=usr->Flags[tmp];
; tmp end address is: 20 (R20)
	JMP        L_UserManager_Save19
L_UserManager_Save20:
;UserManager.c,108 :: 		MemoryManager_Init(&mem);
	MOVW       R16, R28
	PUSH       R3
	PUSH       R2
	MOVW       R2, R16
	CALL       _MemoryManager_Init+0
	POP        R2
	POP        R3
;UserManager.c,109 :: 		MemoryManager_Write(&mem,usr->Loc,usr->Dataset,16);
	MOVW       R20, R2
	SUBI       R20, 240
	SBCI       R21, 255
	MOVW       R30, R2
	ADIW       R30, 32
	LD         R18, Z+
	LD         R19, Z+
	MOVW       R16, R28
	PUSH       R3
	PUSH       R2
	LDI        R27, 16
	MOV        R8, R27
	MOVW       R6, R20
	MOVW       R4, R18
	MOVW       R2, R16
	CALL       _MemoryManager_Write+0
	POP        R2
	POP        R3
;UserManager.c,110 :: 		}
L_end_UserManager_Save:
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	ADIW       R28, 2
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _UserManager_Save

_UserManager_Search:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 12
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;UserManager.c,123 :: 		unsigned int UserManager_Search(char * uuid)
;UserManager.c,125 :: 		unsigned int i=0;
	PUSH       R4
	PUSH       R5
	PUSH       R6
	PUSH       R7
	PUSH       R8
;UserManager.c,126 :: 		char tmp[UUIDLength],CMPFlag=1,j;
	LDI        R27, 1
	STD        Y+11, R27
;UserManager.c,129 :: 		MemoryManager_Init(&mem);
	MOVW       R16, R28
	SUBI       R16, 246
	SBCI       R17, 255
	PUSH       R3
	PUSH       R2
	MOVW       R2, R16
	CALL       _MemoryManager_Init+0
	POP        R2
	POP        R3
;UserManager.c,131 :: 		for(i=16;i<MemorySize;i=i+16)
; i start address is: 20 (R20)
	LDI        R20, 16
	LDI        R21, 0
; i end address is: 20 (R20)
L_UserManager_Search22:
; i start address is: 20 (R20)
	CPI        R21, 16
	BRNE       L__UserManager_Search58
	CPI        R20, 0
L__UserManager_Search58:
	BRLO       L__UserManager_Search59
	JMP        L__UserManager_Search40
L__UserManager_Search59:
;UserManager.c,133 :: 		MemoryManager_Read(&mem,i,&tmp,UUIDLength);
	MOVW       R18, R28
	MOVW       R16, R28
	SUBI       R16, 246
	SBCI       R17, 255
	PUSH       R21
	PUSH       R20
	PUSH       R3
	PUSH       R2
	LDI        R27, 10
	MOV        R8, R27
	MOVW       R6, R18
	MOVW       R4, R20
	MOVW       R2, R16
	CALL       _MemoryManager_Read+0
	POP        R2
	POP        R3
	POP        R20
	POP        R21
;UserManager.c,134 :: 		CMPFlag=1;
	LDI        R27, 1
	STD        Y+11, R27
;UserManager.c,135 :: 		for(j=0;j<UUIDLength;j++)
; j start address is: 23 (R23)
	LDI        R23, 0
; j end address is: 23 (R23)
; i end address is: 20 (R20)
	MOV        R19, R20
	MOV        R20, R21
	MOV        R18, R23
L_UserManager_Search25:
; j start address is: 18 (R18)
; i start address is: 19 (R19)
	CPI        R18, 10
	BRLO       L__UserManager_Search60
	JMP        L_UserManager_Search26
L__UserManager_Search60:
;UserManager.c,136 :: 		if(tmp[j]!=uuid[j])
	MOVW       R16, R28
	MOV        R30, R18
	LDI        R31, 0
	ADD        R30, R16
	ADC        R31, R17
	LD         R17, Z
	MOV        R30, R18
	LDI        R31, 0
	ADD        R30, R2
	ADC        R31, R3
	LD         R16, Z
	CP         R17, R16
	BRNE       L__UserManager_Search61
	JMP        L_UserManager_Search28
L__UserManager_Search61:
; j end address is: 18 (R18)
;UserManager.c,137 :: 		{CMPFlag=0;break;}
	LDI        R27, 0
	STD        Y+11, R27
	JMP        L_UserManager_Search26
L_UserManager_Search28:
;UserManager.c,135 :: 		for(j=0;j<UUIDLength;j++)
; j start address is: 18 (R18)
	MOV        R16, R18
	SUBI       R16, 255
; j end address is: 18 (R18)
; j start address is: 23 (R23)
	MOV        R23, R16
;UserManager.c,137 :: 		{CMPFlag=0;break;}
; j end address is: 23 (R23)
	MOV        R18, R23
	JMP        L_UserManager_Search25
L_UserManager_Search26:
;UserManager.c,138 :: 		if(CMPFlag==1)
	LDD        R16, Y+11
	CPI        R16, 1
	BREQ       L__UserManager_Search62
	JMP        L_UserManager_Search29
L__UserManager_Search62:
;UserManager.c,139 :: 		break;
	MOV        R18, R19
	MOV        R19, R20
	JMP        L_UserManager_Search23
L_UserManager_Search29:
;UserManager.c,131 :: 		for(i=16;i<MemorySize;i=i+16)
	MOV        R16, R19
	MOV        R17, R20
	SUBI       R16, 240
	SBCI       R17, 255
; i end address is: 19 (R19)
; i start address is: 20 (R20)
	MOVW       R20, R16
;UserManager.c,140 :: 		}
; i end address is: 20 (R20)
	JMP        L_UserManager_Search22
L__UserManager_Search40:
;UserManager.c,131 :: 		for(i=16;i<MemorySize;i=i+16)
	MOVW       R18, R20
;UserManager.c,140 :: 		}
L_UserManager_Search23:
;UserManager.c,141 :: 		if(CMPFlag==0)
; i start address is: 18 (R18)
	LDD        R16, Y+11
	CPI        R16, 0
	BREQ       L__UserManager_Search63
	JMP        L_UserManager_Search30
L__UserManager_Search63:
; i end address is: 18 (R18)
;UserManager.c,142 :: 		return 0;
	LDI        R16, 0
	LDI        R17, 0
	JMP        L_end_UserManager_Search
L_UserManager_Search30:
;UserManager.c,144 :: 		return i;
; i start address is: 18 (R18)
	MOVW       R16, R18
; i end address is: 18 (R18)
;UserManager.c,145 :: 		}
;UserManager.c,144 :: 		return i;
;UserManager.c,145 :: 		}
L_end_UserManager_Search:
	POP        R8
	POP        R7
	POP        R6
	POP        R5
	POP        R4
	ADIW       R28, 11
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _UserManager_Search

_UserManager_Equal:

;UserManager.c,162 :: 		char UserManager_Equal(User *usr1,User *usr2)
;UserManager.c,164 :: 		char res=1,i;
; res start address is: 17 (R17)
	LDI        R17, 1
;UserManager.c,166 :: 		for(i=0;i<UUIDLength;i++)
; i start address is: 16 (R16)
	LDI        R16, 0
; i end address is: 16 (R16)
; res end address is: 17 (R17)
	MOV        R18, R16
L_UserManager_Equal32:
; i start address is: 18 (R18)
; res start address is: 17 (R17)
	CPI        R18, 10
	BRLO       L__UserManager_Equal65
	JMP        L__UserManager_Equal41
L__UserManager_Equal65:
;UserManager.c,167 :: 		if(usr1->UUID[i]!=usr1->UUID[i])
;UserManager.c,168 :: 		{res=0;break;}
L_UserManager_Equal35:
; i end address is: 18 (R18)
; res end address is: 17 (R17)
;UserManager.c,166 :: 		for(i=0;i<UUIDLength;i++)
; res start address is: 17 (R17)
; i start address is: 18 (R18)
	MOV        R16, R18
	SUBI       R16, 255
	MOV        R18, R16
;UserManager.c,168 :: 		{res=0;break;}
; i end address is: 18 (R18)
; res end address is: 17 (R17)
	JMP        L_UserManager_Equal32
L__UserManager_Equal41:
;UserManager.c,166 :: 		for(i=0;i<UUIDLength;i++)
;UserManager.c,170 :: 		return res;
; res start address is: 17 (R17)
	MOV        R16, R17
; res end address is: 17 (R17)
;UserManager.c,171 :: 		}
L_end_UserManager_Equal:
	RET
; end of _UserManager_Equal

_UserManager_Compare:

;UserManager.c,182 :: 		char UserManager_Compare(User *usr,char *uuid)
;UserManager.c,184 :: 		char res=1,i;
; res start address is: 18 (R18)
	LDI        R18, 1
;UserManager.c,186 :: 		for(i=0;i<UUIDLength;i++)
; i start address is: 19 (R19)
	LDI        R19, 0
; res end address is: 18 (R18)
; i end address is: 19 (R19)
L_UserManager_Compare36:
; i start address is: 19 (R19)
; res start address is: 18 (R18)
	CPI        R19, 10
	BRLO       L__UserManager_Compare67
	JMP        L__UserManager_Compare42
L__UserManager_Compare67:
;UserManager.c,187 :: 		if(usr->UUID[i]!=uuid[i])
	MOV        R30, R19
	LDI        R31, 0
	ADD        R30, R2
	ADC        R31, R3
	LD         R17, Z
	MOV        R30, R19
	LDI        R31, 0
	ADD        R30, R4
	ADC        R31, R5
	LD         R16, Z
	CP         R17, R16
	BRNE       L__UserManager_Compare68
	JMP        L_UserManager_Compare39
L__UserManager_Compare68:
; res end address is: 18 (R18)
; i end address is: 19 (R19)
;UserManager.c,188 :: 		{res=0;break;}
; res start address is: 17 (R17)
	LDI        R17, 0
; res end address is: 17 (R17)
	JMP        L_UserManager_Compare37
L_UserManager_Compare39:
;UserManager.c,186 :: 		for(i=0;i<UUIDLength;i++)
; i start address is: 19 (R19)
; res start address is: 18 (R18)
	MOV        R16, R19
	SUBI       R16, 255
	MOV        R19, R16
;UserManager.c,188 :: 		{res=0;break;}
; res end address is: 18 (R18)
; i end address is: 19 (R19)
	JMP        L_UserManager_Compare36
L__UserManager_Compare42:
;UserManager.c,186 :: 		for(i=0;i<UUIDLength;i++)
	MOV        R17, R18
;UserManager.c,188 :: 		{res=0;break;}
L_UserManager_Compare37:
;UserManager.c,190 :: 		return res;
; res start address is: 17 (R17)
	MOV        R16, R17
; res end address is: 17 (R17)
;UserManager.c,192 :: 		}
L_end_UserManager_Compare:
	RET
; end of _UserManager_Compare

UserManager____?ag:

L_end_UserManager___?ag:
	RET
; end of UserManager____?ag
