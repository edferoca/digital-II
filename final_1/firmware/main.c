#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>
#include "LCD.h"
#include "lcdraw.h"

static void busy_wait(unsigned int ds)
{
	timer0_en_write(0);
	timer0_reload_write(0);
	timer0_load_write(SYSTEM_CLOCK_FREQUENCY/10*ds);
	timer0_en_write(1);
	timer0_update_value_write(1);
	while(timer0_value_read()) timer0_update_value_write(1);
}



static void prueba(void)
{

	buttoniner_ev_pending_write(1); //flag
	buttoniner_ev_enable_write(1);
	irq_setmask(irq_getmask() | (1 << 4));

}
//creacion de constantes para spi
unsigned int WRITE_LENGTH = (1 << 16); //tamaño de como va ha escribir datos
unsigned int READ_LENGTH  = (1 << 24);


static void pantalla(void)
{
	lcd_config();
	int i=0;
	lcd_inic();

	i=0;
	while(i<56360){
		lcd_write(1,0x001f);// amarillo
		i++;
	}
	moverse(0X0010,0x0010,0x0015,0x0015,0X0000);

}

int main(void)
{
	irq_setmask(0);
	irq_setie(1); //habilita las interrupciones

	prueba();
	uart_init();
	printf("get maska %X \n",irq_getmask());
	printf("get maski %X \n",irq_pending());
	printf("get maske %x \n",(irq_getmask() | (1 << 4)));

 printf("get masko %x \n",UART_INTERRUPT);

	while(1) {
		pantalla();
	}

	return 0;
}
