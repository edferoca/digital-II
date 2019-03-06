#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>
#include "LCD.h"
#include "lcdraw.h"


static char *readstr(void)
{
	char c[2];
	static char s[64];
	static int ptr = 0;

	if(readchar_nonblock()) {
		c[0] = readchar();
		c[1] = 0;
		switch(c[0]) {
			case 0x7f:
			case 0x08:
				if(ptr > 0) {
					ptr--;
					putsnonl("\x08 \x08");
				}
				break;
			case 0x07:
				break;
			case '\r':
			case '\n':
				s[ptr] = 0x00;
				putsnonl("\n");
				ptr = 0;
				return s;
			default:
				if(ptr >= (sizeof(s) - 1))
					break;
				putsnonl(c);
				s[ptr] = c[0];
				ptr++;
				break;
		}
	}

	return NULL;
}

static char *get_token(char **str)
{
	char *c, *d;

	c = (char *)strchr(*str, ' ');
	if(c == NULL) {
		d = *str;
		*str = *str+strlen(*str);
		return d;
	}
	*c = 0;
	d = *str;
	*str = c+1;
	return d;
}

static void prompt(void)
{
	printf("RUNTIME>");
}

static void help(void)
{
	puts("Available commands:");
	puts("help                            - this command");
	puts("reboot                          - reboot CPU");
	puts("sw										  		-led->sw");
	puts("lcd										  		-cpantalla");
}

static void reboot(void)
{
	asm("call r0");
}


static void sw_led_test(void)
{
	int i=1;
	printf("sw_led_test...\n");

	while (i) {
			leds_out_write(switches_in_read());
			busy_wait(1);
	}
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


static void console_service(void)
{
	char *str;
	char *token;

	str = readstr();
	if(str == NULL) return;
	token = get_token(&str);
	if(strcmp(token, "help") == 0)
		help();
	else if(strcmp(token, "reboot") == 0)
		reboot();
	else if(strcmp(token,"sw")==0)
		sw_led_test();
	else if(strcmp(token,"lcd")==0)
		pantalla();
	prompt();
}

int main(void)
{
	irq_setmask(0);
	irq_setie(1);
	uart_init();

	puts("\nLab004 - CPU testing software built "__DATE__" "__TIME__"\n");
	help();
	prompt();

	while(1) {
		console_service();
	}

	return 0;
}
