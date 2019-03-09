#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <irq.h>
#include <uart.h>
#include <console.h>
#include <generated/csr.h>

unsigned OFFLINE      = (1 << 0);
unsigned CS_POLARITY  = (1 << 3);
unsigned CLK_POLARITY = (1 << 4);
unsigned CLK_PHASE    = (1 << 5);
unsigned LSB_FIRST    = (1 << 6);
unsigned HALF_DUPLEX  = (1 << 7);
unsigned DIV_READ     = (1 << 16);
unsigned DIV_WRITE    = (1 << 24);

// xfer mapping
unsigned WRITE_LENGTH = (1 << 16);
unsigned READ_LENGTH  = (1 << 24);


static void busy_wait(unsigned int ds)
{
	timer0_en_write(0);
	timer0_reload_write(0);
	timer0_load_write(SYSTEM_CLOCK_FREQUENCY/10*ds);
	timer0_en_write(1);
	timer0_update_value_write(1);
	while(timer0_value_read()) timer0_update_value_write(1);
}

static void SD_configure(void) {
  unsigned config = 0*OFFLINE;
  config |= 0*CS_POLARITY | 0*CLK_POLARITY | 0*CLK_PHASE;
  config |= 0*LSB_FIRST | 0*HALF_DUPLEX;
  config |= 248*DIV_READ | 248*DIV_WRITE;
	//			div_write	== f_clk/f_spi_write - 2
	//			248 = 100MHz/400kz - 2
  SD_config_write(config);
	SD_xfer_write(1 | 48*WRITE_LENGTH | 48*READ_LENGTH);
}

static void SD_write_16(unsigned short int value){
	SD_configure();

	//unsigned char val = (0b00001010 << 16) | ((0 & 0xff) << 8) | (value & 0xff);
	SD_mosi_data_write(value << 16) ;
	SD_start_write(1);
	//while (SD_active_read() & 0x1){}
	while (SD_pending_read() & 0x1){
	//	break;
	}
}

static void SD_write_48(unsigned short int value1,unsigned short int value2,unsigned short int value3){

	double value = (value1 << 48) | (value2 << 32) | value3
	SD_mosi_data_write(value);
	SD_start_write(1);
	while (SD_active_read() & 0x1){}
}


static void sd_do (void){

		printf("Inicializando SD...\n");
		SD_configure();
		busy_wait(0.01); //1ms
	//tiempo muerto para energizar correctamente la SD
		busy_wait(0.01);
		printf("Power sequence complete...\n");

	//CMD0: Comando Reset, establece el modo de comunicación de la tarjeta en SPI
		SD_write_16(0x4000);//01000000 00000000
		SD_write_16(0x0000);//00000000 00000000
		SD_write_16(0x0095);//00000000 10010101
		busy_wait(0.001);
		SD_write_16(0x4000);//01000000 00000000
		SD_write_16(0x0000);//00000000 00000000
		SD_write_16(0x0095);//00000000 10010101

		unsigned short int miso = SD_miso_data_read();
		//printf("mosi data: %x\n",SD_mosi_data_read());
		printf("Respuesta comando 0: %x\n",miso);
		if(miso == 0X01){

		//CMD8: comando para probar si hay comunicación con la tarjeta
			SD_write_16(0X4800);//01001000 00000000
			SD_write_16(0X0001);//00000000 00000001
			SD_write_16(0XAA0F);//10101010 00001111
			busy_wait(0.001);
			miso = SD_miso_data_read();
			printf("Respuesta comando 8: %x\n",miso);

			if(miso == 0X1AA){

			//ACMD41:es un comando de sincronización especial utilizado para negociar el rango de voltaje de operación y para sondear la tarjeta hasta que esté fuera de su secuencia de encendido
				SD_write_16(0X6900);//01101001 00000000
				SD_write_16(0X0000);//00000000 00000000
				SD_write_16(0X00FF);//00000000 11111111
				miso = SD_miso_data_read();
				if(miso == 0X00){
					for(int i=0;i<1000;i++){
						//Se repite varias veces el comando ACMD41
						SD_write_16(0X6900);//01101001 00000000
						SD_write_16(0X0000);//00000000 00000000
						SD_write_16(0X00FF);//00000000 11111111
						miso = SD_miso_data_read();
						if(miso == 1){break;}
					}
				}else if(miso == 0X01){
					//CMD58: Lee el registro OCR
					SD_write_16(0X7A00);//01111010 00000000
					SD_write_16(0X0000);//00000000 00000000
					SD_write_16(0X00FD);//00000000 11111101
					miso = SD_miso_data_read();
					if(miso == 1){printf("Block adress");}
					else if(miso == 0){
						printf("Byte adress");

						//CMD16: Fuerza el tamaño del bloque a 512 bytes
						SD_write_16(0X5000);//01010000 00000000
						SD_write_16(0X0002);//00000000 00000000
						SD_write_16(0X0015);//00000000 00010101
					}
				}

			}
		}else{printf("Unknow card")}

printf("Inicialización terminada.\n" );
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
	puts("display                         - display test");
	puts("led                             - led test");
	puts("A                             - SD");
}

static void reboot(void)
{
	asm("call r0");
}

static void display_test(void)
{
	int i;
	printf("display_test...\n");
	for(i=0; i<6; i++) {
		display_sel_write(i);
		display_value_write(i);
		display_write_write(1);
	}
}

static void led_test(void)
{
	int i;
	printf("led_test...\n");
	for(i=0; i<32; i++) {
		leds_out_write(i);
		busy_wait(1);
	}
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
	else if(strcmp(token, "display") == 0)
		display_test();
	else if(strcmp(token, "led") == 0)
		led_test();
  else if(strcmp(token, "A") == 0)
		sd_do();
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
