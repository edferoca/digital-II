#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>

static void busy_wait(unsigned int ds)
{
	timer0_en_write(0);
	timer0_reload_write(0);
	timer0_load_write(SYSTEM_CLOCK_FREQUENCY/10*ds);
	timer0_en_write(1);
	timer0_update_value_write(1);
	while(timer0_value_read()) timer0_update_value_write(1);
}


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
	puts("prueba										  		-led->sw");

}

static void reboot(void)
{
	asm("call r0");
}

static void prueba(void)
{

	buttoniner_ev_pending_write(1); //flag
	buttoniner_ev_enable_write(1);
	irq_setmask(irq_getmask() | (1 << 4));


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
	else if(strcmp(token,"p")==0)
		prueba();

	prompt();
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
	puts("\nLab004 - CPU testing software built "__DATE__" "__TIME__"\n");
	//help();
	//prompt();

	while(1) {
//	printf("get maski %X \n",irq_pending());
	}

	return 0;
}
