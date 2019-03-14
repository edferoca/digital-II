#include "juego.h"
#include <irq.h>
#include <uart.h>
#include "LCD.h"
#include "bloques.h"

void juego(unsigned int Ymin,unsigned int Ymax,unsigned int color){
  int obscont=0 ;

  for (size_t i = 0x0; i <= 0x8c; i++) {
    int yobst =bloque(1,obscont);
    obscont= obscont+1 ;
    int yrun=carun(0x00,Ymin,0x0014,Ymax,color);
    Ymin= (yrun*2)-Ymin;
    Ymax= (yrun*2)-Ymax;
  }
}

void margenes(void){
    //dib morado
    dib_cua(0x92,0x00,0xaf,0x9c,0x901A);
    dib_cua(0x00,0x00,0x8c,0x2A,0x07E0);
    dib_cua(0x00,0x74,0x8c,0x9c,0x07E0);
    dib_cua(0x00,0x2f,0x8c,0x6f,0x7BEF);


    for(int i=0;i<=0x8A;i++){
      dib_cua(i,0x2A,i+4,0x2F,0x0000);
      dib_cua(i+4,0x2A,i+7,0x2F,0xFFFF);
      i=i+7;
    }
    for(int i=0;i<=0x8A;i++){
      dib_cua(i,0x6f,i+4,0x74,0x0000);
      dib_cua(i+4,0x6f,i+7,0x74,0xFFFF);
      i=i+7;
    }
    for(int i=0;i<=0X8A;i++){
      dib_cua(i,0x43,i+4,0x45,0x7BEF);
      dib_cua(i+4,0x43,i+7,0x45,0xFFE0);
      i=i+7;
    }
    for(int i=0;i<=0x8A;i++){
      dib_cua(i,0x59,i+4,0x5b,0x7BEF);
      dib_cua(i+4,0x59,i+7,0x5b,0xFFE0);
      i=i+7;
    }


    for(int i=0X00;i<=0xA0;i++){
      dib_cua(0x8c,i-2,0x92,i+2,0x0000);
    }
    for(int i=0X00;i<=0xAf;i++){
      dib_cua(i-2,0x9c,i+2,0xA2,0x0000);
    }
}
