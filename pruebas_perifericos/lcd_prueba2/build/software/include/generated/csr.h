#ifndef __GENERATED_CSR_H
#define __GENERATED_CSR_H
#include <stdint.h>
#ifdef CSR_ACCESSORS_DEFINED
extern void csr_writeb(uint8_t value, uint32_t addr);
extern uint8_t csr_readb(uint32_t addr);
extern void csr_writew(uint16_t value, uint32_t addr);
extern uint16_t csr_readw(uint32_t addr);
extern void csr_writel(uint32_t value, uint32_t addr);
extern uint32_t csr_readl(uint32_t addr);
#else /* ! CSR_ACCESSORS_DEFINED */
#include <hw/common.h>
#endif /* ! CSR_ACCESSORS_DEFINED */

/* buttons */
#define CSR_BUTTONS_BASE 0xe0005800
#define CSR_BUTTONS_IN_ADDR 0xe0005800
#define CSR_BUTTONS_IN_SIZE 1
static inline unsigned char buttons_in_read(void) {
	unsigned char r = csr_readl(0xe0005800);
	return r;
}

/* ctrl */
#define CSR_CTRL_BASE 0xe0000000
#define CSR_CTRL_RESET_ADDR 0xe0000000
#define CSR_CTRL_RESET_SIZE 1
static inline unsigned char ctrl_reset_read(void) {
	unsigned char r = csr_readl(0xe0000000);
	return r;
}
static inline void ctrl_reset_write(unsigned char value) {
	csr_writel(value, 0xe0000000);
}
#define CSR_CTRL_SCRATCH_ADDR 0xe0000004
#define CSR_CTRL_SCRATCH_SIZE 4
static inline unsigned int ctrl_scratch_read(void) {
	unsigned int r = csr_readl(0xe0000004);
	r <<= 8;
	r |= csr_readl(0xe0000008);
	r <<= 8;
	r |= csr_readl(0xe000000c);
	r <<= 8;
	r |= csr_readl(0xe0000010);
	return r;
}
static inline void ctrl_scratch_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0000004);
	csr_writel(value >> 16, 0xe0000008);
	csr_writel(value >> 8, 0xe000000c);
	csr_writel(value, 0xe0000010);
}
#define CSR_CTRL_BUS_ERRORS_ADDR 0xe0000014
#define CSR_CTRL_BUS_ERRORS_SIZE 4
static inline unsigned int ctrl_bus_errors_read(void) {
	unsigned int r = csr_readl(0xe0000014);
	r <<= 8;
	r |= csr_readl(0xe0000018);
	r <<= 8;
	r |= csr_readl(0xe000001c);
	r <<= 8;
	r |= csr_readl(0xe0000020);
	return r;
}

/* display */
#define CSR_DISPLAY_BASE 0xe0006000
#define CSR_DISPLAY_SEL_ADDR 0xe0006000
#define CSR_DISPLAY_SEL_SIZE 1
static inline unsigned char display_sel_read(void) {
	unsigned char r = csr_readl(0xe0006000);
	return r;
}
static inline void display_sel_write(unsigned char value) {
	csr_writel(value, 0xe0006000);
}
#define CSR_DISPLAY_VALUE_ADDR 0xe0006004
#define CSR_DISPLAY_VALUE_SIZE 1
static inline unsigned char display_value_read(void) {
	unsigned char r = csr_readl(0xe0006004);
	return r;
}
static inline void display_value_write(unsigned char value) {
	csr_writel(value, 0xe0006004);
}
#define CSR_DISPLAY_WRITE_ADDR 0xe0006008
#define CSR_DISPLAY_WRITE_SIZE 1
static inline unsigned char display_write_read(void) {
	unsigned char r = csr_readl(0xe0006008);
	return r;
}
static inline void display_write_write(unsigned char value) {
	csr_writel(value, 0xe0006008);
}

/* dna */
#define CSR_DNA_BASE 0xe0004000
#define CSR_DNA_ID_ADDR 0xe0004000
#define CSR_DNA_ID_SIZE 8
static inline unsigned long long int dna_id_read(void) {
	unsigned long long int r = csr_readl(0xe0004000);
	r <<= 8;
	r |= csr_readl(0xe0004004);
	r <<= 8;
	r |= csr_readl(0xe0004008);
	r <<= 8;
	r |= csr_readl(0xe000400c);
	r <<= 8;
	r |= csr_readl(0xe0004010);
	r <<= 8;
	r |= csr_readl(0xe0004014);
	r <<= 8;
	r |= csr_readl(0xe0004018);
	r <<= 8;
	r |= csr_readl(0xe000401c);
	return r;
}

