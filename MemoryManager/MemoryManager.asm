
_MemoryManager_Init:

;MemoryManager.c,6 :: 		void MemoryManager_Init(Memory *sys)
;MemoryManager.c,8 :: 		sys->Address=MemAddress;
	MOVFF       FARG_MemoryManager_Init_sys+0, FSR1
	MOVFF       FARG_MemoryManager_Init_sys+1, FSR1H
	MOVLW       160
	MOVWF       POSTINC1+0 
;MemoryManager.c,9 :: 		}
L_end_MemoryManager_Init:
	RETURN      0
; end of _MemoryManager_Init

_MemoryManager_Write:

;MemoryManager.c,25 :: 		void MemoryManager_Write(Memory *sys,unsigned int Address,char *dat, char len)
;MemoryManager.c,29 :: 		tmp=sys->Address;
	MOVFF       FARG_MemoryManager_Write_sys+0, FSR0
	MOVFF       FARG_MemoryManager_Write_sys+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       MemoryManager_Write_tmp_L0+0 
;MemoryManager.c,30 :: 		tmp.b0=0;
	BCF         MemoryManager_Write_tmp_L0+0, 0 
;MemoryManager.c,32 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;MemoryManager.c,33 :: 		I2C1_Wr(tmp);
	MOVF        MemoryManager_Write_tmp_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MemoryManager.c,34 :: 		I2C1_Wr(Hi(Address));
	MOVF        FARG_MemoryManager_Write_Address+1, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MemoryManager.c,35 :: 		I2C1_Wr(Lo(Address));
	MOVF        FARG_MemoryManager_Write_Address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MemoryManager.c,36 :: 		for(tmp=0;tmp<len;tmp++)
	CLRF        MemoryManager_Write_tmp_L0+0 
L_MemoryManager_Write0:
	MOVF        FARG_MemoryManager_Write_len+0, 0 
	SUBWF       MemoryManager_Write_tmp_L0+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_MemoryManager_Write1
;MemoryManager.c,37 :: 		I2C1_Wr(dat[tmp]);
	MOVF        MemoryManager_Write_tmp_L0+0, 0 
	ADDWF       FARG_MemoryManager_Write_dat+0, 0 
	MOVWF       FSR0 
	MOVLW       0
	ADDWFC      FARG_MemoryManager_Write_dat+1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MemoryManager.c,36 :: 		for(tmp=0;tmp<len;tmp++)
	INCF        MemoryManager_Write_tmp_L0+0, 1 
;MemoryManager.c,37 :: 		I2C1_Wr(dat[tmp]);
	GOTO        L_MemoryManager_Write0
L_MemoryManager_Write1:
;MemoryManager.c,38 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;MemoryManager.c,39 :: 		}
L_end_MemoryManager_Write:
	RETURN      0
; end of _MemoryManager_Write

_MemoryManager_Read:

;MemoryManager.c,48 :: 		void MemoryManager_Read(Memory *sys,unsigned int Address,char *dat,char len)
;MemoryManager.c,52 :: 		tmp=sys->Address;
	MOVFF       FARG_MemoryManager_Read_sys+0, FSR0
	MOVFF       FARG_MemoryManager_Read_sys+1, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       MemoryManager_Read_tmp_L0+0 
;MemoryManager.c,53 :: 		tmp.b0=0;
	BCF         MemoryManager_Read_tmp_L0+0, 0 
;MemoryManager.c,55 :: 		I2C1_Start();
	CALL        _I2C1_Start+0, 0
;MemoryManager.c,56 :: 		I2C1_Wr(tmp);
	MOVF        MemoryManager_Read_tmp_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MemoryManager.c,57 :: 		I2C1_Wr(Hi(Address));
	MOVF        FARG_MemoryManager_Read_Address+1, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MemoryManager.c,58 :: 		I2C1_Wr(Lo(Address));
	MOVF        FARG_MemoryManager_Read_Address+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MemoryManager.c,60 :: 		tmp.b0=1;
	BSF         MemoryManager_Read_tmp_L0+0, 0 
