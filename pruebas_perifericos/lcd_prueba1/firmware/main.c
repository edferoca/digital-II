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

unsigned OFFLINE      = (1 << 0);
unsigned CS_POLARITY  = (1 << 3);
unsigned CLK_POLARITY = (1 << 4);
unsigned CLK_PHASE    = (1 << 5);
unsigned LSB_FIRST    = (1 << 6);
unsigned HALF_DUPLEX  = (1 << 7);
unsigned DIV_READ     = (1 << 16);
unsigned DIV_WRITE    = (1 << 24);
static void lcd_config(void)
{
	uint32_t config = 0*OFFLINE;
	config |= 0*CS_POLARITY | 0*CLK_POLARITY | 0*CLK_PHASE;
	config |= 0*LSB_FIRST | 0*HALF_DUPLEX;
	config |= 16*DIV_READ | 16*DIV_WRITE;
	//printf("val %x \n", config);
	lcd_config_write(0x10300000);
}
static void lcd_write( unsigned int addr, unsigned int info)
{
		lcd_config();
		unsigned long int  val1 = ((0x70 & 0xff) << 24) | ((addr & 0xffff) << 8); //Set IR
		unsigned long int  val2 = ((0x72 & 0xff) << 24) | ((info & 0xffff) << 8); //Write IR
		lcd_xfer_write(1 | 24*WRITE_LENGTH); //180001
		lcd_mosi_data_write(val1 << (32-24));
		lcd_mosi_data_write(val2 << (32-24));
		lcd_start_write(1);
		while (lcd_pending_read() & 0x1){
		};
}
static void lcd_inic(void)
{
	lcd_config();
	//power_control r:10h-11h-12h-13h-14h
	//limpia los registros
	printf(" limpia los registros\n");
	lcd_write(0x0010,0x0000);
	lcd_write(0x0011,0x0000);
	lcd_write(0x0012,0x0000);
	lcd_write(0x0013,0x0000);
	lcd_write(0x0014,0x0000);
	printf(" limpia los registros\n");
	busy_wait(40); //microseg
	//secuencia en power_control
	printf(" secuencia en power_control\n");
	lcd_write(0x0011,0x0018); //r11h
	lcd_write(0x0012,0x6121); //r12h
	lcd_write(0x0013,0x006f); //r13h
	lcd_write(0x0014,0x495f);//r14h
	lcd_write(0x0010,0x0800);	//r10h
	busy_wait(10);//microseg
	lcd_write(0x0011,0x103B); //r11h
	printf(" secuencia en power_control\n");
	//
	busy_wait(50);
	//Driver Output Control
	lcd_write(0x0001,0x011C); //r01h ss=1 nl=[1000] lo demas si es estandar como esta en el manual
	//LCD_AC_DRIVING_CTRL
	lcd_write(0x0002,0x0100); //r01h inv [01]-0 ->Line Inversion – 1 field interlace
  //ENTRY_MODE
	lcd_write(0x0003,0x1038);//r02h
	//DISP_CTRL1
	lcd_write(0x0007,0x0000);//r07h
	//BLANK_PERIOD_CTRL1
	lcd_write(0x0008,0x0808);//r08h
	//FRAME_CYCLE_CTRL
	lcd_write(0x000B,0x1100);//r0bh
	//INTERFACE_CTRL
	lcd_write(0x000C,0x0000);
	//OSC_CTRL
	lcd_write(0x000F,0x0D01);
	//VCI_RECYCLING
	lcd_write(0x0015,0x0020);
	//RAM_ADDR_SET1
	lcd_write(0x0020,0x0000);
	//RAM_ADDR_SET2
	lcd_write(0x0021,0x0000);
	printf(" config gram area\n");

	//Set GRAM area------------------------------------
	//es como una memoria interna dodne yo puedo dibujar
	//GATE_SCAN_CTRL
	lcd_write(0x0030,0x0003);
	//VERTICAL_SCROLL_CTRL1
	lcd_write(0x0031,0x00DB);
	//VERTICAL_SCROLL_CTRL2
	lcd_write(0x0032,0x0000);
	//VERTICAL_SCROLL_CTRL3
	lcd_write(0x0033,0x0000);
	//PARTIAL_DRIVING_POS1
	lcd_write(0x0034,0x00DB);
	//PARTIAL_DRIVING_POS2
	lcd_write(0x0035,0x0000);


	//HORIZONTAL_WINDOW_ADDR1
	lcd_write(0x0036,0x00AF);
	//HORIZONTAL_WINDOW_ADDR2
	lcd_write(0x0037,0x0000);
	//VERTICAL_WINDOW_ADDR1
	lcd_write(0x0038,0x00DB);
	//VERTICAL_WINDOW_ADDR2
	lcd_write(0x0039,0x0000);

	// Set GAMMA curve-------------------------------------
	//GAMMA_CTRL1
	lcd_write(0x0050,0x0000);
	//GAMMA_CTRL2
	lcd_write(0x0051,0x0808);
	//GAMMA_CTRL3
	lcd_write(0x0052,0x080A);
	//GAMMA_CTRL4
	lcd_write(0x0053,0x000A);
	//GAMMA_CTRL5
	lcd_write(0x0054,0x0A08);
	//GAMMA_CTRL6
	lcd_write(0x0055,0x0808);
	//GAMMA_CTRL7
	lcd_write(0x0056,0x0000);
	//GAMMA_CTRL8
	lcd_write(0x0057,0x0A00);
	//GAMMA_CTRL9
	lcd_write(0x0058,0x0710);
	//GAMMA_CTRL10
	lcd_write(0x0059,0x0710);

	 //-----------------------------------
	//DISP_CTRL1
	lcd_write(0x0007,0x0012); //r07h
	//delay(50);
	//DISP_CTRL1
	lcd_write(0x0007,0x0017); //r07h
	// Turn on backlight
	 //setBacklight(true);
	 //setOrientation(0);

	 // Initialize variables
	 //setBackgroundColor( COLOR_BLACK );
	//ENTRY MODE
	lcd_write(0x0003,0x1018); //r03h -ver documentaciosn

	//HORIZONTAL_WINDOW_ADDR1
	lcd_write(0x0036,0x00AF);
	//HORIZONTAL_WINDOW_ADDR2
	lcd_write(0x0037,0x0000);
	//VERTICAL_WINDOW_ADDR1
	lcd_write(0x0038,0x00DB);
	//VERTICAL_WINDOW_ADDR2
	lcd_write(0x0039,0x0000);
	//RAM_ADDR_SET1
	lcd_write(0x0020,0x0000);
	//RAM_ADDR_SET2
	lcd_write(0x0021,0x0000);

	 //Inicio de Transferencia de datos
	printf(" Inicio de Transferencia de datos\n");
	 //WRITE DATA TO GRAM
	lcd_write(0x0022,0xffa0);

	 //_____Data[103] = {1'b0,16'h0022};
}


