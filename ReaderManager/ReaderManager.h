#ifndef _READERMANAGER
#define _READERMANAGER


#define BUFFERSIZE 20
#define TAGINFOSIZE 12
#define TIMEOUTDELAY 10
#define TAGINFOSTARTADDRESS 3
#define TAGINFOSTOPADDRESS 14

typedef struct
{
  char TimeOutCounter;
  char BufferCounter;
  char Buffer[BUFFERSIZE];
  char TagInfo[TAGINFOSIZE];
  char TagExists;
}Reader;


void ReaderManager_Init(Reader *);
void ReaderManager_DataRecieved(Reader *, char);
void ReaderManager_Task(Reader *);
void ReaderManager_TimeOutEPOCH(Reader *);



#endif