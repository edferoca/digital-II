
#include <irq.h>
#include <uart.h>
#include <generated/csr.h>

#include "bloques.h"
#include "LCD.h"
#include "juego.h"

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

	//00000001
		if (pednig & 1) {
			leds_out_write(0x01);
		}
		//00000010
		if (pednig & 1 << 0x1) {
			leds_out_write(0x02);
		}
		//00000100
		if (pednig & 1 << 2) {
			leds_out_write(0x04);
		}
		//00001000
		if (pednig & 1 << 0x3) {
			leds_out_write(0x08);
		}
		//00010000
		if (pednig & 1 << 0x04) {
			leds_out_write(0x10);
		}
		//00100000
		if (pednig & 1 << 0x05) {
			leds_out_write(0x20);
		}
		//0100000
		if (pednig & 1 << 0x06) {
			leds_out_write(0x40);
		}
		//0100000
		if (pednig & 1 << 0x07) {
			subir(0,0X8A,0x2A,0x2F,0x0000,0xFFFF);
			subir(0,0X8A,0x6f,0x74,0x0000,0xFFFF);
			subir(0,0X8A,0x43,0x45,0x7BEF,0xFFE0);
			subir(0,0X8A,0x59,0x5b,0x7BEF,0xFFE0);
			//dib_cua(Xmin,Ymin,Xmax,Ymax,color);
		}
  botones_ev_pending_write (0xff);
  botones_ev_enable_write(0xff);

}
