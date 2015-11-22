
_UserManager_Init:

;UserManager.c,9 :: 		void UserManager_Init(User *usr)
;UserManager.c,11 :: 		usr->Loc=0;
	MOVLW       32
	ADDWF       FARG_UserManager_Init_usr+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_UserManager_Init_usr+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
	CLRF        POSTINC1+0 
;UserManager.c,12 :: 		usr->Flags[0]=0;
	MOVLW       14
	ADDWF       FARG_UserManager_Init_usr+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_UserManager_Init_usr+1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;UserManager.c,13 :: 		usr->Flags[1]=0;
	MOVLW       14
	ADDWF       FARG_UserManager_Init_usr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Init_usr+1, 0 
	MOVWF       R1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	CLRF        POSTINC1+0 
;UserManager.c,14 :: 		}
L_end_UserManager_Init:
	RETURN      0
; end of _UserManager_Init

_UserManager_Delete:

;UserManager.c,23 :: 		void UserManager_Delete(User *usr)
;UserManager.c,28 :: 		for(tmp=0;tmp<16;tmp++)
	CLRF        UserManager_Delete_tmp_L0+0 
L_UserManager_Delete0:
	MOVLW       16
	SUBWF       UserManager_Delete_tmp_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_UserManager_Delete1
;UserManager.c,29 :: 		usr->Dataset[tmp]=0xFF;
	MOVLW       16
	ADDWF       FARG_UserManager_Delete_usr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Delete_usr+1, 0 
	MOVWF       R1 
	MOVF        UserManager_Delete_tmp_L0+0, 0 
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       255
	MOVWF       POSTINC1+0 
;UserManager.c,28 :: 		for(tmp=0;tmp<16;tmp++)
	INCF        UserManager_Delete_tmp_L0+0, 1 
;UserManager.c,29 :: 		usr->Dataset[tmp]=0xFF;
	GOTO        L_UserManager_Delete0
L_UserManager_Delete1:
;UserManager.c,31 :: 		MemoryManager_Init(&mem);
	MOVLW       UserManager_Delete_mem_L0+0
	MOVWF       FARG_MemoryManager_Init_sys+0 
	MOVLW       hi_addr(UserManager_Delete_mem_L0+0)
	MOVWF       FARG_MemoryManager_Init_sys+1 
	CALL        _MemoryManager_Init+0, 0
;UserManager.c,32 :: 		MemoryManager_Write(&mem,usr->Loc,usr->Dataset,16);
	MOVLW       UserManager_Delete_mem_L0+0
	MOVWF       FARG_MemoryManager_Write_sys+0 
	MOVLW       hi_addr(UserManager_Delete_mem_L0+0)
	MOVWF       FARG_MemoryManager_Write_sys+1 
	MOVLW       32
	ADDWF       FARG_UserManager_Delete_usr+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Delete_usr+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MemoryManager_Write_Address+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MemoryManager_Write_Address+1 
	MOVLW       16
	ADDWF       FARG_UserManager_Delete_usr+0, 0 
	MOVWF       FARG_MemoryManager_Write_dat+0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Delete_usr+1, 0 
	MOVWF       FARG_MemoryManager_Write_dat+1 
	MOVLW       16
	MOVWF       FARG_MemoryManager_Write_len+0 
	CALL        _MemoryManager_Write+0, 0
;UserManager.c,33 :: 		}
L_end_UserManager_Delete:
	RETURN      0
; end of _UserManager_Delete

_UserManager_Load:

;UserManager.c,42 :: 		void UserManager_Load(unsigned int location, User * usr)
;UserManager.c,47 :: 		MemoryManager_Init(&mem);
	MOVLW       UserManager_Load_mem_L0+0
	MOVWF       FARG_MemoryManager_Init_sys+0 
	MOVLW       hi_addr(UserManager_Load_mem_L0+0)
	MOVWF       FARG_MemoryManager_Init_sys+1 
	CALL        _MemoryManager_Init+0, 0
;UserManager.c,48 :: 		MemoryManager_Read(&mem,location,usr->Dataset,16);
	MOVLW       UserManager_Load_mem_L0+0
	MOVWF       FARG_MemoryManager_Read_sys+0 
	MOVLW       hi_addr(UserManager_Load_mem_L0+0)
	MOVWF       FARG_MemoryManager_Read_sys+1 
	MOVF        FARG_UserManager_Load_location+0, 0 
	MOVWF       FARG_MemoryManager_Read_Address+0 
	MOVF        FARG_UserManager_Load_location+1, 0 
	MOVWF       FARG_MemoryManager_Read_Address+1 
	MOVLW       16
	ADDWF       FARG_UserManager_Load_usr+0, 0 
	MOVWF       FARG_MemoryManager_Read_dat+0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Load_usr+1, 0 
	MOVWF       FARG_MemoryManager_Read_dat+1 
	MOVLW       16
	MOVWF       FARG_MemoryManager_Read_len+0 
	CALL        _MemoryManager_Read+0, 0