/* lcd */
#define CSR_LCD_BASE 0xe0007000
#define CSR_LCD_CONFIG_ADDR 0xe0007000
#define CSR_LCD_CONFIG_SIZE 4
static inline unsigned int lcd_config_read(void) {
	unsigned int r = csr_readl(0xe0007000);
	r <<= 8;
	r |= csr_readl(0xe0007004);
	r <<= 8;
	r |= csr_readl(0xe0007008);
	r <<= 8;
	r |= csr_readl(0xe000700c);
	return r;
}
static inline void lcd_config_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0007000);
	csr_writel(value >> 16, 0xe0007004);
	csr_writel(value >> 8, 0xe0007008);
	csr_writel(value, 0xe000700c);
}
#define CSR_LCD_XFER_ADDR 0xe0007010
#define CSR_LCD_XFER_SIZE 4
static inline unsigned int lcd_xfer_read(void) {
	unsigned int r = csr_readl(0xe0007010);
	r <<= 8;
	r |= csr_readl(0xe0007014);
	r <<= 8;
	r |= csr_readl(0xe0007018);
	r <<= 8;
	r |= csr_readl(0xe000701c);
	return r;
}
static inline void lcd_xfer_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0007010);
	csr_writel(value >> 16, 0xe0007014);
	csr_writel(value >> 8, 0xe0007018);
	csr_writel(value, 0xe000701c);
}
#define CSR_LCD_START_ADDR 0xe0007020
#define CSR_LCD_START_SIZE 1
static inline unsigned char lcd_start_read(void) {
	unsigned char r = csr_readl(0xe0007020);
	return r;
}
static inline void lcd_start_write(unsigned char value) {
	csr_writel(value, 0xe0007020);
}
#define CSR_LCD_ACTIVE_ADDR 0xe0007024
#define CSR_LCD_ACTIVE_SIZE 1
static inline unsigned char lcd_active_read(void) {
	unsigned char r = csr_readl(0xe0007024);
	return r;
}
#define CSR_LCD_PENDING_ADDR 0xe0007028
#define CSR_LCD_PENDING_SIZE 1
static inline unsigned char lcd_pending_read(void) {
	unsigned char r = csr_readl(0xe0007028);
	return r;
}
#define CSR_LCD_MOSI_DATA_ADDR 0xe000702c
#define CSR_LCD_MOSI_DATA_SIZE 4
static inline unsigned int lcd_mosi_data_read(void) {
	unsigned int r = csr_readl(0xe000702c);
	r <<= 8;
	r |= csr_readl(0xe0007030);
	r <<= 8;
	r |= csr_readl(0xe0007034);
	r <<= 8;
	r |= csr_readl(0xe0007038);
	return r;
}
static inline void lcd_mosi_data_write(unsigned int value) {
	csr_writel(value >> 24, 0xe000702c);
	csr_writel(value >> 16, 0xe0007030);
	csr_writel(value >> 8, 0xe0007034);
	csr_writel(value, 0xe0007038);
}
#define CSR_LCD_MISO_DATA_ADDR 0xe000703c
#define CSR_LCD_MISO_DATA_SIZE 4
static inline unsigned int lcd_miso_data_read(void) {
	unsigned int r = csr_readl(0xe000703c);
	r <<= 8;
	r |= csr_readl(0xe0007040);
	r <<= 8;
	r |= csr_readl(0xe0007044);
	r <<= 8;
	r |= csr_readl(0xe0007048);
	return r;
}

/* leds */
#define CSR_LEDS_BASE 0xe0004800
#define CSR_LEDS_OUT_ADDR 0xe0004800
#define CSR_LEDS_OUT_SIZE 2
static inline unsigned short int leds_out_read(void) {
	unsigned short int r = csr_readl(0xe0004800);
	r <<= 8;
	r |= csr_readl(0xe0004804);
	return r;
}
static inline void leds_out_write(unsigned short int value) {
	csr_writel(value >> 8, 0xe0004800);
	csr_writel(value, 0xe0004804);
}

/* rs */
#define CSR_RS_BASE 0xe0007800
#define CSR_RS_OUT_ADDR 0xe0007800
#define CSR_RS_OUT_SIZE 1
static inline unsigned char rs_out_read(void) {
	unsigned char r = csr_readl(0xe0007800);
	return r;
}
static inline void rs_out_write(unsigned char value) {
	csr_writel(value, 0xe0007800);
}

