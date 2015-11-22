#line 1 "C:/Users/Kapouchima/Desktop/TAC/ReaderManager/ReaderManager.c"
#line 1 "c:/users/kapouchima/desktop/tac/readermanager/readermanager.h"










typedef struct
{
 char TimeOutCounter;
 char BufferCounter;
 char Buffer[ 20 ];
 char TagInfo[ 12 ];
 char TagExists;
}Reader;


void ReaderManager_Init(Reader *);
void ReaderManager_DataRecieved(Reader *, char);
void ReaderManager_Task(Reader *);
void ReaderManager_TimeOutEPOCH(Reader *);
#line 6 "C:/Users/Kapouchima/Desktop/TAC/ReaderManager/ReaderManager.c"
void ReaderManager_Init(Reader *sys)
{
 sys->TimeOutCounter=0;
 sys->BufferCounter=0;
 sys->TagExists=0;
}
#line 28 "C:/Users/Kapouchima/Desktop/TAC/ReaderManager/ReaderManager.c"
void ReaderManager_DataRecieved(Reader *sys, char dat)
{
 sys->TimeOutCounter=0;
 sys->Buffer[sys->BufferCounter]=dat;
 sys->BufferCounter=sys->BufferCounter+1;
}
#line 47 "C:/Users/Kapouchima/Desktop/TAC/ReaderManager/ReaderManager.c"
char CRCCheck(Reader *sys)
{
 return 1;
}
#line 66 "C:/Users/Kapouchima/Desktop/TAC/ReaderManager/ReaderManager.c"
void ProcessPacket(Reader *sys)
{
 char i;

 if(CRCCheck(sys))
 {
 for(i= 3 ;i<= 14 ;i++)
 sys->TagInfo[i- 3 ]=sys->Buffer[i];

 sys->TagExists=1;
 }
}
#line 91 "C:/Users/Kapouchima/Desktop/TAC/ReaderManager/ReaderManager.c"
void ReaderManager_Task(Reader *sys)
{
 if(sys->TimeOutCounter >=  10 )
 sys->BufferCounter=0;

 if(sys->BufferCounter >=  20 )
 {ProcessPacket(sys); sys->BufferCounter=0;}

}
#line 113 "C:/Users/Kapouchima/Desktop/TAC/ReaderManager/ReaderManager.c"
void ReaderManager_TimeOutEPOCH(Reader *sys)
{
 if(sys->TimeOutCounter <=  10 )
 sys->TimeOutCounter=sys->TimeOutCounter+1;
}
