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



static void pantalla(void)
{

	juego(0x048,0x0055,0XC618);
}

int main(void)
{
	irq_setmask(0);
	irq_setie(1); //habilita las interrupciones
	botones();
	uart_init();
	lcd_config();
	lcd_inic();
	margenes();

	printf("qWIIIII%X \n",irq_getmask());
	printf("get maski %X \n",irq_pending());
	printf("get maske %x \n",(irq_getmask() | (1 << 4)));

 printf("get masko %x \n",UART_INTERRUPT);

	while(1) {
		pantalla();
	}

	return 0;
}
