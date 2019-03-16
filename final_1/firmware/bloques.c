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
int posbloque2 = 0x84;
int posbloque3 = 0x84;
int velocidad=5;

void bloque(unsigned int carril){

    if (carril == 1) {
      dib_cua(posbloque-0x8,0x0030,posbloque+0x8,0x0042,0x7BEF);
      crash(posbloque,0x39);
      if(posbloque >= 0x15 ){
        posbloque=posbloque-0x10;
      }else{
        posbloque = 0x84;
      }
      dib_cua(posbloque-0x8,0x0030,posbloque+0x8,0x0042,0x7BE0);
      busy_wait(velocidad);
    }
    if (carril == 2) {
          dib_cua(posbloque2-0x8,0x0047,posbloque2+0x8,0x0057,0x7BEF);
          crash(posbloque2,0x4f);
          if(posbloque2 >= 0x15 ){
            posbloque2=posbloque2-0x10;
          }else{
            posbloque2 = 0x84;
          }
          dib_cua(posbloque2-0x8,0x0047,posbloque2+0x8,0x0057,0x7BE0);
          busy_wait(velocidad);
    }
    if (carril == 3) {
        dib_cua(posbloque3-0x8,0x005E,posbloque3+0x8,0x006C,0x7BEF);
        crash(posbloque3,0x65);
        if(posbloque3 >= 0x15 ){
          posbloque3=posbloque3-0x10;
        }else{
          posbloque3 = 0x84;
        }
        dib_cua(posbloque3-0x8,0x005E,posbloque3+0x8,0x006C,0x7BE0);
        busy_wait(velocidad);
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

void crash(unsigned char pos, unsigned char posbloquey){
  if (pos <= 0x24) {
    if (posx == posbloquey) {

      posx = 0x4f;
      posbloque = 0x84;
      posbloque2 = 0x84;
      posbloque3 = 0x84;
      margenes();
      tempo=0;
      velocidad=5;
      vuelta=0;
    }
  }
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
