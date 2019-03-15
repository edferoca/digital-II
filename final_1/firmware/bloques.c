#include "bloques.h"

#include <irq.h>
#include <uart.h>
#include "LCD.h"
#include "juego.h"

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

unsigned int bloque(unsigned int aleatorio,unsigned int i){
  int ymin =0X8A;
  int ymax =0x8c;
  switch (aleatorio) {
      case 1:
          //for (size_t i = 0x0; i <= 0x11; i++) {
            dib_cua(ymin-i-1,0x0030,ymax-i-1,0x0042,0xAFE5);
              ymin= ymin -i;
              ymax= ymax -i;
            dib_cua(ymin,0x0030,ymax,0x0042,0x7BEF);
            busy_wait(2);
          break;
      case 2:
          for (size_t i = 0x0; i <= 0x11; i++) {
            dib_cua(ymin,0x0047,ymax,0x0057,0x7BEF);
          //  dib_cua(0x0030,0x78,0x0042,0x8c,0xAFE5);
              ymin= ymin - 0x8;
              ymax= ymax - 0x8;
            dib_cua(ymin,0x0047,ymax,0x0057,0xAFE5);
            busy_wait(0.5);
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
  return ymax;
}

unsigned int carun(unsigned int Xmin,unsigned int Ymin,unsigned int Xmax,unsigned int Ymax,unsigned int color){

      int ymid;

  		if (direcciones_in_read() & 0x8) {
        subir(0,0X8A,0x2A,0x2F,0x0000,0xFFFF);
        subir(0,0X8A,0x6f,0x74,0x0000,0xFFFF);
        subir(0,0X8A,0x43,0x45,0x7BEF,0xFFE0);
        subir(0,0X8A,0x59,0x5b,0x7BEF,0xFFE0);
  			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
  		}
  		if (direcciones_in_read() & 0x1) {
        subir(0,0X8A,0x2A,0x2F,0xFFFF,0x0000);
        subir(0,0X8A,0x6f,0x74,0xFFFF,0x0000);
        subir(0,0X8A,0x43,0x45,0xFFE0,0x7BEF);
        subir(0,0X8A,0x59,0x5b,0xFFE0,0x7BEF);
  			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
  		}

  		if (direcciones_in_read() & 0x4) { //izquierda
  			dib_cua(Xmin,Ymin,Xmax,Ymax,0x7BEF);
        if(Ymin >= 0x32){
          Ymin= Ymin - 0x17;
    			Ymax= Ymax - 0x17;
        }
  			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
        ymid=(Ymin+Ymax)/2;
  		}
  		if (direcciones_in_read() & 0x2) { //derecha
        dib_cua(Xmin,Ymin,Xmax,Ymax,0x7BEF);

        if(Ymax <= 0x6A){
          Ymin= Ymin + 0x17;
    			Ymax= Ymax + 0x17;
        }
  			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
        ymid=(Ymin+Ymax)/2;
  		}
  		busy_wait(1.5);
    return ymid;
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
