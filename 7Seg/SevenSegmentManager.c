#include "SevenSegmentManager.h"







void EnableSegment(char seg)
{
  switch(seg)
  {
    case 0:
      Digit1En=EnableLogic;
      #if(DIGITS>1)
        Digit2En=DisableLogic;
      #endif
      #if(DIGITS>2)
        Digit3En=DisableLogic;
      #endif
      #if(DIGITS>3)
        Digit4En=DisableLogic;
      #endif
      break;
      
    case 1:
      Digit2En=EnableLogic;
      Digit1En=DisableLogic;
      #if(DIGITS>2)
        Digit3En=DisableLogic;
      #endif
      #if(DIGITS>3)
        Digit4En=DisableLogic;
      #endif
      break;
      
    case 2:
      Digit3En=EnableLogic;
      Digit1En=DisableLogic;
      Digit2En=DisableLogic;
      #if(DIGITS>3)
        Digit4En=DisableLogic;
      #endif
      break;
      
    case 3:
      Digit4En=EnableLogic;
      Digit1En=DisableLogic;
      Digit2En=DisableLogic;
      Digit3En=DisableLogic;
      break;

  }
}













void PlayAnimation(char animCode)
{

}















void SetChar(char ch)
{
  char i=ch;
  
  if(i.b7)SegDp=On;
  else SegDp=Off;

  i.b0=0;
  
  switch(ch)
  {
    case 0x00:
      SegA=On;SegB=On;SegC=On;SegD=On;SegE=On;SegF=On;SegG=Off;break;
      
    case 0x01:
      SegA=0;SegB=On;SegC=On;SegD=Off;SegE=Off;SegF=Off;SegG=Off;break;
      
    case 0x02:
      SegA=On;SegB=On;SegC=Off;SegD=On;SegE=On;SegF=Off;SegG=On;break;
      
    case 0x03:
      SegA=On;SegB=On;SegC=On;SegD=On;SegE=Off;SegF=Off;SegG=Off;break;

    case 0x04:
      SegA=Off;SegB=On;SegC=On;SegD=Off;SegE=Off;SegF=On;SegG=On;break;
      
    case 0x05:
      SegA=On;SegB=Off;SegC=On;SegD=On;SegE=Off;SegF=On;SegG=On;break;
      
    case 0x06:
      SegA=On;SegB=Off;SegC=On;SegD=On;SegE=On;SegF=On;SegG=On;break;
      
    case 0x07:
      SegA=On;SegB=On;SegC=On;SegD=Off;SegE=Off;SegF=Off;SegG=Off;break;
      
    case 0x08:
      SegA=On;SegB=On;SegC=On;SegD=On;SegE=On;SegF=On;SegG=On;break;
      
    case 0x09:
      SegA=On;SegB=On;SegC=On;SegD=On;SegE=Off;SegF=On;SegG=On;break;
      
    case '-':
      SegA=Off;SegB=Off;SegC=Off;SegD=Off;SegE=Off;SegF=Off;SegG=On;break;
      
    case 0x0A:
      PlayAnimation(1);
  }
}











void SevenSegmentManager_Task(SevenSegment *sys)
{
    EnableSegment(sys->RefreshCounter);
    SetChar(sys->Display[sys->RefreshCounter]);
    
    
    sys->RefreshCounter=sys->RefreshCounter+1;
    if(sys->RefreshCounter >= DIGITS)
      sys->RefreshCounter=0;
}












void SevenSegmentManager_AnimationEPOCH(SevenSegment *sys)
{
  if(sys->AnimationCounter >= 255)
   sys->AnimationCounter=0;
  else
   sys->AnimationCounter=sys->AnimationCounter+1;
}