;UserManager.c,50 :: 		for(tmp=0;tmp<14;tmp++)
	CLRF        UserManager_Load_tmp_L0+0 
L_UserManager_Load3:
	MOVLW       14
	SUBWF       UserManager_Load_tmp_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_UserManager_Load4
;UserManager.c,51 :: 		usr->UUID[tmp]=usr->Dataset[tmp];
	MOVF        UserManager_Load_tmp_L0+0, 0 
	ADDWF       FARG_UserManager_Load_usr+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_UserManager_Load_usr+1, 0 
	MOVWF       FSR1H 
	MOVLW       16
	ADDWF       FARG_UserManager_Load_usr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Load_usr+1, 0 
	MOVWF       R1 
	MOVF        UserManager_Load_tmp_L0+0, 0 
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;UserManager.c,50 :: 		for(tmp=0;tmp<14;tmp++)
	INCF        UserManager_Load_tmp_L0+0, 1 
;UserManager.c,51 :: 		usr->UUID[tmp]=usr->Dataset[tmp];
	GOTO        L_UserManager_Load3
L_UserManager_Load4:
;UserManager.c,52 :: 		usr->Flags[0]=usr->Dataset[14];
	MOVLW       14
	ADDWF       FARG_UserManager_Load_usr+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_UserManager_Load_usr+1, 0 
	MOVWF       FSR1H 
	MOVLW       16
	ADDWF       FARG_UserManager_Load_usr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Load_usr+1, 0 
	MOVWF       R1 
	MOVLW       14
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;UserManager.c,53 :: 		usr->Flags[1]=usr->Dataset[15];
	MOVLW       14
	ADDWF       FARG_UserManager_Load_usr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Load_usr+1, 0 
	MOVWF       R1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       16
	ADDWF       FARG_UserManager_Load_usr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Load_usr+1, 0 
	MOVWF       R1 
	MOVLW       15
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;UserManager.c,55 :: 		usr->Loc=location;
	MOVLW       32
	ADDWF       FARG_UserManager_Load_usr+0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      FARG_UserManager_Load_usr+1, 0 
	MOVWF       FSR1H 
	MOVF        FARG_UserManager_Load_location+0, 0 
	MOVWF       POSTINC1+0 
	MOVF        FARG_UserManager_Load_location+1, 0 
	MOVWF       POSTINC1+0 
;UserManager.c,57 :: 		}
L_end_UserManager_Load:
	RETURN      0
; end of _UserManager_Load

_UserManager_GetNewLoc:

;UserManager.c,67 :: 		unsigned int UserManager_GetNewLoc()
;UserManager.c,69 :: 		unsigned int i=0;
	CLRF        UserManager_GetNewLoc_i_L0+0 
	CLRF        UserManager_GetNewLoc_i_L0+1 
;UserManager.c,73 :: 		MemoryManager_Init(&mem);
	MOVLW       UserManager_GetNewLoc_mem_L0+0
	MOVWF       FARG_MemoryManager_Init_sys+0 
	MOVLW       hi_addr(UserManager_GetNewLoc_mem_L0+0)
	MOVWF       FARG_MemoryManager_Init_sys+1 
	CALL        _MemoryManager_Init+0, 0
;UserManager.c,75 :: 		for(i=16;i<65510;i=i+16)
	MOVLW       16
	MOVWF       UserManager_GetNewLoc_i_L0+0 
	MOVLW       0
	MOVWF       UserManager_GetNewLoc_i_L0+1 
L_UserManager_GetNewLoc6:
	MOVLW       255
	SUBWF       UserManager_GetNewLoc_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__UserManager_GetNewLoc35
	MOVLW       230
	SUBWF       UserManager_GetNewLoc_i_L0+0, 0 
L__UserManager_GetNewLoc35:
	BTFSC       STATUS+0, 0 
	GOTO        L_UserManager_GetNewLoc7
