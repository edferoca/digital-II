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

/* adxl362 */
#define CSR_ADXL362_BASE 0xe0007000
#define CSR_ADXL362_CONFIG_ADDR 0xe0007000
#define CSR_ADXL362_CONFIG_SIZE 4
static inline unsigned int adxl362_config_read(void) {
	unsigned int r = csr_readl(0xe0007000);
	r <<= 8;
	r |= csr_readl(0xe0007004);
	r <<= 8;
	r |= csr_readl(0xe0007008);
	r <<= 8;
	r |= csr_readl(0xe000700c);
	return r;
}
static inline void adxl362_config_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0007000);
	csr_writel(value >> 16, 0xe0007004);
	csr_writel(value >> 8, 0xe0007008);
	csr_writel(value, 0xe000700c);
}
#define CSR_ADXL362_XFER_ADDR 0xe0007010
#define CSR_ADXL362_XFER_SIZE 4
static inline unsigned int adxl362_xfer_read(void) {
	unsigned int r = csr_readl(0xe0007010);
	r <<= 8;
	r |= csr_readl(0xe0007014);
	r <<= 8;
	r |= csr_readl(0xe0007018);
	r <<= 8;
	r |= csr_readl(0xe000701c);
	return r;
}
static inline void adxl362_xfer_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0007010);
	csr_writel(value >> 16, 0xe0007014);
	csr_writel(value >> 8, 0xe0007018);
	csr_writel(value, 0xe000701c);
}
#define CSR_ADXL362_START_ADDR 0xe0007020
#define CSR_ADXL362_START_SIZE 1
static inline unsigned char adxl362_start_read(void) {
	unsigned char r = csr_readl(0xe0007020);
	return r;
}
static inline void adxl362_start_write(unsigned char value) {
	csr_writel(value, 0xe0007020);
}
#define CSR_ADXL362_ACTIVE_ADDR 0xe0007024
#define CSR_ADXL362_ACTIVE_SIZE 1
static inline unsigned char adxl362_active_read(void) {
	unsigned char r = csr_readl(0xe0007024);
	return r;
}
#define CSR_ADXL362_PENDING_ADDR 0xe0007028
#define CSR_ADXL362_PENDING_SIZE 1
static inline unsigned char adxl362_pending_read(void) {
	unsigned char r = csr_readl(0xe0007028);
	return r;
}
#define CSR_ADXL362_MOSI_DATA_ADDR 0xe000702c
#define CSR_ADXL362_MOSI_DATA_SIZE 4
static inline unsigned int adxl362_mosi_data_read(void) {
	unsigned int r = csr_readl(0xe000702c);
	r <<= 8;
	r |= csr_readl(0xe0007030);
	r <<= 8;
	r |= csr_readl(0xe0007034);
	r <<= 8;
	r |= csr_readl(0xe0007038);
	return r;
}
static inline void adxl362_mosi_data_write(unsigned int value) {
	csr_writel(value >> 24, 0xe000702c);
	csr_writel(value >> 16, 0xe0007030);
	csr_writel(value >> 8, 0xe0007034);
	csr_writel(value, 0xe0007038);
}
#define CSR_ADXL362_MISO_DATA_ADDR 0xe000703c
#define CSR_ADXL362_MISO_DATA_SIZE 4
static inline unsigned int adxl362_miso_data_read(void) {
	unsigned int r = csr_readl(0xe000703c);
	r <<= 8;
	r |= csr_readl(0xe0007040);
	r <<= 8;
	r |= csr_readl(0xe0007044);
	r <<= 8;
	r |= csr_readl(0xe0007048);
	return r;
}

