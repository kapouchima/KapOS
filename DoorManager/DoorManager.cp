#line 1 "C:/Users/Kapouchima/Desktop/TAC/DoorManager/DoorManager.c"
#line 1 "c:/users/kapouchima/desktop/tac/doormanager/doormanager.h"
#line 1 "c:/users/kapouchima/desktop/tac/doormanager/../signaling/signaling.h"
#line 30 "c:/users/kapouchima/desktop/tac/doormanager/../signaling/signaling.h"
typedef struct
{
 char SignalCode;
 unsigned long Time;
 char Expired;
 char Fired;
}Signal;

typedef struct
{
 Signal SignalQueue[ 30 ];
 unsigned long SystemEPOCH;
}SignalingSystem;

void SignalingSystem_SystemEPOCH(SignalingSystem *);
void SignalingSystem_AddSignal(SignalingSystem *,unsigned long ,char );
char SignalingSystem_CheckSignal(SignalingSystem * ,char );
void SignalingSystem_ClearSignal(SignalingSystem *,char);
void SignalingSystem_ClearAllSignals(SignalingSystem * ,char );
void SignalingSystem_Task(SignalingSystem *);
void SignalingSystem_Init(SignalingSystem *);
#line 13 "c:/users/kapouchima/desktop/tac/doormanager/doormanager.h"
typedef struct{
 char Type;
 char CarPassTime;
 char OpenTime;
 char CloseTime;
 char AutoCloseTime;
 char InvalidTime;
 char IRMode;
 char State;
 SignalingSystem SigSys;
 unsigned long ClosingStartTime;
}Door;


void DoorManager_Init(Door *);
void DoorManager_Task(Door *);
void DoorManager_CarEntered(Door *);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 4 "C:/Users/Kapouchima/Desktop/TAC/DoorManager/DoorManager.c"
void DoorManager_Open(Door *);

char ActionTaken=0,DoorShouldBe=0;


void DoorManager_Init(Door *sys)
{
 sys->State=1;
}
#line 26 "C:/Users/Kapouchima/Desktop/TAC/DoorManager/DoorManager.c"
void PushOpenSequence(Door *sys,char delay,char OpenT)
{
 char InvalidPeriod;
 InvalidPeriod = sys->InvalidTime/2;

 SignalingSystem_AddSignal(& sys->SigSys,delay,2);
 SignalingSystem_AddSignal(& sys->SigSys,delay+OpenT,3);
 SignalingSystem_AddSignal(& sys->SigSys,delay+OpenT+sys->AutoCloseTime-InvalidPeriod,5);
 SignalingSystem_AddSignal(& sys->SigSys,delay+OpenT+sys->AutoCloseTime+InvalidPeriod,4);
 SignalingSystem_AddSignal(& sys->SigSys,delay+OpenT+sys->AutoCloseTime+sys->CloseTime-InvalidPeriod,5);
 SignalingSystem_AddSignal(& sys->SigSys,delay+OpenT+sys->AutoCloseTime+sys->CloseTime+InvalidPeriod,1);

}
#line 55 "C:/Users/Kapouchima/Desktop/TAC/DoorManager/DoorManager.c"
void DoorManager_Task(Door *sys)
{


 if(SignalingSystem_CheckSignal(& sys->SigSys,1))
 sys->State=1;

 if(SignalingSystem_CheckSignal(& sys->SigSys,2))
 sys->State=2;

 if(SignalingSystem_CheckSignal(& sys->SigSys,3))
 sys->State=3;

 if(SignalingSystem_CheckSignal(& sys->SigSys,4))
 {sys->State=4; sys->ClosingStartTime=sys->SigSys.SystemEPOCH;}

 if(SignalingSystem_CheckSignal(& sys->SigSys,5))
 sys->State=5;



 if((sys->State == 4) && ( portc.b0  == sys->IRMode))
 {
 SignalingSystem_ClearSignal(& sys->SigSys,1);
 SignalingSystem_ClearSignal(& sys->SigSys,2);
 SignalingSystem_ClearSignal(& sys->SigSys,3);
 SignalingSystem_ClearSignal(& sys->SigSys,4);
 SignalingSystem_ClearSignal(& sys->SigSys,5);
 sys->State=5;
 PushOpenSequence(sys,1, ((char *)&sys->SigSys.SystemEPOCH - sys->ClosingStartTime)[0] );
 }



 if(SignalingSystem_CheckSignal(& sys->SigSys,10))
  portd.b0 =1;

 if(SignalingSystem_CheckSignal(& sys->SigSys,11))
  portd.b0 =0;

 if(SignalingSystem_CheckSignal(& sys->SigSys,12))
  portd.b1 =1;

 if(SignalingSystem_CheckSignal(& sys->SigSys,13))
  portd.b1 =0;

 if(SignalingSystem_CheckSignal(& sys->SigSys,14))
  portd.b2 =1;

 if(SignalingSystem_CheckSignal(& sys->SigSys,15))
  portd.b2 =0;




 if(SignalingSystem_CheckSignal(& sys->SigSys,50))
 {DoorShouldBe=0; ActionTaken=0;}



 if((DoorShouldBe) && (sys->State==1) && (ActionTaken==0))
 DoorManager_Open(sys);

 if((DoorShouldBe) && (sys->State==4) && (ActionTaken==0))
 DoorManager_Open(sys);

}
#line 134 "C:/Users/Kapouchima/Desktop/TAC/DoorManager/DoorManager.c"
void DoorManager_Open(Door *sys)
{
 switch(sys->Type)
 {
 case 0:
 SignalingSystem_AddSignal(& sys->SigSys,1,12);
 SignalingSystem_AddSignal(& sys->SigSys,2,13);
 SignalingSystem_AddSignal(& sys->SigSys,3,10);
 SignalingSystem_AddSignal(& sys->SigSys,4,11);
 break;

 case 1:
 break;
 }

 if(sys->State == 1)
 PushOpenSequence(sys,4, sys->OpenTime);
 else
 PushOpenSequence(sys,4,  ((char *)&sys->SigSys.SystemEPOCH - sys->ClosingStartTime)[0] );

 ActionTaken=1;

}
#line 173 "C:/Users/Kapouchima/Desktop/TAC/DoorManager/DoorManager.c"
void DoorManager_CarEntered(Door *sys)
{
 DoorShouldBe=1;
 SignalingSystem_ClearSignal(& sys->SigSys,50);
 SignalingSystem_AddSignal(& sys->SigSys,sys->CarPassTime,50);
}
