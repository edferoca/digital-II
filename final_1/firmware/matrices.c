#include "matrices.h"

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

unsigned int corazon[14][14]={{0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618},
                              {0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xF800, 0xF800, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618},
                              {0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xF800, 0xF800, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618},
                              {0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xF800, 0xF800, 0xF800, 0xF800, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618},
                              {0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xF800, 0xF800, 0xF800, 0xF800, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618},
                              {0xC618, 0xC618, 0xC618, 0xC618, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xC618, 0xC618, 0xC618, 0xC618},
                              {0xC618, 0xC618, 0xC618, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xC618, 0xC618, 0xC618},
                              {0xC618, 0xC618, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xC618, 0xC618},
                              {0xC618, 0xC618, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xC618, 0xC618},
                              {0xC618, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xC618},
                              {0xC618, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xC618},
                              {0xC618, 0xC618, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xF800, 0xC618, 0xC618},
                              {0xC618, 0xC618, 0xC618, 0xF800, 0xF800, 0xF800, 0xC618, 0xC618, 0xF800, 0xF800, 0xF800, 0xC618, 0xC618, 0xC618},
                              {0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618, 0xC618}};

unsigned int carrito[14][14]={{0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x001F, 0x001F, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x001F, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0x001F, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x001F, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0x001F, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x001F, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0x001F, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x001F, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000}};

unsigned int carrito1[14][14]={{0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0xA145, 0xA145, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xA145, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xA145, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0xA145, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000}};
/*
unsigned int carrito2[14][14]={{0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x471A, 0x471A, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x471A, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0x471A, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x471A, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0x471A, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x471A, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0x471A, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x471A, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000}};

unsigned int carrito3[14][14]={{0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0xFD20, 0xFD20, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0xFD20, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFD20, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xFD20, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFD20, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xFD20, 0xFFFF, 0xFFFF, 0xFFFF, 0xFFFF, 0xFD20, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0xFD20, 0x471A, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000},
                              {0x0000, 0x0000, 0x0000, 0x0000, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x7BEF, 0x0000, 0x0000, 0x0000, 0x0000}};
*/