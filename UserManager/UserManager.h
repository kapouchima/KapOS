#ifndef _USERMANAGER
#define _USERMANAGER

typedef struct
{
  char UUID[14];
  char Flags[2];
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