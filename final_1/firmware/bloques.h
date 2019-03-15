#ifndef BLOQUES_H
#define BLOQUES_H

#include "LCD.h"
#include "juego.h"
#include <generated/csr.h>
#include <stdio.h>
#include <stdlib.h>



unsigned int bloque(unsigned int aleatorio,unsigned int i);

unsigned int  carun(unsigned int Xmin,unsigned int Ymin,unsigned int Xmax,unsigned int Ymax,unsigned int color);
void subir(unsigned int imin,unsigned int imax,unsigned int omin,unsigned int omax,unsigned int color1,unsigned int color2);


#endif
