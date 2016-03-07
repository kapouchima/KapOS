#line 1 "C:/Users/Kapouchima/Documents/PIC Projects/KapOS/7Seg/SevenSegmentManager.c"
#line 1 "c:/users/kapouchima/documents/pic projects/kapos/7seg/sevensegmentmanager.h"
#line 34 "c:/users/kapouchima/documents/pic projects/kapos/7seg/sevensegmentmanager.h"
typedef struct
{
 char Display[ 4 ];
 char RefreshCounter;
 char AnimationCounter;
}SevenSegment;


void SevenSegmentManager_Task(SevenSegment *);
void SevenSegmentManager_AnimationEPOCH(SevenSegment *);
#line 9 "C:/Users/Kapouchima/Documents/PIC Projects/KapOS/7Seg/SevenSegmentManager.c"
void EnableSegment(char seg)
{
 switch(seg)
 {
 case 0:
  portd.b0 = 1 ;

  portd.b0 = 0 ;


  portd.b0 = 0 ;


  portd.b0 = 0 ;

 break;

 case 1:
  portd.b0 = 1 ;
  portd.b0 = 0 ;

  portd.b0 = 0 ;


  portd.b0 = 0 ;

 break;

 case 2:
  portd.b0 = 1 ;
  portd.b0 = 0 ;
  portd.b0 = 0 ;

  portd.b0 = 0 ;

 break;

 case 3:
  portd.b0 = 1 ;
  portd.b0 = 0 ;
  portd.b0 = 0 ;
  portd.b0 = 0 ;
 break;

 }
}
#line 68 "C:/Users/Kapouchima/Documents/PIC Projects/KapOS/7Seg/SevenSegmentManager.c"
void PlayAnimation(char animCode)
{

}
#line 87 "C:/Users/Kapouchima/Documents/PIC Projects/KapOS/7Seg/SevenSegmentManager.c"
void SetChar(char ch)
{
 char i=ch;

 if(i.b7) portb.b7 = 1 ;
 else  portb.b7 = 0 ;

 i.b0=0;

 switch(ch)
 {
 case 0x00:
  portb.b0 = 1 ; portb.b1 = 1 ; portb.b2 = 1 ; portb.b3 = 1 ; portb.b4 = 1 ; portb.b5 = 1 ; portb.b6 = 0 ;break;

 case 0x01:
  portb.b0 =0; portb.b1 = 1 ; portb.b2 = 1 ; portb.b3 = 0 ; portb.b4 = 0 ; portb.b5 = 0 ; portb.b6 = 0 ;break;

 case 0x02:
  portb.b0 = 1 ; portb.b1 = 1 ; portb.b2 = 0 ; portb.b3 = 1 ; portb.b4 = 1 ; portb.b5 = 0 ; portb.b6 = 1 ;break;

 case 0x03:
  portb.b0 = 1 ; portb.b1 = 1 ; portb.b2 = 1 ; portb.b3 = 1 ; portb.b4 = 0 ; portb.b5 = 0 ; portb.b6 = 0 ;break;

 case 0x04:
  portb.b0 = 0 ; portb.b1 = 1 ; portb.b2 = 1 ; portb.b3 = 0 ; portb.b4 = 0 ; portb.b5 = 1 ; portb.b6 = 1 ;break;

 case 0x05:
  portb.b0 = 1 ; portb.b1 = 0 ; portb.b2 = 1 ; portb.b3 = 1 ; portb.b4 = 0 ; portb.b5 = 1 ; portb.b6 = 1 ;break;

 case 0x06:
  portb.b0 = 1 ; portb.b1 = 0 ; portb.b2 = 1 ; portb.b3 = 1 ; portb.b4 = 1 ; portb.b5 = 1 ; portb.b6 = 1 ;break;

 case 0x07:
  portb.b0 = 1 ; portb.b1 = 1 ; portb.b2 = 1 ; portb.b3 = 0 ; portb.b4 = 0 ; portb.b5 = 0 ; portb.b6 = 0 ;break;

 case 0x08:
  portb.b0 = 1 ; portb.b1 = 1 ; portb.b2 = 1 ; portb.b3 = 1 ; portb.b4 = 1 ; portb.b5 = 1 ; portb.b6 = 1 ;break;

 case 0x09:
  portb.b0 = 1 ; portb.b1 = 1 ; portb.b2 = 1 ; portb.b3 = 1 ; portb.b4 = 0 ; portb.b5 = 1 ; portb.b6 = 1 ;break;

 case '-':
  portb.b0 = 0 ; portb.b1 = 0 ; portb.b2 = 0 ; portb.b3 = 0 ; portb.b4 = 0 ; portb.b5 = 0 ; portb.b6 = 1 ;break;

 case 0x0A:
 PlayAnimation(1);
 }
}
#line 146 "C:/Users/Kapouchima/Documents/PIC Projects/KapOS/7Seg/SevenSegmentManager.c"
void SevenSegmentManager_Task(SevenSegment *sys)
{
 EnableSegment(sys->RefreshCounter);
 SetChar(sys->Display[sys->RefreshCounter]);


 sys->RefreshCounter=sys->RefreshCounter+1;
 if(sys->RefreshCounter >=  4 )
 sys->RefreshCounter=0;
}
#line 168 "C:/Users/Kapouchima/Documents/PIC Projects/KapOS/7Seg/SevenSegmentManager.c"
void SevenSegmentManager_AnimationEPOCH(SevenSegment *sys)
{
 if(sys->AnimationCounter >= 255)
 sys->AnimationCounter=0;
 else
 sys->AnimationCounter=sys->AnimationCounter+1;
}
