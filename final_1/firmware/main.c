#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>
#include "LCD.h"
#include "juego.h"
#include "bloques.h"



static void botones(void)
{
	botones_ev_pending_write(0xff); //flag
	botones_ev_enable_write(0xff);
	irq_setmask(irq_getmask() | (1 << BOTONES_INTERRUPT));
}



int main(void)
{
	irq_setmask(0);
	irq_setie(1); //habilita las interrupciones
	botones();
	uart_init();
	lcd_config();
	lcd_inic();
	juego(0XC618);
	while(1) {

	}

	return 0;
}
