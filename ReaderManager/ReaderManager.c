#include "ReaderManager.h"




void ReaderManager_Init(Reader *sys)
{
  sys->TimeOutCounter=0;
  sys->BufferCounter=0;
  sys->TagExists=0;
}
















void ReaderManager_DataRecieved(Reader *sys, char dat)
{
  sys->TimeOutCounter=0;
  sys->Buffer[sys->BufferCounter]=dat;
  sys->BufferCounter=sys->BufferCounter+1;
}













char CRCCheck(Reader *sys)
{
  return 1;
}















void ProcessPacket(Reader *sys)
{
  char i;
  
  if(CRCCheck(sys))
  {
    for(i=TAGINFOSTARTADDRESS;i<=TAGINFOSTOPADDRESS;i++)
      sys->TagInfo[i-TAGINFOSTARTADDRESS]=sys->Buffer[i];
      
    sys->TagExists=1;
  }
}













void ReaderManager_Task(Reader *sys)
{
  if(sys->TimeOutCounter >= TIMEOUTDELAY)
    sys->BufferCounter=0;
    
  if(sys->BufferCounter >= BUFFERSIZE)
    {ProcessPacket(sys); sys->BufferCounter=0;}
}













void ReaderManager_TimeOutEPOCH(Reader *sys)
{
  if(sys->TimeOutCounter <= TIMEOUTDELAY)
    sys->TimeOutCounter=sys->TimeOutCounter+1;
}