#line 1 "C:/Users/Kapouchima/Desktop/TAC/MemoryManager/MemoryManager.c"
#line 1 "c:/users/kapouchima/desktop/tac/memorymanager/memorymanager.h"





typedef struct
{
 char Address;
}Memory;

void MemoryManager_Init(Memory *sys);
void MemoryManager_Write(Memory *sys,unsigned int Address,char *dat, char len);
void MemoryManager_Read(Memory *sys,unsigned int Address,char *dat,char len);
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 6 "C:/Users/Kapouchima/Desktop/TAC/MemoryManager/MemoryManager.c"
void MemoryManager_Init(Memory *sys)
{
 sys->Address= 0xA0 ;
}
#line 25 "C:/Users/Kapouchima/Desktop/TAC/MemoryManager/MemoryManager.c"
void MemoryManager_Write(Memory *sys,unsigned int Address,char *dat, char len)
{
 char tmp;

 tmp=sys->Address;
 tmp.b0=0;

 I2C1_Start();
 I2C1_Wr(tmp);
 I2C1_Wr( ((char *)&Address)[1] );
 I2C1_Wr( ((char *)&Address)[0] );
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
 I2C1_Wr( ((char *)&Address)[1] );
 I2C1_Wr( ((char *)&Address)[0] );

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
