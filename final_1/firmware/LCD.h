#ifndef LCD_H
#define LCD_H


#include <generated/csr.h>

void lcd_config(void);

void lcd_inic(void);

void lcd_write( unsigned char rs, unsigned int info);  //escribe pixel

void dib_cua(unsigned int Xmin,unsigned int Ymin,unsigned int Xmax,unsigned int ymax,unsigned int color); //dibuja region rectangular

void busy_wait(unsigned int ds);



#endif
