#include "UserManager.h"
#include "../MemoryManager/MemoryManager.h"






void UserManager_Init(User *usr)
{
  usr->Loc=0;
  usr->Flags[0]=0;
  usr->Flags[1]=0;
}








void UserManager_Delete(User *usr)
{
  char tmp;
  Memory mem;
  
  for(tmp=0;tmp<16;tmp++)
    usr->Dataset[tmp]=0xFF;

  MemoryManager_Init(&mem);
  MemoryManager_Write(&mem,usr->Loc,usr->Dataset,16);
}








void UserManager_Load(unsigned int location, User * usr)
{
  char tmp;
  Memory mem;
  
  MemoryManager_Init(&mem);
  MemoryManager_Read(&mem,location,usr->Dataset,16);
  
  for(tmp=0;tmp<14;tmp++)
    usr->UUID[tmp]=usr->Dataset[tmp];
  usr->Flags[0]=usr->Dataset[14];
  usr->Flags[1]=usr->Dataset[15];
  
  usr->Loc=location;

}









unsigned int UserManager_GetNewLoc()
{
  unsigned int i=0;
  char tmp;
  Memory mem;
  
  MemoryManager_Init(&mem);
  
  for(i=16;i<65510;i=i+16)
  {
    MemoryManager_Read(&mem,i+15,&tmp,1);
    if(tmp==0xFF)
      break;
  }
  return i;
}







void UserManager_Save(User *usr)
{
  char tmp;
  Memory mem;

  usr->Loc=UserManager_GetNewLoc();
  
  for(tmp=0;tmp<14;tmp++)
    usr->Dataset[tmp]=usr->UUID[tmp];
  usr->Dataset[14]=usr->Flags[0];
  usr->Dataset[15]=usr->Flags[1];

  MemoryManager_Init(&mem);
  MemoryManager_Write(&mem,usr->Loc,usr->Dataset,16);
}












unsigned int UserManager_Search(char * uuid)
{
  unsigned int i=0;
  char tmp[14],CMPFlag=1,j;
  Memory mem;

  MemoryManager_Init(&mem);

  for(i=16;i<65510;i=i+16)
  {
    MemoryManager_Read(&mem,i,&tmp,14);
    CMPFlag=1;
    for(j=0;j<14;j++)
      if(tmp[j]!=uuid[j])
      {CMPFlag=0;break;}
    if(CMPFlag==1)
      break;
  }
  if(CMPFlag==0)
    return 0;
  else
    return i;
}
















char UserManager_Equal(User *usr1,User *usr2)
{
  char res=1,i;
  
  for(i=0;i<14;i++)
    if(usr1->UUID[i]!=usr1->UUID[i])
      {res=0;break;}
      
  return res;
}










char UserManager_Compare(User *usr,char *uuid)
{
  char res=1,i;

  for(i=0;i<14;i++)
    if(usr->UUID[i]!=uuid[i])
      {res=0;break;}

  return res;

}