/* buttons */
#define CSR_BUTTONS_BASE 0xe0006800
#define CSR_BUTTONS_IN_ADDR 0xe0006800
#define CSR_BUTTONS_IN_SIZE 1
static inline unsigned char buttons_in_read(void) {
	unsigned char r = csr_readl(0xe0006800);
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
#define CSR_DISPLAY_BASE 0xe0007800
#define CSR_DISPLAY_SEL_ADDR 0xe0007800
#define CSR_DISPLAY_SEL_SIZE 1
static inline unsigned char display_sel_read(void) {
	unsigned char r = csr_readl(0xe0007800);
	return r;
}
static inline void display_sel_write(unsigned char value) {
	csr_writel(value, 0xe0007800);
}
#define CSR_DISPLAY_VALUE_ADDR 0xe0007804
#define CSR_DISPLAY_VALUE_SIZE 1
static inline unsigned char display_value_read(void) {
	unsigned char r = csr_readl(0xe0007804);
	return r;
}
static inline void display_value_write(unsigned char value) {
	csr_writel(value, 0xe0007804);
}
#define CSR_DISPLAY_WRITE_ADDR 0xe0007808
#define CSR_DISPLAY_WRITE_SIZE 1
static inline unsigned char display_write_read(void) {
	unsigned char r = csr_readl(0xe0007808);
	return r;
}
static inline void display_write_write(unsigned char value) {
	csr_writel(value, 0xe0007808);
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
#define CSR_LCD_BASE 0xe0008800
#define CSR_LCD_CONFIG_ADDR 0xe0008800
#define CSR_LCD_CONFIG_SIZE 4
static inline unsigned int lcd_config_read(void) {
	unsigned int r = csr_readl(0xe0008800);
	r <<= 8;
	r |= csr_readl(0xe0008804);
	r <<= 8;
	r |= csr_readl(0xe0008808);
	r <<= 8;
	r |= csr_readl(0xe000880c);
	return r;
}
static inline void lcd_config_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0008800);
	csr_writel(value >> 16, 0xe0008804);
	csr_writel(value >> 8, 0xe0008808);
	csr_writel(value, 0xe000880c);
}
#define CSR_LCD_XFER_ADDR 0xe0008810
#define CSR_LCD_XFER_SIZE 4
static inline unsigned int lcd_xfer_read(void) {
	unsigned int r = csr_readl(0xe0008810);
	r <<= 8;
	r |= csr_readl(0xe0008814);
	r <<= 8;
	r |= csr_readl(0xe0008818);
	r <<= 8;
	r |= csr_readl(0xe000881c);
	return r;
}
static inline void lcd_xfer_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0008810);
	csr_writel(value >> 16, 0xe0008814);
	csr_writel(value >> 8, 0xe0008818);
	csr_writel(value, 0xe000881c);
}
#define CSR_LCD_START_ADDR 0xe0008820
#define CSR_LCD_START_SIZE 1
static inline unsigned char lcd_start_read(void) {
	unsigned char r = csr_readl(0xe0008820);
	return r;
}
static inline void lcd_start_write(unsigned char value) {
	csr_writel(value, 0xe0008820);
}
#define CSR_LCD_ACTIVE_ADDR 0xe0008824
#define CSR_LCD_ACTIVE_SIZE 1
static inline unsigned char lcd_active_read(void) {
	unsigned char r = csr_readl(0xe0008824);
	return r;
}
#define CSR_LCD_PENDING_ADDR 0xe0008828
#define CSR_LCD_PENDING_SIZE 1
static inline unsigned char lcd_pending_read(void) {
	unsigned char r = csr_readl(0xe0008828);
	return r;
}
#define CSR_LCD_MOSI_DATA_ADDR 0xe000882c
#define CSR_LCD_MOSI_DATA_SIZE 4
static inline unsigned int lcd_mosi_data_read(void) {
	unsigned int r = csr_readl(0xe000882c);
	r <<= 8;
	r |= csr_readl(0xe0008830);
	r <<= 8;
	r |= csr_readl(0xe0008834);
	r <<= 8;
	r |= csr_readl(0xe0008838);
	return r;
}
static inline void lcd_mosi_data_write(unsigned int value) {
	csr_writel(value >> 24, 0xe000882c);
	csr_writel(value >> 16, 0xe0008830);
	csr_writel(value >> 8, 0xe0008834);
	csr_writel(value, 0xe0008838);
}
#define CSR_LCD_MISO_DATA_ADDR 0xe000883c
#define CSR_LCD_MISO_DATA_SIZE 4
static inline unsigned int lcd_miso_data_read(void) {
	unsigned int r = csr_readl(0xe000883c);
	r <<= 8;
	r |= csr_readl(0xe0008840);
	r <<= 8;
	r |= csr_readl(0xe0008844);
	r <<= 8;
	r |= csr_readl(0xe0008848);
	return r;
}

