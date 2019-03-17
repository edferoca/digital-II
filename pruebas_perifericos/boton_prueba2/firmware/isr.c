
#include <irq.h>
#include <uart.h>
#include <generated/csr.h>


#include <stdio.h>
#include <stdlib.h>
#include <string.h>



extern void periodic_isr(void);
void botton_isr(void);
void isr(void);
void isr(void)
{
	unsigned int irqs;

	irqs = irq_pending() & irq_getmask();

	if(irqs & (1 << UART_INTERRUPT))
		uart_isr();
	if(irqs & (1 << 4))
	 botton_isr();


}
void botton_isr(void){
	// borrador por soft la interrupción del periferico
	unsigned int pednig = buttoniner_ev_pending_read();
	printf("%X\n", pednig);

	//00000001
		if (pednig & 1) {
			printf("a\n");
			leds_out_write(0x01);
		}
		//00000010
		if (pednig & 1 << 0x1) {
			printf("b\n");
			leds_out_write(0x02);
		}
		//00000100
		if (pednig & 1 << 2) {
			printf("c\n");
			leds_out_write(0x04);
		}
		//00001000
		if (pednig & 1 << 0x3) {
			printf("d\n");
			leds_out_write(0x08);
		}
		//00010000
		if (pednig & 1 << 0x04) {
			printf("e\n");
			leds_out_write(0x10);
		}
		//00100000
		if (pednig & 1 << 0x05) {
			printf("f\n");
			leds_out_write(0x20);
		}
		//0100000
		if (pednig & 1 << 0x06) {
			leds_out_write(0x40);
			printf("g\n");
		}
		//0100000
		if (pednig & 1 << 0x07) {
			leds_out_write(0x80);
			printf("h\n");
		}

//	leds_out_write(~leds_out_read());
	buttoniner_ev_pending_write (0xff);
  buttoniner_ev_enable_write(0xff);

}
