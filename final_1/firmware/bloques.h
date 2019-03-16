#ifndef BLOQUES_H
#define BLOQUES_H

#include "LCD.h"
#include "juego.h"
#include <generated/csr.h>
#include <stdio.h>
#include <stdlib.h>

int posx;
int posbloque;
int carril;

void  abajo (unsigned int color );
void  arriba (unsigned int color );
void izquierda( unsigned int color);
void derecha( unsigned int color);

void bloque(unsigned int aleatorio,unsigned int i);

void subir(unsigned int imin,unsigned int imax,unsigned int omin,unsigned int omax,unsigned int color1,unsigned int color2);

#endif
