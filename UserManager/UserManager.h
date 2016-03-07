#ifndef _USERMANAGER
#define _USERMANAGER

#define UUIDLength 10
#define MemorySize 4096 //Memory Siz in bytes

typedef struct
{
  char UUID[UUIDLength];
  char Flags[16-UUIDLength];
  char Dataset[16];
  unsigned int Loc; // Zero is invalid
}User;

void UserManager_Init(User *);
void UserManager_Delete(User *);
void UserManager_Load(char *,User *);
unsigned int UserManager_GetNewLoc();
void UserManager_Save(User *);
unsigned int UserManager_Search(char *);
char UserManager_Equal(User *,User *);
char UserManager_Compare(User *,char *);




#endif