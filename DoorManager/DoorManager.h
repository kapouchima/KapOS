#ifndef _DOORMANAGER
#define _DOORMANAGER

#define IRin portc.b0
#define OpenRelay portd.b0
#define StopRelay portd.b1
#define CloseRelay portd.b2

#include "../Signaling/Signaling.h"



typedef struct{
  char Type; // 0- Start/Stop    //1- Open/Stop/Close
  char CarPassTime;
  char OpenTime;
  char CloseTime;
  char AutoCloseTime;
  char InvalidTime;
  char IRMode; // 0-NO    1-NC
  char State; // 1-Close 2-Openning 3-Open 4-Closing 5-Invalid
  SignalingSystem SigSys;
  unsigned long ClosingStartTime;
}Door;


void DoorManager_Init(Door *);
void DoorManager_Task(Door *);
void DoorManager_CarEntered(Door *);



#endif