;UserManager.c,77 :: 		MemoryManager_Read(&mem,i+15,&tmp,1);
	MOVLW       UserManager_GetNewLoc_mem_L0+0
	MOVWF       FARG_MemoryManager_Read_sys+0 
	MOVLW       hi_addr(UserManager_GetNewLoc_mem_L0+0)
	MOVWF       FARG_MemoryManager_Read_sys+1 
	MOVLW       15
	ADDWF       UserManager_GetNewLoc_i_L0+0, 0 
	MOVWF       FARG_MemoryManager_Read_Address+0 
	MOVLW       0
	ADDWFC      UserManager_GetNewLoc_i_L0+1, 0 
	MOVWF       FARG_MemoryManager_Read_Address+1 
	MOVLW       UserManager_GetNewLoc_tmp_L0+0
	MOVWF       FARG_MemoryManager_Read_dat+0 
	MOVLW       hi_addr(UserManager_GetNewLoc_tmp_L0+0)
	MOVWF       FARG_MemoryManager_Read_dat+1 
	MOVLW       1
	MOVWF       FARG_MemoryManager_Read_len+0 
	CALL        _MemoryManager_Read+0, 0
;UserManager.c,78 :: 		if(tmp==0xFF)
	MOVF        UserManager_GetNewLoc_tmp_L0+0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_UserManager_GetNewLoc9
;UserManager.c,79 :: 		break;
	GOTO        L_UserManager_GetNewLoc7
L_UserManager_GetNewLoc9:
;UserManager.c,75 :: 		for(i=16;i<65510;i=i+16)
	MOVLW       16
	ADDWF       UserManager_GetNewLoc_i_L0+0, 1 
	MOVLW       0
	ADDWFC      UserManager_GetNewLoc_i_L0+1, 1 
;UserManager.c,80 :: 		}
	GOTO        L_UserManager_GetNewLoc6
L_UserManager_GetNewLoc7:
;UserManager.c,81 :: 		return i;
	MOVF        UserManager_GetNewLoc_i_L0+0, 0 
	MOVWF       R0 
	MOVF        UserManager_GetNewLoc_i_L0+1, 0 
	MOVWF       R1 
;UserManager.c,82 :: 		}
L_end_UserManager_GetNewLoc:
	RETURN      0
; end of _UserManager_GetNewLoc

_UserManager_Save:

;UserManager.c,90 :: 		void UserManager_Save(User *usr)
;UserManager.c,95 :: 		usr->Loc=UserManager_GetNewLoc();
	MOVLW       32
	ADDWF       FARG_UserManager_Save_usr+0, 0 
	MOVWF       FLOC__UserManager_Save+0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Save_usr+1, 0 
	MOVWF       FLOC__UserManager_Save+1 
	CALL        _UserManager_GetNewLoc+0, 0
	MOVFF       FLOC__UserManager_Save+0, FSR1
	MOVFF       FLOC__UserManager_Save+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVF        R1, 0 
	MOVWF       POSTINC1+0 
;UserManager.c,97 :: 		for(tmp=0;tmp<14;tmp++)
	CLRF        UserManager_Save_tmp_L0+0 
L_UserManager_Save10:
	MOVLW       14
	SUBWF       UserManager_Save_tmp_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_UserManager_Save11
;UserManager.c,98 :: 		usr->Dataset[tmp]=usr->UUID[tmp];
	MOVLW       16
	ADDWF       FARG_UserManager_Save_usr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Save_usr+1, 0 
	MOVWF       R1 
	MOVF        UserManager_Save_tmp_L0+0, 0 
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVF        UserManager_Save_tmp_L0+0, 0 
	ADDWF       FARG_UserManager_Save_usr+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Save_usr+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;UserManager.c,97 :: 		for(tmp=0;tmp<14;tmp++)
	INCF        UserManager_Save_tmp_L0+0, 1 
;UserManager.c,98 :: 		usr->Dataset[tmp]=usr->UUID[tmp];
	GOTO        L_UserManager_Save10
L_UserManager_Save11:
;UserManager.c,99 :: 		usr->Dataset[14]=usr->Flags[0];
	MOVLW       16
	ADDWF       FARG_UserManager_Save_usr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Save_usr+1, 0 
	MOVWF       R1 
	MOVLW       14
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       14
	ADDWF       FARG_UserManager_Save_usr+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Save_usr+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;UserManager.c,100 :: 		usr->Dataset[15]=usr->Flags[1];
	MOVLW       16
	ADDWF       FARG_UserManager_Save_usr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Save_usr+1, 0 
	MOVWF       R1 
	MOVLW       15
	ADDWF       R0, 0 
	MOVWF       FSR1 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR1H 
	MOVLW       14
	ADDWF       FARG_UserManager_Save_usr+0, 0 
	MOVWF       R0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Save_usr+1, 0 
	MOVWF       R1 
	MOVLW       1
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;UserManager.c,102 :: 		MemoryManager_Init(&mem);
	MOVLW       UserManager_Save_mem_L0+0
	MOVWF       FARG_MemoryManager_Init_sys+0 
	MOVLW       hi_addr(UserManager_Save_mem_L0+0)
	MOVWF       FARG_MemoryManager_Init_sys+1 
	CALL        _MemoryManager_Init+0, 0