/* leds */
#define CSR_LEDS_BASE 0xe0005800
#define CSR_LEDS_OUT_ADDR 0xe0005800
#define CSR_LEDS_OUT_SIZE 2
static inline unsigned short int leds_out_read(void) {
	unsigned short int r = csr_readl(0xe0005800);
	r <<= 8;
	r |= csr_readl(0xe0005804);
	return r;
}
static inline void leds_out_write(unsigned short int value) {
	csr_writel(value >> 8, 0xe0005800);
	csr_writel(value, 0xe0005804);
}

/* rgbled */
#define CSR_RGBLED_BASE 0xe0005000
#define CSR_RGBLED_R_ENABLE_ADDR 0xe0005000
#define CSR_RGBLED_R_ENABLE_SIZE 1
static inline unsigned char rgbled_r_enable_read(void) {
	unsigned char r = csr_readl(0xe0005000);
	return r;
}
static inline void rgbled_r_enable_write(unsigned char value) {
	csr_writel(value, 0xe0005000);
}
#define CSR_RGBLED_R_WIDTH_ADDR 0xe0005004
#define CSR_RGBLED_R_WIDTH_SIZE 4
static inline unsigned int rgbled_r_width_read(void) {
	unsigned int r = csr_readl(0xe0005004);
	r <<= 8;
	r |= csr_readl(0xe0005008);
	r <<= 8;
	r |= csr_readl(0xe000500c);
	r <<= 8;
	r |= csr_readl(0xe0005010);
	return r;
}
static inline void rgbled_r_width_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0005004);
	csr_writel(value >> 16, 0xe0005008);
	csr_writel(value >> 8, 0xe000500c);
	csr_writel(value, 0xe0005010);
}
#define CSR_RGBLED_R_PERIOD_ADDR 0xe0005014
#define CSR_RGBLED_R_PERIOD_SIZE 4
static inline unsigned int rgbled_r_period_read(void) {
	unsigned int r = csr_readl(0xe0005014);
	r <<= 8;
	r |= csr_readl(0xe0005018);
	r <<= 8;
	r |= csr_readl(0xe000501c);
	r <<= 8;
	r |= csr_readl(0xe0005020);
	return r;
}
static inline void rgbled_r_period_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0005014);
	csr_writel(value >> 16, 0xe0005018);
	csr_writel(value >> 8, 0xe000501c);
	csr_writel(value, 0xe0005020);
}
#define CSR_RGBLED_G_ENABLE_ADDR 0xe0005024
#define CSR_RGBLED_G_ENABLE_SIZE 1
static inline unsigned char rgbled_g_enable_read(void) {
	unsigned char r = csr_readl(0xe0005024);
	return r;
}
static inline void rgbled_g_enable_write(unsigned char value) {
	csr_writel(value, 0xe0005024);
}
#define CSR_RGBLED_G_WIDTH_ADDR 0xe0005028
#define CSR_RGBLED_G_WIDTH_SIZE 4
static inline unsigned int rgbled_g_width_read(void) {
	unsigned int r = csr_readl(0xe0005028);
	r <<= 8;
	r |= csr_readl(0xe000502c);
	r <<= 8;
	r |= csr_readl(0xe0005030);
	r <<= 8;
	r |= csr_readl(0xe0005034);
	return r;
}
static inline void rgbled_g_width_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0005028);
	csr_writel(value >> 16, 0xe000502c);
	csr_writel(value >> 8, 0xe0005030);
	csr_writel(value, 0xe0005034);
}
#define CSR_RGBLED_G_PERIOD_ADDR 0xe0005038
#define CSR_RGBLED_G_PERIOD_SIZE 4
static inline unsigned int rgbled_g_period_read(void) {
	unsigned int r = csr_readl(0xe0005038);
	r <<= 8;
	r |= csr_readl(0xe000503c);
	r <<= 8;
	r |= csr_readl(0xe0005040);
	r <<= 8;
	r |= csr_readl(0xe0005044);
	return r;
}
static inline void rgbled_g_period_write(unsigned int value) {
	csr_writel(value >> 24, 0xe0005038);
	csr_writel(value >> 16, 0xe000503c);
	csr_writel(value >> 8, 0xe0005040);
	csr_writel(value, 0xe0005044);
}
#define CSR_RGBLED_B_ENABLE_ADDR 0xe0005048
#define CSR_RGBLED_B_ENABLE_SIZE 1
static inline unsigned char rgbled_b_enable_read(void) {
	unsigned char r = csr_readl(0xe0005048);
	return r;
}
static inline void rgbled_b_enable_write(unsigned char value) {
	csr_writel(value, 0xe0005048);
}
#define CSR_RGBLED_B_WIDTH_ADDR 0xe000504c
#define CSR_RGBLED_B_WIDTH_SIZE 4
static inline unsigned int rgbled_b_width_read(void) {
	unsigned int r = csr_readl(0xe000504c);
	r <<= 8;
	r |= csr_readl(0xe0005050);
	r <<= 8;
	r |= csr_readl(0xe0005054);
	r <<= 8;
	r |= csr_readl(0xe0005058);
	return r;
}
static inline void rgbled_b_width_write(unsigned int value) {
	csr_writel(value >> 24, 0xe000504c);
	csr_writel(value >> 16, 0xe0005050);
	csr_writel(value >> 8, 0xe0005054);
	csr_writel(value, 0xe0005058);
}
#define CSR_RGBLED_B_PERIOD_ADDR 0xe000505c
#define CSR_RGBLED_B_PERIOD_SIZE 4
static inline unsigned int rgbled_b_period_read(void) {
	unsigned int r = csr_readl(0xe000505c);
	r <<= 8;
	r |= csr_readl(0xe0005060);
	r <<= 8;
	r |= csr_readl(0xe0005064);
	r <<= 8;
	r |= csr_readl(0xe0005068);
	return r;
}
static inline void rgbled_b_period_write(unsigned int value) {
	csr_writel(value >> 24, 0xe000505c);
	csr_writel(value >> 16, 0xe0005060);
	csr_writel(value >> 8, 0xe0005064);
	csr_writel(value, 0xe0005068);
}

