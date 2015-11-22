#include "MemoryManager.h"
#include <built_in.h>



void MemoryManager_Init(Memory *sys)
{
  sys->Address=MemAddress;
}















void MemoryManager_Write(Memory *sys,unsigned int Address,char *dat, char len)
{
  char tmp;
  
  tmp=sys->Address;
  tmp.b0=0;
  
  I2C1_Start();
  I2C1_Wr(tmp);
  I2C1_Wr(Hi(Address));
  I2C1_Wr(Lo(Address));
  for(tmp=0;tmp<len;tmp++)
    I2C1_Wr(dat[tmp]);
  I2C1_Stop();
}








void MemoryManager_Read(Memory *sys,unsigned int Address,char *dat,char len)
{
  char tmp;

  tmp=sys->Address;
  tmp.b0=0;

  I2C1_Start();
  I2C1_Wr(tmp);
  I2C1_Wr(Hi(Address));
  I2C1_Wr(Lo(Address));
  
  tmp.b0=1;
  I2C1_Repeated_Start();
  I2C1_Wr(tmp);
  
  tmp=0;
  if(len>1)
  {
    for(tmp=0;tmp<len-1;tmp++)
      dat[tmp]=I2C1_Rd(1);
    dat[tmp]=I2C1_Rd(0);
  }
  else
    *dat=I2C1_Rd(0);
    
  I2C1_Stop();
}