;UserManager.c,103 :: 		MemoryManager_Write(&mem,usr->Loc,usr->Dataset,16);
	MOVLW       UserManager_Save_mem_L0+0
	MOVWF       FARG_MemoryManager_Write_sys+0 
	MOVLW       hi_addr(UserManager_Save_mem_L0+0)
	MOVWF       FARG_MemoryManager_Write_sys+1 
	MOVLW       32
	ADDWF       FARG_UserManager_Save_usr+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Save_usr+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MemoryManager_Write_Address+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_MemoryManager_Write_Address+1 
	MOVLW       16
	ADDWF       FARG_UserManager_Save_usr+0, 0 
	MOVWF       FARG_MemoryManager_Write_dat+0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Save_usr+1, 0 
	MOVWF       FARG_MemoryManager_Write_dat+1 
	MOVLW       16
	MOVWF       FARG_MemoryManager_Write_len+0 
	CALL        _MemoryManager_Write+0, 0
;UserManager.c,104 :: 		}
L_end_UserManager_Save:
	RETURN      0
; end of _UserManager_Save

_UserManager_Search:

;UserManager.c,117 :: 		unsigned int UserManager_Search(char * uuid)
;UserManager.c,119 :: 		unsigned int i=0;
	CLRF        UserManager_Search_i_L0+0 
	CLRF        UserManager_Search_i_L0+1 
	MOVLW       1
	MOVWF       UserManager_Search_CMPFlag_L0+0 
;UserManager.c,123 :: 		MemoryManager_Init(&mem);
	MOVLW       UserManager_Search_mem_L0+0
	MOVWF       FARG_MemoryManager_Init_sys+0 
	MOVLW       hi_addr(UserManager_Search_mem_L0+0)
	MOVWF       FARG_MemoryManager_Init_sys+1 
	CALL        _MemoryManager_Init+0, 0
;UserManager.c,125 :: 		for(i=16;i<65510;i=i+16)
	MOVLW       16
	MOVWF       UserManager_Search_i_L0+0 
	MOVLW       0
	MOVWF       UserManager_Search_i_L0+1 
L_UserManager_Search13:
	MOVLW       255
	SUBWF       UserManager_Search_i_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__UserManager_Search38
	MOVLW       230
	SUBWF       UserManager_Search_i_L0+0, 0 
L__UserManager_Search38:
	BTFSC       STATUS+0, 0 
	GOTO        L_UserManager_Search14
;UserManager.c,127 :: 		MemoryManager_Read(&mem,i,&tmp,14);
	MOVLW       UserManager_Search_mem_L0+0
	MOVWF       FARG_MemoryManager_Read_sys+0 
	MOVLW       hi_addr(UserManager_Search_mem_L0+0)
	MOVWF       FARG_MemoryManager_Read_sys+1 
	MOVF        UserManager_Search_i_L0+0, 0 
	MOVWF       FARG_MemoryManager_Read_Address+0 
	MOVF        UserManager_Search_i_L0+1, 0 
	MOVWF       FARG_MemoryManager_Read_Address+1 
	MOVLW       UserManager_Search_tmp_L0+0
	MOVWF       FARG_MemoryManager_Read_dat+0 
	MOVLW       hi_addr(UserManager_Search_tmp_L0+0)
	MOVWF       FARG_MemoryManager_Read_dat+1 
	MOVLW       14
	MOVWF       FARG_MemoryManager_Read_len+0 
	CALL        _MemoryManager_Read+0, 0
;UserManager.c,128 :: 		CMPFlag=1;
	MOVLW       1
	MOVWF       UserManager_Search_CMPFlag_L0+0 
;UserManager.c,129 :: 		for(j=0;j<14;j++)
	CLRF        UserManager_Search_j_L0+0 
L_UserManager_Search16:
	MOVLW       14
	SUBWF       UserManager_Search_j_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_UserManager_Search17
;UserManager.c,130 :: 		if(tmp[j]!=uuid[j])
	MOVLW       UserManager_Search_tmp_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(UserManager_Search_tmp_L0+0)
	MOVWF       FSR0H 
	MOVF        UserManager_Search_j_L0+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        UserManager_Search_j_L0+0, 0 
	ADDWF       FARG_UserManager_Search_uuid+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_UserManager_Search_uuid+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UserManager_Search19
