#ifndef LCD_H
#define LCD_H


#include <generated/csr.h>

void lcd_write( unsigned char rs, unsigned int info);

void lcd_config(void);

void lcd_inic(void);

void busy_wait(unsigned int ds);



#endif
