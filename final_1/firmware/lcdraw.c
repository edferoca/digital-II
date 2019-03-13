#include "lcdraw.h"
#include <irq.h>
#include <uart.h>
#include "LCD.h"


void moverse(unsigned int Xmin,unsigned int Ymin,unsigned int Xmax,unsigned int Ymax,unsigned int color){
  	int a=1;
  	while (a) {
  		dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);

  		if (buttons_in_read() & 0x2) {
  			//dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);
  			Xmin= Xmin - 0x05;
  			Xmax= Xmax - 0x05;
  			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
  		}
  		if (buttons_in_read() & 0x10) {
  			//dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);
  			Xmin= Xmin + 0x05;
  			Xmax= Xmax + 0x05;
  			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
  		}
  		if (buttons_in_read() & 0x04) {
  			dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);
  			Ymin= Ymin - 0x05;
  			Ymax= Ymax - 0x05;
  			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
  		}
  		if (buttons_in_read() & 0x08) {
  			dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);
  			Ymin= Ymin + 0x05;
  			Ymax= Ymax + 0x05;
  			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
  		}
  		if (buttons_in_read() & 0x1) {
  			int i=0;
  			while(i<56360){
  				lcd_write(1,0x001f);// amarillo
  				i++;
  			}
  		}
  		busy_wait(2);
  	}
  }


void dib_cua(unsigned int Xmin,unsigned int Ymin,unsigned int Xmax,unsigned int ymax,unsigned int color){
	for (unsigned int x = Xmin ; x < Xmax; x++) {
		lcd_write(0,0x0020);//
		lcd_write(1,x); //
		for (unsigned int y = Ymin; y < ymax; y++) {
				//direccion hoorizontal
				lcd_write(0,0x0021);//
				lcd_write(1,y); //
				lcd_write(0,0x0022);//
				lcd_write(1,0x0000); //
		}
	}
}