;UserManager.c,131 :: 		{CMPFlag=0;break;}
	CLRF        UserManager_Search_CMPFlag_L0+0 
	GOTO        L_UserManager_Search17
L_UserManager_Search19:
;UserManager.c,129 :: 		for(j=0;j<14;j++)
	INCF        UserManager_Search_j_L0+0, 1 
;UserManager.c,131 :: 		{CMPFlag=0;break;}
	GOTO        L_UserManager_Search16
L_UserManager_Search17:
;UserManager.c,132 :: 		if(CMPFlag==1)
	MOVF        UserManager_Search_CMPFlag_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_UserManager_Search20
;UserManager.c,133 :: 		break;
	GOTO        L_UserManager_Search14
L_UserManager_Search20:
;UserManager.c,125 :: 		for(i=16;i<65510;i=i+16)
	MOVLW       16
	ADDWF       UserManager_Search_i_L0+0, 1 
	MOVLW       0
	ADDWFC      UserManager_Search_i_L0+1, 1 
;UserManager.c,134 :: 		}
	GOTO        L_UserManager_Search13
L_UserManager_Search14:
;UserManager.c,135 :: 		if(CMPFlag==0)
	MOVF        UserManager_Search_CMPFlag_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_UserManager_Search21
;UserManager.c,136 :: 		return 0;
	CLRF        R0 
	CLRF        R1 
	GOTO        L_end_UserManager_Search
L_UserManager_Search21:
;UserManager.c,138 :: 		return i;
	MOVF        UserManager_Search_i_L0+0, 0 
	MOVWF       R0 
	MOVF        UserManager_Search_i_L0+1, 0 
	MOVWF       R1 
;UserManager.c,139 :: 		}
L_end_UserManager_Search:
	RETURN      0
; end of _UserManager_Search

_UserManager_Equal:

;UserManager.c,156 :: 		char UserManager_Equal(User *usr1,User *usr2)
;UserManager.c,158 :: 		char res=1,i;
	MOVLW       1
	MOVWF       UserManager_Equal_res_L0+0 
;UserManager.c,160 :: 		for(i=0;i<14;i++)
	CLRF        R1 
L_UserManager_Equal23:
	MOVLW       14
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_UserManager_Equal24
;UserManager.c,162 :: 		{res=0;break;}
L_UserManager_Equal26:
;UserManager.c,160 :: 		for(i=0;i<14;i++)
	INCF        R1, 1 
;UserManager.c,162 :: 		{res=0;break;}
	GOTO        L_UserManager_Equal23
L_UserManager_Equal24:
;UserManager.c,164 :: 		return res;
	MOVF        UserManager_Equal_res_L0+0, 0 
	MOVWF       R0 
;UserManager.c,165 :: 		}
L_end_UserManager_Equal:
	RETURN      0
; end of _UserManager_Equal

_UserManager_Compare:

;UserManager.c,176 :: 		char UserManager_Compare(User *usr,char *uuid)
;UserManager.c,178 :: 		char res=1,i;
	MOVLW       1
	MOVWF       UserManager_Compare_res_L0+0 
;UserManager.c,180 :: 		for(i=0;i<14;i++)
	CLRF        R1 
L_UserManager_Compare27:
	MOVLW       14
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_UserManager_Compare28
;UserManager.c,181 :: 		if(usr->UUID[i]!=uuid[i])
	MOVF        R1, 0 
	ADDWF       FARG_UserManager_Compare_usr+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_UserManager_Compare_usr+1, 0 
	MOVWF       FSR0H 
	MOVF        R1, 0 
	ADDWF       FARG_UserManager_Compare_uuid+0, 0 
	MOVWF       FSR2 
	MOVLW       0
	ADDWFC      FARG_UserManager_Compare_uuid+1, 0 
	MOVWF       FSR2H 
	MOVF        POSTINC0+0, 0 
	XORWF       POSTINC2+0, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_UserManager_Compare30
;UserManager.c,182 :: 		{res=0;break;}
	CLRF        UserManager_Compare_res_L0+0 
	GOTO        L_UserManager_Compare28
L_UserManager_Compare30:
;UserManager.c,180 :: 		for(i=0;i<14;i++)
	INCF        R1, 1 
;UserManager.c,182 :: 		{res=0;break;}
	GOTO        L_UserManager_Compare27
L_UserManager_Compare28:
;UserManager.c,184 :: 		return res;
	MOVF        UserManager_Compare_res_L0+0, 0 
	MOVWF       R0 
;UserManager.c,186 :: 		}
L_end_UserManager_Compare:
	RETURN      0
; end of _UserManager_Compare
