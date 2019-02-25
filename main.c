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

static void lcd_config(void)
{
	lcd_xfer_write(1 | 16*WRITE_LENGTH); //180001
	lcd_config_write(0x10300000); //5000 Khz
}
static void lcd_write( unsigned char rs, unsigned int info)
{
		rs_out_write(rs);
		lcd_mosi_data_write(info<<16);
		lcd_start_write(1);
		while (lcd_active_read()){
		};
}
static void lcd_inic(void)
{
	lcd_config();
	printf("rst inicializar\n");
	rst_out_write(1);
	busy_wait(0.01);
	rst_out_write(0);
	printf("cuenta\n");
	busy_wait(0.1);
	printf("end cuent\n");
	rst_out_write(1);
	busy_wait(0.5);
	//power_control r:10h-11h-12h-13h-14h
	//limpia los registros
	printf(" limpia los registros\n");
	lcd_write(0,0x0010); //
	lcd_write(1,0x0000);
	lcd_write(0,0x0011);//
	lcd_write(1,0x0000);
	lcd_write(0,0x0012);//
	lcd_write(1,0x0000);
	lcd_write(0,0x0013);//
	lcd_write(1,0x0000);
	lcd_write(0,0x0014);//
	lcd_write(1,0x0000);
	printf(" limpia los registros\n");
	busy_wait(0.4); //microseg //40 mili
	//secuencia en power_control
	printf(" secuencia en power_control\n");
	lcd_write(0,0x0011);//
	lcd_write(1,0x0018);
	lcd_write(0,0x0012);//
	lcd_write(1,0x6121);
	lcd_write(0,0x0013);//
	lcd_write(1,0x006f);
	lcd_write(0,0x0014);//
	lcd_write(1,0x495f);
	lcd_write(0,0x0010);//
	lcd_write(1,0x0800);

	busy_wait(0.1);//microseg

	lcd_write(0,0x0011);//
	lcd_write(1,0x103B);

	printf(" secuencia en power_control\n");
	//
	busy_wait(0.5);
	//Driver Output Control
	lcd_write(0,0x0001);//
	lcd_write(1,0x011C); //r01h ss=1 nl=[1000] lo demas si es estandar como esta en el manual
	//LCD_AC_DRIVING_CTRL
	lcd_write(0,0x0002);//
	lcd_write(1,0x0100); //r01h inv [01]-0 ->Line Inversion – 1 field interlace
  //ENTRY_MODE
	lcd_write(0,0x0003);//
	lcd_write(1,0x1038);
	//DISP_CTRL1
	lcd_write(0,0x0007);//
	lcd_write(1,0x0000);
	//BLANK_PERIOD_CTRL1
	lcd_write(0,0x0008);//
	lcd_write(1,0x0808);
	//FRAME_CYCLE_CTRL
	lcd_write(0,0x000B);//
	lcd_write(1,0x1100);
	//INTERFACE_CTRL
	lcd_write(0,0x000C);//
	lcd_write(1,0x0000);
	//OSC_CTRL
	lcd_write(0,0x000F);//
	lcd_write(1,0x0D01);
	//VCI_RECYCLING
	lcd_write(0,0x0015);//
	lcd_write(1,0x0020);
	//RAM_ADDR_SET1
	lcd_write(0,0x0020);//
	lcd_write(1,0x0000);
	//RAM_ADDR_SET2
	lcd_write(0,0x0021);//
	lcd_write(1,0x0000);
	printf(" config gram area\n");

	//Set GRAM area------------------------------------
	//es como una memoria interna dodne yo puedo dibujar
	//GATE_SCAN_CTRL
	lcd_write(0,0x0030);//
	lcd_write(1,0x0000);
	//VERTICAL_SCROLL_CTRL1
	lcd_write(0,0x0031);//
	lcd_write(1,0x00DB);
	//VERTICAL_SCROLL_CTRL2
	lcd_write(0,0x0032);//
	lcd_write(1,0x0000);
	//VERTICAL_SCROLL_CTRL3
	lcd_write(0,0x0033);//
	lcd_write(1,0x0000);
	//PARTIAL_DRIVING_POS1
	lcd_write(0,0x0034);//
	lcd_write(1,0x00DB);
	//PARTIAL_DRIVING_POS2
	lcd_write(0,0x0035);//
	lcd_write(1,0x0000);


	//HORIZONTAL_WINDOW_ADDR1
	lcd_write(0,0x0036);//
	lcd_write(1,0x00AF);
	//HORIZONTAL_WINDOW_ADDR2
	lcd_write(0,0x0037);//
	lcd_write(1,0x0000);
	//VERTICAL_WINDOW_ADDR1
	lcd_write(0,0x0038);//
	lcd_write(1,0x00DB);
	//VERTICAL_WINDOW_ADDR2
	lcd_write(0,0x0039);//
	lcd_write(1,0x0000);

	// Set GAMMA curve-------------------------------------
	//GAMMA_CTRL1
	lcd_write(0,0x0050);//
	lcd_write(1,0x0000);
	//GAMMA_CTRL2
	lcd_write(0,0x0051);//
	lcd_write(1,0x0808);
	//GAMMA_CTRL3
	lcd_write(0,0x0052);//
	lcd_write(1,0x080A);
	//GAMMA_CTRL4
	lcd_write(0,0x0053);//
	lcd_write(1,0x000A);
	//GAMMA_CTRL5
	lcd_write(0,0x0054);//
	lcd_write(1,0x0A08);
	//GAMMA_CTRL6
	lcd_write(0,0x0055);//
	lcd_write(1,0x0808);
	//GAMMA_CTRL7
	lcd_write(0,0x0056);//
	lcd_write(1,0x0000);
	//GAMMA_CTRL8
	lcd_write(0,0x0057);//
	lcd_write(1,0x0A00);
	//GAMMA_CTRL9
	lcd_write(0,0x0058);//
	lcd_write(1,0x0710);
	//GAMMA_CTRL10
	lcd_write(0,0x0059);//
	lcd_write(1,0x0710);

	 //-----------------------------------
	//DISP_CTRL1
	lcd_write(0,0x0007);//
	lcd_write(1,0x0012);
	busy_wait(0.5);
	//DISP_CTRL1
	lcd_write(0,0x0007);//
	lcd_write(1,0x1017);
	// Turn on backlight
	 //setBacklight(true);
	 //setOrientation(0);

	 // Initialize variables
	 //setBackgroundColor( COLOR_BLACK );
	//ENTRY MODE
	lcd_write(0,0x0003);//
	lcd_write(1,0x1018); //r03h -ver documentaciosn
	//HORIZONTAL_WINDOW_ADDR1
	lcd_write(0,0x0036);//
	lcd_write(1,0x00AF); //
	//HORIZONTAL_WINDOW_ADDR2
	lcd_write(0,0x0037);//
	lcd_write(1,0x0000); //
	//VERTICAL_WINDOW_ADDR1
	lcd_write(0,0x0038);//
	lcd_write(1,0x00DB); //
	//VERTICAL_WINDOW_ADDR2
	lcd_write(0,0x0039);//
	lcd_write(1,0x0000); //
	//RAM_ADDR_SET1
	lcd_write(0,0x0020);//
	lcd_write(1,0x0000); //
	//RAM_ADDR_SET2
	lcd_write(0,0x0021);//
	lcd_write(1,0x0000); //

	 //Inicio de Transferencia de datos
	printf(" Inicio de Transferencia de datos\n");
	 //WRITE DATA TO GRAM
	 lcd_write(0,0x0022);//
	 lcd_write(1,0x8080); //


	 //_____Data[103] = {1'b0,16'h0022};
}


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

		if (buttons_in_read() & 0x2) {
			dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);
			Xmin= Xmin - 0x10;
			Xmax= Xmax - 0x10;
			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
		} else if (buttons_in_read() & 0x1) {
			dib_cua(Xmin,Ymin,Xmax,Ymax,0x001f);
			Ymin= Ymin + 0x10;
			Ymax= Ymax + 0x10;
			dib_cua(Xmin,Ymin,Xmax,Ymax,color);
		}
	}
}


static void pantalla(void)
{
	lcd_config();
	int i=0;
	lcd_inic();
	/*
	while(i<9680){
		lcd_write(1,0xf800);//rojo
		i++;
	}
	i=0;
	while(i<9680){
		lcd_write(1,0x001f);//azul //
		i++;
	}
	*/
	i=0;
	while(i<56360){
		lcd_write(1,0x001f);// amarillo
		i++;
	}
	//dib_cua(0X0070,0x0080,0x00AB,0x00BB, 0X0000);

	moverse(0X0070,0x0080,0x00AB,0x00BB, 0X0000);

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
