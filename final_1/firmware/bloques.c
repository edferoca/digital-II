#include "bloques.h"

#include <irq.h>
#include <uart.h>
#include "LCD.h"
#include "juego.h"

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int posx=0x4F;
int posbloque = 0x84;
int carril=2;

void bloque(unsigned int aleatorio,unsigned int i){

  switch (aleatorio) {
      case 1:
          //for (size_t i = 0x0; i <= 0x11; i++) {
            dib_cua(posbloque-0x8,0x0030,posbloque+0x8,0x0042,0x7BEF);
            crash(0x42);
            if(posbloque >= 0x5 ){
              posbloque=posbloque-0x10;
            }else{
              posbloque = 0x84;
            }
            dib_cua(posbloque-0x8,0x0030,posbloque+0x8,0x0042,0x7BE0);
            busy_wait(5);
          break;
      case 2:
            dib_cua(posbloque-0x8,0x0047,posbloque+0x8,0x0057,0x7BEF);
            crash(0x42);
            if(posbloque >= 0x5 ){
              posbloque=posbloque-0x10;
            }else{
              posbloque = 0x84;
            }
            dib_cua(posbloque-0x8,0x0047,posbloque+0x8,0x0057,0x7BE0);
      busy_wait(5);
          }
          break;
      case 3:
          for (size_t i = 0x0; i <= 0x11; i++) {
            dib_cua(ymin,0x005E,ymax,0x006C,0x7BEF);
          //  dib_cua(0x0030,0x78,0x0042,0x8c,0xAFE5);
              ymin= ymin - 0x8;
              ymax= ymax - 0x8;
            dib_cua(ymin,0x005E,ymax,0x006C,0xAFE5);
            busy_wait(0.5);
          }
          break;
    }
}



void  arriba (unsigned int color ){
  subir(0,0X8A,0x2A,0x2F,0x0000,0xFFFF);
  subir(0,0X8A,0x6f,0x74,0xFFFF,0x0000);
  subir(0,0X8A,0x43,0x45,0x7BEF,0xFFE0);
  subir(0,0X8A,0x59,0x5b,0x7BEF,0xFFE0);
  dib_cua(0x000D,posx-0x8,0x0001c,posx+0x8,color);
  busy_wait(1);

}

void  abajo (unsigned int color ){
  subir(0,0X8A,0x2A,0x2F,0x0000,0xFFFF);
  subir(0,0X8A,0x6f,0x74,0xFFFF,0x0000);
  subir(0,0X8A,0x43,0x45,0x7BEF,0xFFE0);
  subir(0,0X8A,0x59,0x5b,0x7BEF,0xFFE0);
  dib_cua(0x000D,posx-0x8,0x0001c,posx+0x8,color);
}

void izquierda( unsigned int color){
  dib_cua(0x000D,posx-8,0x0001c,posx+8,0x7BEF);
  if(posx -0xc >= 0x2f ){
    posx = posx-0x16;
  }
  dib_cua(0x000D,posx-8,0x0001c,posx+8,color);
}
void derecha( unsigned int color){
  dib_cua(0x000D,posx-8,0x0001c,posx+8,0x7BEF);
  if(posx +0xc  <= 0x6f ){
    posx = posx+0x16;
  }
  dib_cua(0x000D,posx-8,0x0001c,posx+8,color);
}


void subir(unsigned int imin,unsigned int imax,unsigned int omin,unsigned int omax,unsigned int color1,unsigned int color2){
    for(int i= imin ;i<= imax;i++){
      dib_cua(i,omin,i+4,omax,color1);
      dib_cua(i+4,omin,i+7,omax,color2);
      i=i+7;
    }

    busy_wait(0.5);
    for(int i=0;i<=0x8c;i++){
      dib_cua(i,omin,i+4,omax,color2);
      dib_cua(i+4,omin,i+7,omax,color1);
      i=i+7;
    }
    busy_wait(0.5);
}