;MemoryManager.c,61 :: 		I2C1_Repeated_Start();
	CALL        _I2C1_Repeated_Start+0, 0
;MemoryManager.c,62 :: 		I2C1_Wr(tmp);
	MOVF        MemoryManager_Read_tmp_L0+0, 0 
	MOVWF       FARG_I2C1_Wr_data_+0 
	CALL        _I2C1_Wr+0, 0
;MemoryManager.c,64 :: 		tmp=0;
	CLRF        MemoryManager_Read_tmp_L0+0 
;MemoryManager.c,65 :: 		if(len>1)
	MOVF        FARG_MemoryManager_Read_len+0, 0 
	SUBLW       1
	BTFSC       STATUS+0, 0 
	GOTO        L_MemoryManager_Read3
;MemoryManager.c,67 :: 		for(tmp=0;tmp<len-1;tmp++)
	CLRF        MemoryManager_Read_tmp_L0+0 
L_MemoryManager_Read4:
	DECF        FARG_MemoryManager_Read_len+0, 0 
	MOVWF       R1 
	CLRF        R2 
	MOVLW       0
	SUBWFB      R2, 1 
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       R2, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__MemoryManager_Read11
	MOVF        R1, 0 
	SUBWF       MemoryManager_Read_tmp_L0+0, 0 
L__MemoryManager_Read11:
	BTFSC       STATUS+0, 0 
	GOTO        L_MemoryManager_Read5
;MemoryManager.c,68 :: 		dat[tmp]=I2C1_Rd(1);
	MOVF        MemoryManager_Read_tmp_L0+0, 0 
	ADDWF       FARG_MemoryManager_Read_dat+0, 0 
	MOVWF       FLOC__MemoryManager_Read+0 
	MOVLW       0
	ADDWFC      FARG_MemoryManager_Read_dat+1, 0 
	MOVWF       FLOC__MemoryManager_Read+1 
	MOVLW       1
	MOVWF       FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FLOC__MemoryManager_Read+0, FSR1
	MOVFF       FLOC__MemoryManager_Read+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MemoryManager.c,67 :: 		for(tmp=0;tmp<len-1;tmp++)
	INCF        MemoryManager_Read_tmp_L0+0, 1 
;MemoryManager.c,68 :: 		dat[tmp]=I2C1_Rd(1);
	GOTO        L_MemoryManager_Read4
L_MemoryManager_Read5:
;MemoryManager.c,69 :: 		dat[tmp]=I2C1_Rd(0);
	MOVF        MemoryManager_Read_tmp_L0+0, 0 
	ADDWF       FARG_MemoryManager_Read_dat+0, 0 
	MOVWF       FLOC__MemoryManager_Read+0 
	MOVLW       0
	ADDWFC      FARG_MemoryManager_Read_dat+1, 0 
	MOVWF       FLOC__MemoryManager_Read+1 
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FLOC__MemoryManager_Read+0, FSR1
	MOVFF       FLOC__MemoryManager_Read+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;MemoryManager.c,70 :: 		}
	GOTO        L_MemoryManager_Read7
L_MemoryManager_Read3:
;MemoryManager.c,72 :: 		*dat=I2C1_Rd(0);
	CLRF        FARG_I2C1_Rd_ack+0 
	CALL        _I2C1_Rd+0, 0
	MOVFF       FARG_MemoryManager_Read_dat+0, FSR1
	MOVFF       FARG_MemoryManager_Read_dat+1, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
L_MemoryManager_Read7:
;MemoryManager.c,74 :: 		I2C1_Stop();
	CALL        _I2C1_Stop+0, 0
;MemoryManager.c,75 :: 		}
L_end_MemoryManager_Read:
	RETURN      0
; end of _MemoryManager_Read
