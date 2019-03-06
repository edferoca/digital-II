#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>
#include "LCD.h"


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



static void dib_cua(unsigned int Xmin,unsigned int Ymin,unsigned int Xmax,unsigned int ymax,unsigned int color)
{

	for (unsigned int x = Xmin ; x < Xmax; x++) {
		lcd_write(0,0x0020);//
		lcd_write(1,x); //
		for (unsigned int y = Ymin; y < ymax; y++) {
				//direccion hoorizontal
				lcd_write(0,0x0021);//
				lcd_write(1,y); //
				lcd_write(0,0x0022);//
				lcd_write(1,0x0000); //
		}
	}
}

static void moverse(unsigned int Xmin,unsigned int Ymin,unsigned int Xmax,unsigned int Ymax,unsigned int color)
{
	int a=1;
	while (a) {
		dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);

		if (buttons_in_read() & 0x2) {
			//dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);
			Xmin= Xmin - 0x05;
			Xmax= Xmax - 0x05;
			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
		}
		if (buttons_in_read() & 0x10) {
			//dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);
			Xmin= Xmin + 0x05;
			Xmax= Xmax + 0x05;
			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
		}
		if (buttons_in_read() & 0x04) {
			dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);
			Ymin= Ymin - 0x05;
			Ymax= Ymax - 0x05;
			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
		}
		if (buttons_in_read() & 0x08) {
			dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);
			Ymin= Ymin + 0x05;
			Ymax= Ymax + 0x05;
			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
		}
		if (buttons_in_read() & 0x1) {
			int i=0;
			while(i<56360){
				lcd_write(1,0x001f);// amarillo
				i++;
			}
		}
		busy_wait(2);
	}
}


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
	//dib_cua(0X0070,0x0080,0x00AB,0x00BB, 0X0000);

	moverse(0X0010,0x0010,0x0015,0x0015, 0X0000);

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
