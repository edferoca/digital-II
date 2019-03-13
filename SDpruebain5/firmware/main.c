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
  config |= 248*DIV_READ | 248*DIV_WRITE;//Divisior para
	//																			reloj de 5MHz(16)
	//				100M/400k = div_write + 2...248
  SD_config_write(config);
	SD_xfer_write(1 | 8*WRITE_LENGTH);
  printf("Configuracion finalizada: %x\n",config);
}
static void SD_write(unsigned char addr, unsigned int value){
	SD_configure();
	SD_xfer_write(0b1 | 32*WRITE_LENGTH);//32 de longitud
	SD_mosi_data_write(value);
	printf("Datos mosi:%x\n",SD_mosi_data_read());
	SD_start_write(1);
	printf("Escribiendo...\n");
	while (SD_active_read() & 0x1){}
}
static void SD_write_8(unsigned  int value){

	//SD_xfer_write(1 | 16*WRITE_LENGTH);
	//unsigned char val = (0b00001010 << 16) | ((0 & 0xff) << 8) | (value & 0xff);
	SD_mosi_data_write(value << 24) ;
	SD_start_write(1);
	//while (SD_active_read() & 0x1){}
	while (SD_pending_read() & 0x1);
		//break;
}
static unsigned int SD_read(unsigned char dato,unsigned char addr){
//	SD_configure();
	unsigned int val = ((dato << 16) | ((addr & 0xff) << 8));
	SD_xfer_write(1 | 0*WRITE_LENGTH | 8*READ_LENGTH);//antes 8 de lectura
	SD_mosi_data_write(val << (32-24));
	SD_start_write(1);
	while (SD_pending_read() & 0x1);
	return (SD_miso_data_read());// & 0xff
	// & 0xf0000000
}


