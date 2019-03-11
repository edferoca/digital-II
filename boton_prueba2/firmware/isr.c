#include <generated/csr.h>
#include <irq.h>
#include <uart.h>
#include <stdio.h>

extern void periodic_isr(void);
void botton_isr(void);
void isr(void);
void isr(void)
{
	unsigned int irqs;

	irqs = irq_pending() & irq_getmask();

	if(irqs & (1 << UART_INTERRUPT)){
		uart_isr();
	} if(irqs & (1 << 4)){
	 botton_isr(void)

 }

}
void botton_isr(void){
	// borrador por soft la interrupción del periferico
  buttoniner_ev_pending_write (1);
	led_out_write(~led_out_read());
  buttoniner_ev_enable_write(1);

}
