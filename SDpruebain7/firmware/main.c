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


static void busy_wait(unsigned int ms)
{
	timer0_en_write(0);
	timer0_reload_write(0);
	timer0_load_write(SYSTEM_CLOCK_FREQUENCY/1000*ms);
	timer0_en_write(1);
	timer0_update_value_write(1);
	while(timer0_value_read()) timer0_update_value_write(1);
}

static void SD_configure(void) {
  unsigned config = 0*OFFLINE;
  config |= 0*CS_POLARITY | 0*CLK_POLARITY | 0*CLK_PHASE;
  config |= 0*LSB_FIRST | 0*HALF_DUPLEX;
	config |= 300*DIV_READ | 300*DIV_WRITE;
  //config |= 248*DIV_READ | 248*DIV_WRITE;
	// DIV_READ=DIV_WRITE = clk/frecuenciaDeseada - 2
	// = 100Mhz/400Khz = 248

  SD_config_write(config);
	SD_xfer_write(1 | 24*WRITE_LENGTH);
  printf("Configuracion finalizada: %x\n",config);
}
static void SD_write_8_pending(char value){

	SD_mosi_data_write(value << 24) ;
	SD_start_write(1);
	while (SD_pending_read() & 0x1){};
}

static void SD_write_8_active(char value){

	SD_mosi_data_write(value << 24) ;
	SD_start_write(1);
	while (SD_active_read() & 0x1){};
}

static void SD_write_16_pending(unsigned short int value){

	SD_mosi_data_write(value << 16) ;
	SD_start_write(1);
	while (SD_pending_read() & 0x1){};
}

static void SD_write_24(unsigned long int value){

	SD_mosi_data_write(value << 8) ;
	SD_start_write(1);
}

static void SD_write_48(unsigned long int value1, unsigned long int value2){

	SD_write_24(value1);
	while (SD_pending_read() & 0x1){};
	SD_write_24(value2);
	while (SD_active_read() & 0x1){};

}
/*
static void delay(int del){
	int i=0;
	while (i < del){i++;}
}
*/

static void sd_do (void){

	//Se debe esperar por lo menos 1ms
	printf("Inicializando SD...\n");
	SD_configure(); //configurando el spi de la sd
	//Se deben esperar 71 ciclos de reloj con el cs en alto

	//Primer lectura del miso justo antes de enviar cualquier comando (debe ser "0")
	unsigned long int Miso = SD_miso_data_read();
  printf("Primer Miso: %x\n",Miso);

	//Mandando el comando cero con basura varias veces hasta que la sd responda

	while (Miso == 0XFF){

		SD_write_48(0XFFFFFF, 0XFFFFFF);
	  SD_write_48(0X400000, 0x000095);
		SD_write_16_pending(0xFFFF); //Espera 16 ciclos de reloj para leer la respuesta (8 para que la tarjeta empiece a enviarla y 8 para que termine)
		/*
		Comando 0 (CMD0):
	- Dec: 64 00 00 00 00 149
	- Hexa: 40 00 00 00 00 95
	- Bin: 0100.0000 0000.0000, 0000.0000 0000.0000, 0000.0000 1001.0101
	- Respuesta:R1: 0000.0001
		Reinicia el software e incia en modo SPI
		*/

		//Respuesta al comando 0
		Miso = SD_miso_data_read() && 0xFF;
		i++;
	}

	printf("Respuesta comando 0: %x\n",Miso);

	SD_write_48(0XFFFFFF, 0XFFFFFF);
	SD_write_48(0X480000, 0x01AA0F);
	SD_write_16_pending(0xFFFF);
	/*
	Comando 8 (CMD8):
	- Dec: 72 00 00 01 170 15
	- Hexa: 48 00 00 01 AA 0F
	- Bin: 0100.1000 0000.0000, 0000.0000 0000.0001, 1010.1010 0000.1111
	- Respuesta:R7: XX... 1 AA, XX... 0001 1010.1010
	Probando que la tarjeta responde correctamente
	*/
	Miso = SD_miso_data_read() && 0XFFF;
	printf("Respuesta comando 8: %x\n",Miso);

	SD_write_48(0XFFFFFF, 0XFFFFFF);
	SD_write_48(0X7A0000, 0x00007A);
	SD_write_16_pending(0xFFFF);
	/*
	Comando 58 (CMD58):
	- Dec: 122 00 00 00 00 122
	- Hexa: 7A 00 00 00 00 7A
	- Bin: 0111.1010 0000.0000, 0000.0000 0000.0000, 0000.0000 0111.0101
	Lee el bit OCR para verificar el rango de trabajo de voltaje de la tarjeta
	*/
	Miso = SD_miso_data_read();
	printf("Respuesta comando 58: %x\n",Miso);

	//Se prueba varias veces la Inicialización para este comando
	for (int i = 0; i < 100; i++) {
		SD_write_48(0XFFFFFF, 0XFFFFFF);
		SD_write_48(0X690000, 0x0000FF);
		SD_write_16_pending(0xFFFF);
		/*
		Comando 41 (ACMD41):
		- Dec: 105 00 00 00 00 255
		- Hexa: 69 00 00 00 00 FF
		- Bin: 0110.1001 0000.0000, 0000.0000 0000.0000, 0000.0000 1111.1111
		- Respuesta:R1: 0000.0000
		Incia el proceso de inicialización de la tarjeta
		*/
		Miso = SD_miso_data_read() && 0XFF;

		if (Miso == 0X00) {
			break;
		}
	}
	printf("Respuesta comando 58: %x\n",Miso);

	//Si el comado 41 no funciona se prueba con el comando 1
	if (Miso == 0x01) {

		for (int = 0; i < 100; i++) {

			SD_write_48(0XFFFFFF, 0XFFFFFF);
			SD_write_48(0X410000, 0x0000FF);
			SD_write_16_pending(0xFFFF);
			/*
			Comando 1 (CMD1):
			- Dec: 65 00 00 00 00 255
			- Hexa: 41 00 00 00 00 FF
			- Bin: 0100.0001 0000.0000, 0000.0000 0000.0000, 0000.0000 1111.1111
			- Respuesta:R1: 0000.0001
			Incia el proceso de inicialización de la tarjeta
			*/
			Miso = SD_miso_data_read() && 0XFF;

			if (Miso == 0X00) {
				break;
			}
		}
		printf("Respuesta comando 1: %x\n",Miso);
	}


	SD_write_48(0X500000, 0x0008FF);
	SD_write_48(0XFFFFFF, 0XFFFFFF);
	/*
	Comando 16 (CMD16):
	- Dec: 80 00 00 00 08 255
	- Hexa: 50 00 00 00 08 FF
	- Bin: 0101.0000 0000.0000, 0000.0000 0000.0000, 0000.1000 1111.1111
	Fuerza el tamaño del bloque a 512 bytes para trabajar con archivos FAT
	*/
	Miso = SD_miso_data_read();
	printf("Respuesta comando 16: %x\n",Miso);

	SD_write_48(0X500000, 0x0008FF);
	SD_write_48(0XFFFFFF, 0XFFFFFF);
	/*
	Comando 17 (CMD17):
	- Dec: 81 00 00 00 08 255
	- Hexa: 51 00 00 00 08 FF
	- Bin: 0101.0001 0000.0000, 0000.0000 0000.0000, 0000.1000 1111.1111
	- Respuesta:
	*/
	Miso = SD_miso_data_read();
	printf("Respuesta comando 17: %x\n",Miso);

}