/* rst */
#define CSR_RST_BASE 0xe0008000
#define CSR_RST_OUT_ADDR 0xe0008000
#define CSR_RST_OUT_SIZE 1
static inline unsigned char rst_out_read(void) {
	unsigned char r = csr_readl(0xe0008000);
	return r;
}
static inline void rst_out_write(unsigned char value) {
	csr_writel(value, 0xe0008000);
}

/* switches */
#define CSR_SWITCHES_BASE 0xe0005000
#define CSR_SWITCHES_IN_ADDR 0xe0005000
#define CSR_SWITCHES_IN_SIZE 2
static inline unsigned short int switches_in_read(void) {
	unsigned short int r = csr_readl(0xe0005000);
	r <<= 8;
	r |= csr_readl(0xe0005004);
	return r;
}

/* timer0 */
#define CSR_TIMER0_BASE 0xe0002800
#define CSR_TIMER0_LOAD_ADDR 0xe0002800
#define CSR_TIMER0_LOAD_SIZE 4
static inline unsigned int timer0_load_read(void) {
	unsigned int r = csr_readl(0xe0002800);
	r <<= 8;
	r |= csr_readl(0xe0002804);
	r <<= 8;
	r |= csr_readl(0xe0002808);
	r <<= 8;
	r |= csr_readl(0xe000280c);
	return r;
}
static inline void timer0_load_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0002800);
	csr_writel(value >> 16, 0xe0002804);
	csr_writel(value >> 8, 0xe0002808);
	csr_writel(value, 0xe000280c);
}
#define CSR_TIMER0_RELOAD_ADDR 0xe0002810
#define CSR_TIMER0_RELOAD_SIZE 4
static inline unsigned int timer0_reload_read(void) {
	unsigned int r = csr_readl(0xe0002810);
	r <<= 8;
	r |= csr_readl(0xe0002814);
	r <<= 8;
	r |= csr_readl(0xe0002818);
	r <<= 8;
	r |= csr_readl(0xe000281c);
	return r;
}
static inline void timer0_reload_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0002810);
	csr_writel(value >> 16, 0xe0002814);
	csr_writel(value >> 8, 0xe0002818);
	csr_writel(value, 0xe000281c);
}
#define CSR_TIMER0_EN_ADDR 0xe0002820
#define CSR_TIMER0_EN_SIZE 1
static inline unsigned char timer0_en_read(void) {
	unsigned char r = csr_readl(0xe0002820);
	return r;
}
static inline void timer0_en_write(unsigned char value) {
	csr_writel(value, 0xe0002820);
}
#define CSR_TIMER0_UPDATE_VALUE_ADDR 0xe0002824
#define CSR_TIMER0_UPDATE_VALUE_SIZE 1
static inline unsigned char timer0_update_value_read(void) {
	unsigned char r = csr_readl(0xe0002824);
	return r;
}
static inline void timer0_update_value_write(unsigned char value) {
	csr_writel(value, 0xe0002824);
}
#define CSR_TIMER0_VALUE_ADDR 0xe0002828
#define CSR_TIMER0_VALUE_SIZE 4
static inline unsigned int timer0_value_read(void) {
	unsigned int r = csr_readl(0xe0002828);
	r <<= 8;
	r |= csr_readl(0xe000282c);
	r <<= 8;
	r |= csr_readl(0xe0002830);
	r <<= 8;
	r |= csr_readl(0xe0002834);
	return r;
}
#define CSR_TIMER0_EV_STATUS_ADDR 0xe0002838
#define CSR_TIMER0_EV_STATUS_SIZE 1
static inline unsigned char timer0_ev_status_read(void) {
	unsigned char r = csr_readl(0xe0002838);
	return r;
}
static inline void timer0_ev_status_write(unsigned char value) {
	csr_writel(value, 0xe0002838);
}
#define CSR_TIMER0_EV_PENDING_ADDR 0xe000283c
#define CSR_TIMER0_EV_PENDING_SIZE 1
static inline unsigned char timer0_ev_pending_read(void) {
	unsigned char r = csr_readl(0xe000283c);
	return r;
}
static inline void timer0_ev_pending_write(unsigned char value) {
	csr_writel(value, 0xe000283c);
}
#define CSR_TIMER0_EV_ENABLE_ADDR 0xe0002840
#define CSR_TIMER0_EV_ENABLE_SIZE 1
static inline unsigned char timer0_ev_enable_read(void) {
	unsigned char r = csr_readl(0xe0002840);
	return r;
}
static inline void timer0_ev_enable_write(unsigned char value) {
	csr_writel(value, 0xe0002840);
}

