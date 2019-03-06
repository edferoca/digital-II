#ifndef LCDRAW_H
#define LCDRAW_H

#include "LCD.h"
#include <generated/csr.h>

void moverse(unsigned int Xmin,unsigned int Ymin,unsigned int Xmax,unsigned int Ymax,unsigned int color);
void dib_cua(unsigned int Xmin,unsigned int Ymin,unsigned int Xmax,unsigned int ymax,unsigned int color);



#endif