static void sd_do2 (void){
	printf("Inicializando SD...\n");
	SD_configure();
	leds_out_write(0);//AGREGADO
	//SD en estado IDLE(CMD0)
	//HEX: 40 00 00 00 00   95
	//     sb/cmd/argument/CRC7|1
	//DEC: 64 00 00 00 00   149
	//BIN: 01000000 000..*32 10010101
//		printf("2. %x\n",SD_miso_data_read() );
	 unsigned long int Miso = SD_miso_data_read();
   printf("Miso: %x\n",Miso);


	 int i = 0;
	 while (i <= 10){
    //delay(10);
	  SD_write_48(0X400000, 0x000095); // cmd 0
		//if (Miso1 == 0x01) {
		//	printf("Miso: %x\n",Miso1);
		//	break;
		//}else{Miso1 = SD_miso_data_read();}
		//SD_xfer_write(1 | 24*READ_LENGTH);
		unsigned long int Miso1 = SD_miso_data_read();
		//unsigned long int Miso2 = SD_miso_data_read();
		//unsigned long int Miso3 = SD_miso_data_read();
		SD_write_48(0XFFFFFF, 0XFFFFFF); // cmd 0
		unsigned long int Miso2 = SD_miso_data_read();
		SD_write_48(0X400000, 0x000095); // cmd 0
		unsigned long int Miso3 = SD_miso_data_read();
		//SD_write_48(0XFFFFFF, 0XFFFFFF); // cmd 0
    //delay(10);
		//unsigned long int Mosi1 = SD_mosi_data_read();
		//unsigned long int Miso1 = SD_miso_data_read();
		printf("Miso1: %x, Miso2: %x, Miso3: %x\n", Miso1, Miso2, Miso3);

		//SD_write_8_pending(0x40);
		//unsigned long int Mosi1 = SD_mosi_data_read();
		//SD_write_8_pending(0x00);
		//unsigned long int Mosi1 = SD_mosi_data_read();
		//SD_write_8_pending(0x00);
		//unsigned long int Mosi1 = SD_mosi_data_read();
		//SD_write_8_pending(0x00);
		//unsigned long int Mosi1 = SD_mosi_data_read();
		//SD_write_8_pending(0x00);
		//unsigned long int Mosi1 = SD_mosi_data_read();
		//SD_write_8_active(0x95);
		//unsigned long int Mosi1 = SD_mosi_data_read();
		//SD_write_48(0XFFFFFF, 0XFFFFFF); // cmd 0
		//SD_write_48(0X400000, 0x000095); // cmd 0

		//printf("Mosi1: %x\n" Mosi1);

		//unsigned long int Miso5 = SD_miso_data_read();
		//SD_write_48(255,255,255,255,255,255);
		//SD_xfer_write(1);
		//printf("Miso:  %x\n",SD_miso_data_read());
		//printf("Miso1: %x\n", Miso1);
		//printf("Miso2: %x\n", Miso2);
		//printf("Miso3: %x\n", Miso3);
		//printf("Miso4: %x\n", Miso4);
		//printf("Miso5: %x\n", Miso5);
		//i++;
	 }

	 /*
	 i=0;
	 while (i <= 10){
	 	printf("Miso:  %x\n",SD_miso_data_read());
		i++;
	 }
	 */

}

/*
static void sd_do1 (void){
	printf("Inicializando SD...\n");
	SD_configure();
	leds_out_write(0);//AGREGADO
	//SD en estado IDLE(CMD0)
	//HEX: 40 00 00 00 00   95
	//     sb/cmd/argument/CRC7|1
	//DEC: 64 00 00 00 00   149
	//BIN: 01000000 000..*32 10010101
//

}
*/

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
		busy_wait(100);
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
