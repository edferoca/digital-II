#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>
//#include "./image1.c"
#include "./SD.h"

typedef struct {
	volatile uint32_t write;
	volatile uint32_t write2;

} led_t;


led_t  *ledf  = (led_t *)   0xe0005800;


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
	puts("1                               - reboot CPU");
    puts("2                               - writeSPI");
    puts("3                               - cmd0");
    puts("4                               - cmd0-1Line");
    puts("5                               - initConfig");
}

static void reboot(void)
{
	asm("call r0");
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
	else if(strcmp(token, "1") == 0)
		reboot();
    else if(strcmp(token, "2") == 0){
        dummy(10);
        SPI_Write(0x40,0);
        SPI_Write(0x00,0);
        SPI_Write(0x00,0);
        SPI_Write(0x00,0);
        SPI_Write(0x00,0);
        SPI_Write(0x95,0);
        SPI_Write(0xff,0);
        SPI_Write(0xff,0);
        SPI_Write(0xff,0);
        SPI_Write(0xff,0);}
    else if(strcmp(token, "3") == 0){
        dummy(10);
        uint8_t res=SD_Command(0x0, 0x0, 0x95);
        if(res==0x1){printf("Listo\n");
        }else{printf("Paila\n");}
        }
    else if(strcmp(token, "4") == 0){
        dummy(10);
        if(SD_Command(0x0, 0x0, 0x95)==0x1){printf("Listo\n");
        }else{printf("Paila\n");}
        }
    else if(strcmp(token, "5") == 0){
        initConfig();
        }
    else if(strcmp(token, "6") == 0){
        uint8_t data=readSingle(0x220+0x0,0x1);
        printf("%x\n",data);
        }
    else if(strcmp(token, "7") == 0){
        uint8_t data=SPI_Write(0xff,0);;
        printf("%x\n",data);
        }
    else if(strcmp(token, "8") == 0){
        uint8_t data=readSingle(2,0x8);
        printf("%x\n",data);
        }
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