/*
static unsigned char lcd_read(unsigned char addr)
{
		lcdconfig();
		unsigned long int val = ((0x0B & 0xff) << 16) | ((addr & 0xff) << 8);
		lcd_xfer_write(1 | 16*WRITE_LENGTH | 8*READ_LENGTH);
		lcd_mosi_data_write(val << (32-24));
		lcd_start_write(1);
		//printf("miso: %x\n",adxl362_miso_data_read());
		while (lcd_pending_read() & 0x1){
		};
		return lcd_miso_data_read() ;
}
*/
static void pantalla(void)
{

	lcd_config();
	lcd_inic();
	int a=1;
	lcd_write(0x0020,0x0001);
	lcd_write(0x0021,0x0000);
	lcd_write(0x0022,0xffa0);
	lcd_write(0x0020,0x0002);
	lcd_write(0x0021,0x0000);
	lcd_write(0x0022,0xa0a0);
	lcd_write(0x0020,0x00a0);
	lcd_write(0x0021,0x0000);
	lcd_write(0x0022,0xffff);
	printf(" test\n");
	while(a){
	//lcd_write(0x70,0x0022); //Start Byte Direccion
	lcd_write(0xaaaa,0xffff);

	}
	/*
	int i=1;
  for ( i ; i < 100000000; i++) {
	lcd_write(0x0020,0x0000);
	//RAM_ADDR_SET2
	lcd_write(0x0021,0x0000);

	 //Inicio de Transferencia de datos
	printf(" Inicio de Transferencia de datos\n");
	 //WRITE DATA TO GRAM
	lcd_write(0x0022,0xffa0);

	}
	*/
	//printf("reg : %d \n",acel_read(0x08));
	printf("acelerometro test\n");
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