/* uart */
#define CSR_UART_BASE 0xe0001800
#define CSR_UART_RXTX_ADDR 0xe0001800
#define CSR_UART_RXTX_SIZE 1
static inline unsigned char uart_rxtx_read(void) {
	unsigned char r = csr_readl(0xe0001800);
	return r;
}
static inline void uart_rxtx_write(unsigned char value) {
	csr_writel(value, 0xe0001800);
}
#define CSR_UART_TXFULL_ADDR 0xe0001804
#define CSR_UART_TXFULL_SIZE 1
static inline unsigned char uart_txfull_read(void) {
	unsigned char r = csr_readl(0xe0001804);
	return r;
}
#define CSR_UART_RXEMPTY_ADDR 0xe0001808
#define CSR_UART_RXEMPTY_SIZE 1
static inline unsigned char uart_rxempty_read(void) {
	unsigned char r = csr_readl(0xe0001808);
	return r;
}
#define CSR_UART_EV_STATUS_ADDR 0xe000180c
#define CSR_UART_EV_STATUS_SIZE 1
static inline unsigned char uart_ev_status_read(void) {
	unsigned char r = csr_readl(0xe000180c);
	return r;
}
static inline void uart_ev_status_write(unsigned char value) {
	csr_writel(value, 0xe000180c);
}
#define CSR_UART_EV_PENDING_ADDR 0xe0001810
#define CSR_UART_EV_PENDING_SIZE 1
static inline unsigned char uart_ev_pending_read(void) {
	unsigned char r = csr_readl(0xe0001810);
	return r;
}
static inline void uart_ev_pending_write(unsigned char value) {
	csr_writel(value, 0xe0001810);
}
#define CSR_UART_EV_ENABLE_ADDR 0xe0001814
#define CSR_UART_EV_ENABLE_SIZE 1
static inline unsigned char uart_ev_enable_read(void) {
	unsigned char r = csr_readl(0xe0001814);
	return r;
}
static inline void uart_ev_enable_write(unsigned char value) {
	csr_writel(value, 0xe0001814);
}

/* uart_phy */
#define CSR_UART_PHY_BASE 0xe0001000
#define CSR_UART_PHY_TUNING_WORD_ADDR 0xe0001000
#define CSR_UART_PHY_TUNING_WORD_SIZE 4
static inline unsigned int uart_phy_tuning_word_read(void) {
	unsigned int r = csr_readl(0xe0001000);
	r <<= 8;
	r |= csr_readl(0xe0001004);
	r <<= 8;
	r |= csr_readl(0xe0001008);
	r <<= 8;
	r |= csr_readl(0xe000100c);
	return r;
}
static inline void uart_phy_tuning_word_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0001000);
	csr_writel(value >> 16, 0xe0001004);
	csr_writel(value >> 8, 0xe0001008);
	csr_writel(value, 0xe000100c);
}

/* identifier_mem */
#define CSR_IDENTIFIER_MEM_BASE 0xe0002000

/* constants */
#define NMI_INTERRUPT 0
static inline int nmi_interrupt_read(void) {
	return 0;
}
#define TIMER0_INTERRUPT 1
static inline int timer0_interrupt_read(void) {
	return 1;
}
#define UART_INTERRUPT 2
static inline int uart_interrupt_read(void) {
	return 2;
}
#define CSR_DATA_WIDTH 8
static inline int csr_data_width_read(void) {
	return 8;
}
#define SYSTEM_CLOCK_FREQUENCY 100000000
static inline int system_clock_frequency_read(void) {
	return 100000000;
}
#define CONFIG_CLOCK_FREQUENCY 100000000
static inline int config_clock_frequency_read(void) {
	return 100000000;
}
#define CONFIG_CPU_RESET_ADDR 0
static inline int config_cpu_reset_addr_read(void) {
	return 0;
}
#define CONFIG_CPU_TYPE "LM32"
static inline const char * config_cpu_type_read(void) {
	return "LM32";
}
#define CONFIG_CSR_DATA_WIDTH 8
static inline int config_csr_data_width_read(void) {
	return 8;
}

#endif
