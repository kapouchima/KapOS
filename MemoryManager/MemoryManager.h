#ifndef _MEMORYMANAGER
#define _MEMORYMANAGER

#define MemAddress 0xA0

typedef struct
{
  char Address;
}Memory;

void MemoryManager_Init(Memory *sys);
void MemoryManager_Write(Memory *sys,unsigned int Address,char *dat, char len);
void MemoryManager_Read(Memory *sys,unsigned int Address,char *dat,char len);

#endif