/* switches */
#define CSR_SWITCHES_BASE 0xe0006000
#define CSR_SWITCHES_IN_ADDR 0xe0006000
#define CSR_SWITCHES_IN_SIZE 2
static inline unsigned short int switches_in_read(void) {
	unsigned short int r = csr_readl(0xe0006000);
	r <<= 8;
	r |= csr_readl(0xe0006004);
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

/* xadc */
#define CSR_XADC_BASE 0xe0004800
#define CSR_XADC_TEMPERATURE_ADDR 0xe0004800
#define CSR_XADC_TEMPERATURE_SIZE 2
static inline unsigned short int xadc_temperature_read(void) {
	unsigned short int r = csr_readl(0xe0004800);
	r <<= 8;
	r |= csr_readl(0xe0004804);
	return r;
}
#define CSR_XADC_VCCINT_ADDR 0xe0004808
#define CSR_XADC_VCCINT_SIZE 2
static inline unsigned short int xadc_vccint_read(void) {
	unsigned short int r = csr_readl(0xe0004808);
	r <<= 8;
	r |= csr_readl(0xe000480c);
	return r;
}
#define CSR_XADC_VCCAUX_ADDR 0xe0004810
#define CSR_XADC_VCCAUX_SIZE 2
static inline unsigned short int xadc_vccaux_read(void) {
	unsigned short int r = csr_readl(0xe0004810);
	r <<= 8;
	r |= csr_readl(0xe0004814);
	return r;
}
#define CSR_XADC_VCCBRAM_ADDR 0xe0004818
#define CSR_XADC_VCCBRAM_SIZE 2
static inline unsigned short int xadc_vccbram_read(void) {
	unsigned short int r = csr_readl(0xe0004818);
	r <<= 8;
	r |= csr_readl(0xe000481c);
	return r;
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