static void sd_do (void){
	printf("Inicializando SD...\n");
	SD_configure();
	leds_out_write(0);//AGREGADO
	//SD en estado IDLE(CMD0)
	//HEX: 40 00 00 00 00   95
	//     sb/cmd/argument/CRC7|1
	//DEC: 64 00 00 00 00   149
//		printf("2. %x\n",SD_miso_data_read() );
   printf("0. %x\n",SD_miso_data_read() );
do{
		printf("4. %x\n",SD_miso_data_read() );
		leds_out_write(0);//AGREGADO
		SD_write_8(64);
		printf("5. %x\n",SD_miso_data_read() );
		SD_write_8(00);
		printf("6. %x\n",SD_miso_data_read() );
		SD_write_8(00);
		SD_write_8(00);
		SD_write_8(00);
		printf("7. %x\n",SD_miso_data_read() );
		SD_write_8(0x95);

		SD_write_8(0xFF);
		SD_write_8(0xFF);
		SD_write_8(0xFF);
		SD_write_8(0xFF);
		SD_write_8(0xFF);
		SD_write_8(0xFF);
		//SD_read(149,255);
		printf("8. %x\n",SD_miso_data_read() );
		//SD_read(255,255);//Espera
		printf("9. %x\n",SD_miso_data_read() );
		//SD_read(255,255);//Espera
		printf("%x \n",SD_miso_data_read());
	} while (SD_miso_data_read()==0xFFFF);
	leds_out_write(1);//AGREGADO
	printf("FINAL :%x\n",SD_miso_data_read() );
	//Envía condiciones de operación(CMD8)
	// HEX: 48 00 00 00 00 FF
	// DEC: 72 00 00 00 00 255
	//Dicen que el CRC7 es 0x87 en lugar de FF
	// arg: 0x00 00 01 AA ?
	leds_out_write(0);//AGREGADO
	printf("Coincide? :%x\n",SD_miso_data_read() );
	SD_write_8(72);
	printf("FF: %x\n",SD_miso_data_read() );
	SD_write_8(00);
	printf("FF: %x\n",SD_miso_data_read() );
	SD_write_8(00);
	printf("FF: %x\n",SD_miso_data_read() );
	SD_write_8(1);
	printf("FF: %x\n",SD_miso_data_read() );
	SD_write_8(170);
	printf("FF: %x\n",SD_miso_data_read() );
	SD_write_8(0x87);//0x87
	printf("CRC FF: %x\n",SD_miso_data_read() );
	SD_write_8(255);
	printf("BA: %x\n",SD_miso_data_read() );
	SD_write_8(255);
	SD_write_8(255);
	SD_write_8(255);
	SD_write_8(255);
	SD_write_8(255);
	printf("CMD8: voltage %x\n",SD_miso_data_read () << 24);
	printf("CMD8: voltage %x\n",SD_miso_data_read ()<< 24);

	//AGREGADO
	// printf("1. %x\n",SD_miso_data_read() );
	// SD_write_8(0x4000);
	// leds_out_write(0);
	// printf("2. %x\n",SD_miso_data_read() );
	// SD_write_8(0x0000);
	// printf("3. %x\n",SD_miso_data_read() );
	// SD_write_8(0x0095);
	// printf("4. %x\n",SD_miso_data_read() );
	// while (SD_miso_data_read()!=0x8000ff01) {
	// 	SD_write_8(0xFFFF);
	// 	printf("5. %x\n",SD_miso_data_read() );
	// }


	//leds_out_write(1);//AGREGADO



/*
while (SD_miso_data_read() != 80000000) {
	//Envía condiciones de operación(ACMD41)
	// HEX: 77 00 00 00 00 83(cmd55)
	// DEC: 119 00 00 00 00 131
	// posible CRC7: 65
  leds_out_write(0);//AGREGADO
	printf("Coincide? :%x\n",SD_miso_data_read() );
	SD_write_8(119);
	printf("ff:%x\n",SD_miso_data_read() );
	SD_write_8(00);
	printf("ff:%x\n",SD_miso_data_read() );
	SD_write_8(00);
	SD_write_8(00);
	SD_write_8(00);
	SD_write_8(255);
	printf("800F :%x\n",SD_miso_data_read() );
	SD_write_8(255);//Espera
	SD_write_8(255);//Espera
	printf("CMD55 :%x\n",SD_miso_data_read() );
	SD_write_8(255);//Espera
  printf("CMD0: IDLE %x\n",SD_miso_data_read() );
	//HEX: 69 00 00 00 00 FF(acmd41)
	// DEC: 105 00 00 00 00 255
	//posible CRC7: E5 si el argumento es 0 ó 77 si el argumento es
	// arg:0x 40 00 00 00

	leds_out_write(0);//AGREGADO
	SD_write_8(105);
	printf("INICIO ACMD :%x\n",SD_miso_data_read() );
	SD_write_8(0X40);
	printf("ACMD :%x\n",SD_miso_data_read() );
	SD_write_8(0);
	SD_write_8(0);
	SD_write_8(0);
	SD_write_8(255);
	printf("ACMD :%x\n",SD_miso_data_read() );
	SD_write_8(255);
	SD_write_8(255);
	SD_write_8(255);
	printf("ACMD :%x\n",SD_miso_data_read() );
}
*/
printf("4. %x\n",SD_miso_data_read() );
leds_out_write(0);//AGREGADO
SD_write_8(65);
printf("5. %x\n",SD_miso_data_read() );
SD_write_8(00);
printf("6. %x\n",SD_miso_data_read() );
SD_write_8(00);
SD_write_8(00);
SD_write_8(00);
printf("cmd1. %x\n",SD_miso_data_read() );
SD_write_8(0xff);

SD_write_8(0xFF);
SD_write_8(0xFF);
SD_write_8(0xFF);
SD_write_8(0xFF);
SD_write_8(0xFF);
SD_write_8(0xFF);
//SD_read(149,255);
printf("8. %x\n",SD_miso_data_read() );



	//La respuesta debe ser 00, si es 1 se debe reenviar
	//la orde y si es 5 se puede usar cmd1 en lugar de acmd41




//Configura longitud de o
//HEX: 50 00 00 00 08 FF (CMD16)
//DEC: 80 00 00 00 08 255
SD_write_8(80);
SD_write_8(0);
SD_write_8(0);
SD_write_8(0);
SD_write_8(8);
SD_write_8(255);
printf("DEFINIR LONGITUD. %x\n",SD_miso_data_read() );
leds_out_write(1);//AGREGADO

//LEER
//HEX: 51 00 00 00 08 FF (CMD17)
//DEC: 81 00 00 00 08 255
SD_write_8(81);
SD_write_8(0);
SD_write_8(0);
SD_write_8(0);
SD_write_8(8);
SD_write_8(255);
printf("DEFINIR LONGITUD. %x\n",SD_miso_data_read() );
leds_out_write(1);//AGREGADO
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
