#ifndef _SEVENSEGMODULE
#define _SEVENSEGMODULE

#define EnableLogic 1
#define DisableLogic 0

#define On 1
#define Off 0

#define DIGITS 4

#define SegA portb.b0
#define SegB portb.b1
#define SegC portb.b2
#define SegD portb.b3
#define SegE portb.b4
#define SegF portb.b5
#define SegG portb.b6
#define SegDp portb.b7

#define Digit1En portd.b0
#define Digit2En portd.b0
#define Digit3En portd.b0
#define Digit4En portd.b0
#define Digit5En portd.b0
#define Digit6En portd.b0







typedef struct
{
  char Display[DIGITS];
  char RefreshCounter;
  char AnimationCounter;
}SevenSegment;


void SevenSegmentManager_Task(SevenSegment *);
void SevenSegmentManager_AnimationEPOCH(SevenSegment *);

#endif