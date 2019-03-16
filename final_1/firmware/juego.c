#include "juego.h"
#include <irq.h>
#include <uart.h>
#include "LCD.h"
#include "bloques.h"

unsigned int tempo;

void juego(unsigned int Ymin,unsigned int Ymax,unsigned int color){
  int obscont=0 ;

  for (tempo = 0x0; tempo <= 0x8; tempo++) {
    bloque(1,obscont);
    obscont= obscont+1 ;
  }
}

void crash(unsigned char posbloquey){
  if (posbloque <= 0x14) {
    if (posx <= posbloquey) {
      posx = 0x4f;
      posbloque = 0x84;
      margenes();
      tempo=0;
    }
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
