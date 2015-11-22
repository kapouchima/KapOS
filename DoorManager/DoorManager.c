#include "DoorManager.h"
#include <built_in.h>

void DoorManager_Open(Door *);

char ActionTaken=0,DoorShouldBe=0; // 0- Close       1- Open


void DoorManager_Init(Door *sys)
{
  sys->State=1;
}







// 1-Close 2-Openning 3-Open 4-Closing 5-Invalid





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
















void DoorManager_Task(Door *sys)
{
  //----------State Signals
  
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
  
  //-------------IR Action
  
  if((sys->State == 4) && (IRin == sys->IRMode))
  { 
    SignalingSystem_ClearSignal(& sys->SigSys,1);
    SignalingSystem_ClearSignal(& sys->SigSys,2);
    SignalingSystem_ClearSignal(& sys->SigSys,3);
    SignalingSystem_ClearSignal(& sys->SigSys,4);
    SignalingSystem_ClearSignal(& sys->SigSys,5);
    sys->State=5;
    PushOpenSequence(sys,1,Lo(sys->SigSys.SystemEPOCH - sys->ClosingStartTime));
  }
    
  //-------------Relay Actions
  
  if(SignalingSystem_CheckSignal(& sys->SigSys,10))
    OpenRelay=1;
    
  if(SignalingSystem_CheckSignal(& sys->SigSys,11))
    OpenRelay=0;
    
  if(SignalingSystem_CheckSignal(& sys->SigSys,12))
    StopRelay=1;
    
  if(SignalingSystem_CheckSignal(& sys->SigSys,13))
    StopRelay=0;
    
  if(SignalingSystem_CheckSignal(& sys->SigSys,14))
    CloseRelay=1;
    
  if(SignalingSystem_CheckSignal(& sys->SigSys,15))
    CloseRelay=0;
    
    
  //--------------- Door should be flag action
  
  if(SignalingSystem_CheckSignal(& sys->SigSys,50))
    {DoorShouldBe=0; ActionTaken=0;}
    
  //--------------- Door Real Action check
  
  if((DoorShouldBe) && (sys->State==1) && (ActionTaken==0))
    DoorManager_Open(sys);
    
  if((DoorShouldBe) && (sys->State==4) && (ActionTaken==0))
    DoorManager_Open(sys);
  
}












void DoorManager_Open(Door *sys)
{
  switch(sys->Type)
  {
    case 0:
      SignalingSystem_AddSignal(& sys->SigSys,1,12); //Stop Relay ON
      SignalingSystem_AddSignal(& sys->SigSys,2,13); //Stop Relay OFF
      SignalingSystem_AddSignal(& sys->SigSys,3,10); //Open Relay ON
      SignalingSystem_AddSignal(& sys->SigSys,4,11); //Open Relay OFF
      break;
      
    case 1:
      break;
  }
  
  if(sys->State == 1)
    PushOpenSequence(sys,4, sys->OpenTime);
  else
    PushOpenSequence(sys,4, Lo(sys->SigSys.SystemEPOCH - sys->ClosingStartTime));
    
  ActionTaken=1;

}
















void DoorManager_CarEntered(Door *sys)
{
  DoorShouldBe=1;
  SignalingSystem_ClearSignal(& sys->SigSys,50);
  SignalingSystem_AddSignal(& sys->SigSys,sys->CarPassTime,50);
}