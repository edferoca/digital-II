#ifndef JUEGO_H
#define JUEGO_H

#include "LCD.h"
#include <generated/csr.h>


unsigned int tempo;

void crash(unsigned char posbloquey);
void margenes(void);

void juego(unsigned int Ymin,unsigned int Ymax,unsigned int color);

#endif
