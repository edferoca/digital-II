/* Machine-generated using LiteX gen */
module top(
	output reg serial_tx,
	input serial_rx,
	input clk100,
	input cpu_reset,
	output user_led0,
	output user_led1,
	output user_led2,
	output user_led3,
	output user_led4,
	output user_led5,
	output user_led6,
	output user_led7,
	output user_led8,
	output user_led9,
	output user_led10,
	output user_led11,
	output user_led12,
	output user_led13,
	output user_led14,
	output user_led15,
	input user_sw0,
	input user_sw1,
	input user_sw2,
	input user_sw3,
	input user_sw4,
	input user_sw5,
	input user_sw6,
	input user_sw7,
	input user_sw8,
	input user_sw9,
	input user_sw10,
	input user_sw11,
	input user_sw12,
	input user_sw13,
	input user_sw14,
	input user_sw15,
	input user_btn0,
	input user_btn1,
	input user_btn2,
	input user_btn3,
	input user_btn4,
	output reg user_rgb_led0_r,
	output reg user_rgb_led0_g,
	output reg user_rgb_led0_b,
	inout adxl362_spi_cs_n,
	inout adxl362_spi_clk,
	inout adxl362_spi_mosi,
	input adxl362_spi_miso,
	inout lcd_spi_cs_n,
	inout lcd_spi_mosi,
	input lcd_spi_miso,
	inout lcd_spi_clk,
	output [7:0] display_cs_n,
	output [7:0] display_abcdefg
);

wire basesoc_ctrl_reset_reset_re;
wire basesoc_ctrl_reset_reset_r;
reg basesoc_ctrl_reset_reset_w = 1'd0;
reg [31:0] basesoc_ctrl_storage_full = 32'd305419896;
wire [31:0] basesoc_ctrl_storage;
reg basesoc_ctrl_re = 1'd0;
wire [31:0] basesoc_ctrl_bus_errors_status;
wire basesoc_ctrl_reset;
wire basesoc_ctrl_bus_error;
reg [31:0] basesoc_ctrl_bus_errors = 32'd0;
wire basesoc_lm32_reset;
wire [29:0] basesoc_lm32_ibus_adr;
wire [31:0] basesoc_lm32_ibus_dat_w;
wire [31:0] basesoc_lm32_ibus_dat_r;
wire [3:0] basesoc_lm32_ibus_sel;
wire basesoc_lm32_ibus_cyc;
wire basesoc_lm32_ibus_stb;
wire basesoc_lm32_ibus_ack;
wire basesoc_lm32_ibus_we;
wire [2:0] basesoc_lm32_ibus_cti;
wire [1:0] basesoc_lm32_ibus_bte;
wire basesoc_lm32_ibus_err;
wire [29:0] basesoc_lm32_dbus_adr;
wire [31:0] basesoc_lm32_dbus_dat_w;
wire [31:0] basesoc_lm32_dbus_dat_r;
wire [3:0] basesoc_lm32_dbus_sel;
wire basesoc_lm32_dbus_cyc;
wire basesoc_lm32_dbus_stb;
wire basesoc_lm32_dbus_ack;
wire basesoc_lm32_dbus_we;
wire [2:0] basesoc_lm32_dbus_cti;
wire [1:0] basesoc_lm32_dbus_bte;
wire basesoc_lm32_dbus_err;
reg [31:0] basesoc_lm32_interrupt = 32'd0;
wire [31:0] basesoc_lm32_i_adr_o;
wire [31:0] basesoc_lm32_d_adr_o;
wire [29:0] basesoc_rom_bus_adr;
wire [31:0] basesoc_rom_bus_dat_w;
wire [31:0] basesoc_rom_bus_dat_r;
wire [3:0] basesoc_rom_bus_sel;
wire basesoc_rom_bus_cyc;
wire basesoc_rom_bus_stb;
reg basesoc_rom_bus_ack = 1'd0;
wire basesoc_rom_bus_we;
wire [2:0] basesoc_rom_bus_cti;
wire [1:0] basesoc_rom_bus_bte;
reg basesoc_rom_bus_err = 1'd0;
wire [12:0] basesoc_rom_adr;
wire [31:0] basesoc_rom_dat_r;
wire [29:0] basesoc_sram_bus_adr;
wire [31:0] basesoc_sram_bus_dat_w;
wire [31:0] basesoc_sram_bus_dat_r;
wire [3:0] basesoc_sram_bus_sel;
wire basesoc_sram_bus_cyc;
wire basesoc_sram_bus_stb;
reg basesoc_sram_bus_ack = 1'd0;
wire basesoc_sram_bus_we;
wire [2:0] basesoc_sram_bus_cti;
wire [1:0] basesoc_sram_bus_bte;
reg basesoc_sram_bus_err = 1'd0;
wire [9:0] basesoc_sram_adr;
wire [31:0] basesoc_sram_dat_r;
reg [3:0] basesoc_sram_we = 4'd0;
wire [31:0] basesoc_sram_dat_w;
wire [29:0] basesoc_main_ram_bus_adr;
wire [31:0] basesoc_main_ram_bus_dat_w;
wire [31:0] basesoc_main_ram_bus_dat_r;
wire [3:0] basesoc_main_ram_bus_sel;
wire basesoc_main_ram_bus_cyc;
wire basesoc_main_ram_bus_stb;
reg basesoc_main_ram_bus_ack = 1'd0;
wire basesoc_main_ram_bus_we;
wire [2:0] basesoc_main_ram_bus_cti;
wire [1:0] basesoc_main_ram_bus_bte;
reg basesoc_main_ram_bus_err = 1'd0;
wire [11:0] basesoc_main_ram_adr;
wire [31:0] basesoc_main_ram_dat_r;
reg [3:0] basesoc_main_ram_we = 4'd0;
wire [31:0] basesoc_main_ram_dat_w;
reg [13:0] basesoc_interface_adr = 14'd0;
reg basesoc_interface_we = 1'd0;
reg [7:0] basesoc_interface_dat_w = 8'd0;
wire [7:0] basesoc_interface_dat_r;
wire [29:0] basesoc_bus_wishbone_adr;
wire [31:0] basesoc_bus_wishbone_dat_w;
reg [31:0] basesoc_bus_wishbone_dat_r = 32'd0;
wire [3:0] basesoc_bus_wishbone_sel;
wire basesoc_bus_wishbone_cyc;
wire basesoc_bus_wishbone_stb;
reg basesoc_bus_wishbone_ack = 1'd0;
wire basesoc_bus_wishbone_we;
wire [2:0] basesoc_bus_wishbone_cti;
wire [1:0] basesoc_bus_wishbone_bte;
reg basesoc_bus_wishbone_err = 1'd0;
reg [1:0] basesoc_counter = 2'd0;
reg [31:0] basesoc_uart_phy_storage_full = 32'd4947802;
wire [31:0] basesoc_uart_phy_storage;
reg basesoc_uart_phy_re = 1'd0;
wire basesoc_uart_phy_sink_valid;
reg basesoc_uart_phy_sink_ready = 1'd0;
wire basesoc_uart_phy_sink_first;
wire basesoc_uart_phy_sink_last;
wire [7:0] basesoc_uart_phy_sink_payload_data;
reg basesoc_uart_phy_uart_clk_txen = 1'd0;
reg [31:0] basesoc_uart_phy_phase_accumulator_tx = 32'd0;
reg [7:0] basesoc_uart_phy_tx_reg = 8'd0;
reg [3:0] basesoc_uart_phy_tx_bitcount = 4'd0;
reg basesoc_uart_phy_tx_busy = 1'd0;
reg basesoc_uart_phy_source_valid = 1'd0;
wire basesoc_uart_phy_source_ready;
reg basesoc_uart_phy_source_first = 1'd0;
reg basesoc_uart_phy_source_last = 1'd0;
reg [7:0] basesoc_uart_phy_source_payload_data = 8'd0;
reg basesoc_uart_phy_uart_clk_rxen = 1'd0;
reg [31:0] basesoc_uart_phy_phase_accumulator_rx = 32'd0;
wire basesoc_uart_phy_rx;
reg basesoc_uart_phy_rx_r = 1'd0;
reg [7:0] basesoc_uart_phy_rx_reg = 8'd0;
reg [3:0] basesoc_uart_phy_rx_bitcount = 4'd0;
reg basesoc_uart_phy_rx_busy = 1'd0;
wire basesoc_uart_rxtx_re;
wire [7:0] basesoc_uart_rxtx_r;
wire [7:0] basesoc_uart_rxtx_w;
wire basesoc_uart_txfull_status;
wire basesoc_uart_rxempty_status;
wire basesoc_uart_irq;
wire basesoc_uart_tx_status;
reg basesoc_uart_tx_pending = 1'd0;
wire basesoc_uart_tx_trigger;
reg basesoc_uart_tx_clear = 1'd0;
reg basesoc_uart_tx_old_trigger = 1'd0;
wire basesoc_uart_rx_status;
reg basesoc_uart_rx_pending = 1'd0;
wire basesoc_uart_rx_trigger;
reg basesoc_uart_rx_clear = 1'd0;
reg basesoc_uart_rx_old_trigger = 1'd0;
wire basesoc_uart_eventmanager_status_re;
wire [1:0] basesoc_uart_eventmanager_status_r;
reg [1:0] basesoc_uart_eventmanager_status_w = 2'd0;
wire basesoc_uart_eventmanager_pending_re;
wire [1:0] basesoc_uart_eventmanager_pending_r;
reg [1:0] basesoc_uart_eventmanager_pending_w = 2'd0;
reg [1:0] basesoc_uart_eventmanager_storage_full = 2'd0;
wire [1:0] basesoc_uart_eventmanager_storage;
reg basesoc_uart_eventmanager_re = 1'd0;
wire basesoc_uart_tx_fifo_sink_valid;
wire basesoc_uart_tx_fifo_sink_ready;
reg basesoc_uart_tx_fifo_sink_first = 1'd0;
reg basesoc_uart_tx_fifo_sink_last = 1'd0;
wire [7:0] basesoc_uart_tx_fifo_sink_payload_data;
wire basesoc_uart_tx_fifo_source_valid;
wire basesoc_uart_tx_fifo_source_ready;
wire basesoc_uart_tx_fifo_source_first;
wire basesoc_uart_tx_fifo_source_last;
wire [7:0] basesoc_uart_tx_fifo_source_payload_data;
wire basesoc_uart_tx_fifo_re;
reg basesoc_uart_tx_fifo_readable = 1'd0;
wire basesoc_uart_tx_fifo_syncfifo_we;
wire basesoc_uart_tx_fifo_syncfifo_writable;
wire basesoc_uart_tx_fifo_syncfifo_re;
wire basesoc_uart_tx_fifo_syncfifo_readable;
wire [9:0] basesoc_uart_tx_fifo_syncfifo_din;
wire [9:0] basesoc_uart_tx_fifo_syncfifo_dout;
reg [4:0] basesoc_uart_tx_fifo_level0 = 5'd0;
reg basesoc_uart_tx_fifo_replace = 1'd0;
reg [3:0] basesoc_uart_tx_fifo_produce = 4'd0;
reg [3:0] basesoc_uart_tx_fifo_consume = 4'd0;
reg [3:0] basesoc_uart_tx_fifo_wrport_adr = 4'd0;
wire [9:0] basesoc_uart_tx_fifo_wrport_dat_r;
wire basesoc_uart_tx_fifo_wrport_we;
wire [9:0] basesoc_uart_tx_fifo_wrport_dat_w;
wire basesoc_uart_tx_fifo_do_read;
wire [3:0] basesoc_uart_tx_fifo_rdport_adr;
wire [9:0] basesoc_uart_tx_fifo_rdport_dat_r;
wire basesoc_uart_tx_fifo_rdport_re;
wire [4:0] basesoc_uart_tx_fifo_level1;
wire [7:0] basesoc_uart_tx_fifo_fifo_in_payload_data;
wire basesoc_uart_tx_fifo_fifo_in_first;
wire basesoc_uart_tx_fifo_fifo_in_last;
wire [7:0] basesoc_uart_tx_fifo_fifo_out_payload_data;
wire basesoc_uart_tx_fifo_fifo_out_first;
wire basesoc_uart_tx_fifo_fifo_out_last;
wire basesoc_uart_rx_fifo_sink_valid;
wire basesoc_uart_rx_fifo_sink_ready;
wire basesoc_uart_rx_fifo_sink_first;
wire basesoc_uart_rx_fifo_sink_last;
wire [7:0] basesoc_uart_rx_fifo_sink_payload_data;
wire basesoc_uart_rx_fifo_source_valid;
wire basesoc_uart_rx_fifo_source_ready;
wire basesoc_uart_rx_fifo_source_first;
wire basesoc_uart_rx_fifo_source_last;
wire [7:0] basesoc_uart_rx_fifo_source_payload_data;
wire basesoc_uart_rx_fifo_re;
reg basesoc_uart_rx_fifo_readable = 1'd0;
wire basesoc_uart_rx_fifo_syncfifo_we;
wire basesoc_uart_rx_fifo_syncfifo_writable;
wire basesoc_uart_rx_fifo_syncfifo_re;
wire basesoc_uart_rx_fifo_syncfifo_readable;
wire [9:0] basesoc_uart_rx_fifo_syncfifo_din;
wire [9:0] basesoc_uart_rx_fifo_syncfifo_dout;
reg [4:0] basesoc_uart_rx_fifo_level0 = 5'd0;
reg basesoc_uart_rx_fifo_replace = 1'd0;
reg [3:0] basesoc_uart_rx_fifo_produce = 4'd0;
reg [3:0] basesoc_uart_rx_fifo_consume = 4'd0;
reg [3:0] basesoc_uart_rx_fifo_wrport_adr = 4'd0;
wire [9:0] basesoc_uart_rx_fifo_wrport_dat_r;
wire basesoc_uart_rx_fifo_wrport_we;
wire [9:0] basesoc_uart_rx_fifo_wrport_dat_w;
wire basesoc_uart_rx_fifo_do_read;
wire [3:0] basesoc_uart_rx_fifo_rdport_adr;
wire [9:0] basesoc_uart_rx_fifo_rdport_dat_r;
wire basesoc_uart_rx_fifo_rdport_re;
wire [4:0] basesoc_uart_rx_fifo_level1;
wire [7:0] basesoc_uart_rx_fifo_fifo_in_payload_data;
wire basesoc_uart_rx_fifo_fifo_in_first;
wire basesoc_uart_rx_fifo_fifo_in_last;
wire [7:0] basesoc_uart_rx_fifo_fifo_out_payload_data;
wire basesoc_uart_rx_fifo_fifo_out_first;
wire basesoc_uart_rx_fifo_fifo_out_last;
reg basesoc_uart_reset = 1'd0;
reg [31:0] basesoc_timer0_load_storage_full = 32'd0;
wire [31:0] basesoc_timer0_load_storage;
reg basesoc_timer0_load_re = 1'd0;
reg [31:0] basesoc_timer0_reload_storage_full = 32'd0;
wire [31:0] basesoc_timer0_reload_storage;
reg basesoc_timer0_reload_re = 1'd0;
reg basesoc_timer0_en_storage_full = 1'd0;
wire basesoc_timer0_en_storage;
reg basesoc_timer0_en_re = 1'd0;
wire basesoc_timer0_update_value_re;
wire basesoc_timer0_update_value_r;
reg basesoc_timer0_update_value_w = 1'd0;
reg [31:0] basesoc_timer0_value_status = 32'd0;
wire basesoc_timer0_irq;
wire basesoc_timer0_zero_status;
reg basesoc_timer0_zero_pending = 1'd0;
wire basesoc_timer0_zero_trigger;
reg basesoc_timer0_zero_clear = 1'd0;
reg basesoc_timer0_zero_old_trigger = 1'd0;
wire basesoc_timer0_eventmanager_status_re;
wire basesoc_timer0_eventmanager_status_r;
wire basesoc_timer0_eventmanager_status_w;
wire basesoc_timer0_eventmanager_pending_re;
wire basesoc_timer0_eventmanager_pending_r;
wire basesoc_timer0_eventmanager_pending_w;
reg basesoc_timer0_eventmanager_storage_full = 1'd0;
wire basesoc_timer0_eventmanager_storage;
reg basesoc_timer0_eventmanager_re = 1'd0;
reg [31:0] basesoc_timer0_value = 32'd0;
wire sys_clk;
wire sys_rst;
wire por_clk;
reg int_rst = 1'd1;
reg [56:0] dna_status = 57'd0;
wire dna_do;
reg [6:0] dna_cnt = 7'd0;
reg [11:0] temperature_status = 12'd0;
reg [11:0] vccint_status = 12'd0;
reg [11:0] vccaux_status = 12'd0;
reg [11:0] vccbram_status = 12'd0;
wire [7:0] alarm;
wire ot;
wire busy;
wire [6:0] channel;
wire eoc;
wire eos;
wire [15:0] data;
wire drdy;
reg [15:0] storage_full = 16'd0;
wire [15:0] storage;
reg re = 1'd0;
wire [15:0] switches_status;
wire [4:0] buttons_status;
reg r_enable_storage_full = 1'd0;
wire r_enable_storage;
reg r_enable_re = 1'd0;
reg [31:0] r_width_storage_full = 32'd0;
wire [31:0] r_width_storage;
reg r_width_re = 1'd0;
reg [31:0] r_period_storage_full = 32'd0;
wire [31:0] r_period_storage;
reg r_period_re = 1'd0;
wire r_enable;
wire [31:0] r_width;
wire [31:0] r_period;
reg [31:0] r_count = 32'd0;
reg g_enable_storage_full = 1'd0;
wire g_enable_storage;
reg g_enable_re = 1'd0;
reg [31:0] g_width_storage_full = 32'd0;
wire [31:0] g_width_storage;
reg g_width_re = 1'd0;
reg [31:0] g_period_storage_full = 32'd0;
wire [31:0] g_period_storage;
reg g_period_re = 1'd0;
wire g_enable;
wire [31:0] g_width;
wire [31:0] g_period;
reg [31:0] g_count = 32'd0;
reg b_enable_storage_full = 1'd0;
wire b_enable_storage;
reg b_enable_re = 1'd0;
reg [31:0] b_width_storage_full = 32'd0;
wire [31:0] b_width_storage;
reg b_width_re = 1'd0;
reg [31:0] b_period_storage_full = 32'd0;
wire [31:0] b_period_storage;
reg b_period_re = 1'd0;
wire b_enable;
wire [31:0] b_width;
wire [31:0] b_period;
reg [31:0] b_count = 32'd0;
wire adxl362_config_offline;
wire [1:0] adxl362_config_padding0;
wire adxl362_config_cs_polarity;
wire adxl362_config_clk_polarity;
wire adxl362_config_clk_phase;
wire adxl362_config_lsb_first;
wire adxl362_config_half_duplex;
wire [7:0] adxl362_config_padding1;
wire [7:0] adxl362_config_div_write;
wire [7:0] adxl362_config_div_read;
wire [15:0] adxl362_xfer_cs;
wire [5:0] adxl362_xfer_write_length;
wire [1:0] adxl362_xfer_padding0;
wire [5:0] adxl362_xfer_read_length;
wire [1:0] adxl362_xfer_padding1;
wire adxl362_start;
reg adxl362_active = 1'd0;
reg adxl362_pending0 = 1'd0;
wire [31:0] adxl362_mosi_data;
wire [31:0] adxl362_miso_data;
reg [7:0] adxl362_machine_load = 8'd0;
wire adxl362_machine_bias0;
wire adxl362_machine_edge;
reg adxl362_machine_clk = 1'd1;
reg [7:0] adxl362_machine_cnt = 8'd0;
reg adxl362_machine_bias1 = 1'd0;
wire adxl362_machine_zero;
wire adxl362_machine_cg_ce;
reg [31:0] adxl362_machine_data = 32'd0;
wire adxl362_machine_o;
wire adxl362_machine_i;
wire adxl362_machine_lsb;
reg adxl362_machine_shift = 1'd0;
reg adxl362_machine_sample = 1'd0;
wire adxl362_machine_reg_ce;
reg [5:0] adxl362_machine_n_read = 6'd0;
reg [5:0] adxl362_machine_n_write = 6'd0;
wire adxl362_machine_read;
wire adxl362_machine_write;
wire adxl362_machine_done0;
wire adxl362_machine_bits_ce;
wire [7:0] adxl362_machine_div_write;
wire [7:0] adxl362_machine_div_read;
wire adxl362_machine_clk_phase;
wire adxl362_machine_start;
wire adxl362_machine_cs;
wire adxl362_machine_oe;
wire adxl362_machine_done1;
wire adxl362_machine_fsm_ce;
reg adxl362_machine_write0 = 1'd0;
reg adxl362_machine_fsm_is_ongoing0 = 1'd0;
reg adxl362_machine_fsm_is_ongoing1 = 1'd0;
reg adxl362_pending1 = 1'd0;
reg [15:0] adxl362_cs = 16'd0;
reg [31:0] adxl362_data_read = 32'd0;
reg [31:0] adxl362_data_write = 32'd0;
wire adxl362_cs_n_t_o;
wire adxl362_cs_n_t_oe;
wire adxl362_cs_n_t_i;
wire adxl362_clk_t_o;
wire adxl362_clk_t_oe;
wire adxl362_clk_t_i;
wire adxl362_mosi_t_o;
wire adxl362_mosi_t_oe;
wire adxl362_mosi_t_i;
reg [31:0] adxl362_config_storage_full = 32'd0;
wire [31:0] adxl362_config_storage;
reg adxl362_config_re = 1'd0;
reg [31:0] adxl362_xfer_storage_full = 32'd0;
wire [31:0] adxl362_xfer_storage;
reg adxl362_xfer_re = 1'd0;
wire adxl362_start_re;
wire adxl362_start_r;
reg adxl362_start_w = 1'd0;
wire adxl362_active_status;
wire adxl362_pending_status;
reg [31:0] adxl362_mosi_data_storage_full = 32'd0;
wire [31:0] adxl362_mosi_data_storage;
reg adxl362_mosi_data_re = 1'd0;
wire [31:0] adxl362_miso_data_status;
wire lcd_config_offline;
wire [1:0] lcd_config_padding0;
wire lcd_config_cs_polarity;
wire lcd_config_clk_polarity;
wire lcd_config_clk_phase;
wire lcd_config_lsb_first;
wire lcd_config_half_duplex;
wire [7:0] lcd_config_padding1;
wire [7:0] lcd_config_div_write;
wire [7:0] lcd_config_div_read;
wire [15:0] lcd_xfer_cs;
wire [5:0] lcd_xfer_write_length;
wire [1:0] lcd_xfer_padding0;
wire [5:0] lcd_xfer_read_length;
wire [1:0] lcd_xfer_padding1;
wire lcd_start;
reg lcd_active = 1'd0;
reg lcd_pending0 = 1'd0;
wire [31:0] lcd_mosi_data;
wire [31:0] lcd_miso_data;
reg [7:0] lcd_machine_load = 8'd0;
wire lcd_machine_bias0;
wire lcd_machine_edge;
reg lcd_machine_clk = 1'd1;
reg [7:0] lcd_machine_cnt = 8'd0;
reg lcd_machine_bias1 = 1'd0;
wire lcd_machine_zero;
wire lcd_machine_cg_ce;
reg [31:0] lcd_machine_data = 32'd0;
wire lcd_machine_o;
wire lcd_machine_i;
wire lcd_machine_lsb;
reg lcd_machine_shift = 1'd0;
reg lcd_machine_sample = 1'd0;
wire lcd_machine_reg_ce;
reg [5:0] lcd_machine_n_read = 6'd0;
reg [5:0] lcd_machine_n_write = 6'd0;
wire lcd_machine_read;
wire lcd_machine_write;
wire lcd_machine_done0;
wire lcd_machine_bits_ce;
wire [7:0] lcd_machine_div_write;
wire [7:0] lcd_machine_div_read;
wire lcd_machine_clk_phase;
wire lcd_machine_start;
wire lcd_machine_cs;
wire lcd_machine_oe;
wire lcd_machine_done1;
wire lcd_machine_fsm_ce;
reg lcd_machine_write0 = 1'd0;
reg lcd_machine_fsm_is_ongoing0 = 1'd0;
reg lcd_machine_fsm_is_ongoing1 = 1'd0;
reg lcd_pending1 = 1'd0;
reg [15:0] lcd_cs = 16'd0;
reg [31:0] lcd_data_read = 32'd0;
reg [31:0] lcd_data_write = 32'd0;
wire lcd_cs_n_t_o;
wire lcd_cs_n_t_oe;
wire lcd_cs_n_t_i;
wire lcd_clk_t_o;
wire lcd_clk_t_oe;
wire lcd_clk_t_i;
wire lcd_mosi_t_o;
wire lcd_mosi_t_oe;
wire lcd_mosi_t_i;
reg [31:0] lcd_config_storage_full = 32'd0;
wire [31:0] lcd_config_storage;
reg lcd_config_re = 1'd0;
reg [31:0] lcd_xfer_storage_full = 32'd0;
wire [31:0] lcd_xfer_storage;
reg lcd_xfer_re = 1'd0;
wire lcd_start_re;
wire lcd_start_r;
reg lcd_start_w = 1'd0;
wire lcd_active_status;
wire lcd_pending_status;
reg [31:0] lcd_mosi_data_storage_full = 32'd0;
wire [31:0] lcd_mosi_data_storage;
reg lcd_mosi_data_re = 1'd0;
wire [31:0] lcd_miso_data_status;
reg [3:0] display_sel_storage_full = 4'd0;
wire [3:0] display_sel_storage;
reg display_sel_re = 1'd0;
reg [3:0] display_value_storage_full = 4'd0;
wire [3:0] display_value_storage;
reg display_value_re = 1'd0;
wire display_write_re;
wire display_write_r;
reg display_write_w = 1'd0;
wire [5:0] display_cs0;
wire [6:0] display_abcdefg0;
reg [4:0] display_values0 = 5'd0;
reg [4:0] display_values1 = 5'd0;
reg [4:0] display_values2 = 5'd0;
reg [4:0] display_values3 = 5'd0;
reg [4:0] display_values4 = 5'd0;
reg [4:0] display_values5 = 5'd0;
wire [5:0] display_cs1;
wire [6:0] display_abcdefg1;
reg [3:0] display_value = 4'd0;
reg [6:0] display_abcdefg2 = 7'd0;
reg display_enable = 1'd1;
wire display_ce;
reg [16:0] display_counter = 17'd0;
reg [5:0] display_cs2 = 6'd1;
reg [1:0] spimaster0_state = 2'd0;
reg [1:0] spimaster0_next_state = 2'd0;
reg [1:0] spimaster1_state = 2'd0;
reg [1:0] spimaster1_next_state = 2'd0;
wire [29:0] shared_adr;
wire [31:0] shared_dat_w;
reg [31:0] shared_dat_r = 32'd0;
wire [3:0] shared_sel;
wire shared_cyc;
wire shared_stb;
reg shared_ack = 1'd0;
wire shared_we;
wire [2:0] shared_cti;
wire [1:0] shared_bte;
wire shared_err;
wire [1:0] request;
reg grant = 1'd0;
reg [3:0] slave_sel = 4'd0;
reg [3:0] slave_sel_r = 4'd0;
reg error = 1'd0;
wire wait_1;
wire done;
reg [19:0] count = 20'd1000000;
wire [13:0] interface0_bank_bus_adr;
wire interface0_bank_bus_we;
wire [7:0] interface0_bank_bus_dat_w;
reg [7:0] interface0_bank_bus_dat_r = 8'd0;
wire csrbank0_config3_re;
wire [7:0] csrbank0_config3_r;
wire [7:0] csrbank0_config3_w;
wire csrbank0_config2_re;
wire [7:0] csrbank0_config2_r;
wire [7:0] csrbank0_config2_w;
wire csrbank0_config1_re;
wire [7:0] csrbank0_config1_r;
wire [7:0] csrbank0_config1_w;
wire csrbank0_config0_re;
wire [7:0] csrbank0_config0_r;
wire [7:0] csrbank0_config0_w;
wire csrbank0_xfer3_re;
wire [7:0] csrbank0_xfer3_r;
wire [7:0] csrbank0_xfer3_w;
wire csrbank0_xfer2_re;
wire [7:0] csrbank0_xfer2_r;
wire [7:0] csrbank0_xfer2_w;
wire csrbank0_xfer1_re;
wire [7:0] csrbank0_xfer1_r;
wire [7:0] csrbank0_xfer1_w;
wire csrbank0_xfer0_re;
wire [7:0] csrbank0_xfer0_r;
wire [7:0] csrbank0_xfer0_w;
wire csrbank0_active_re;
wire csrbank0_active_r;
wire csrbank0_active_w;
wire csrbank0_pending_re;
wire csrbank0_pending_r;
wire csrbank0_pending_w;
wire csrbank0_mosi_data3_re;
wire [7:0] csrbank0_mosi_data3_r;
wire [7:0] csrbank0_mosi_data3_w;
wire csrbank0_mosi_data2_re;
wire [7:0] csrbank0_mosi_data2_r;
wire [7:0] csrbank0_mosi_data2_w;
wire csrbank0_mosi_data1_re;
wire [7:0] csrbank0_mosi_data1_r;
wire [7:0] csrbank0_mosi_data1_w;
wire csrbank0_mosi_data0_re;
wire [7:0] csrbank0_mosi_data0_r;
wire [7:0] csrbank0_mosi_data0_w;
wire csrbank0_miso_data3_re;
wire [7:0] csrbank0_miso_data3_r;
wire [7:0] csrbank0_miso_data3_w;
wire csrbank0_miso_data2_re;
wire [7:0] csrbank0_miso_data2_r;
wire [7:0] csrbank0_miso_data2_w;
wire csrbank0_miso_data1_re;
wire [7:0] csrbank0_miso_data1_r;
wire [7:0] csrbank0_miso_data1_w;
wire csrbank0_miso_data0_re;
wire [7:0] csrbank0_miso_data0_r;
wire [7:0] csrbank0_miso_data0_w;
wire csrbank0_sel;
wire [13:0] interface1_bank_bus_adr;
wire interface1_bank_bus_we;
wire [7:0] interface1_bank_bus_dat_w;
reg [7:0] interface1_bank_bus_dat_r = 8'd0;
wire csrbank1_in_re;
wire [4:0] csrbank1_in_r;
wire [4:0] csrbank1_in_w;
wire csrbank1_sel;
wire [13:0] interface2_bank_bus_adr;
wire interface2_bank_bus_we;
wire [7:0] interface2_bank_bus_dat_w;
reg [7:0] interface2_bank_bus_dat_r = 8'd0;
wire csrbank2_scratch3_re;
wire [7:0] csrbank2_scratch3_r;
wire [7:0] csrbank2_scratch3_w;
wire csrbank2_scratch2_re;
wire [7:0] csrbank2_scratch2_r;
wire [7:0] csrbank2_scratch2_w;
wire csrbank2_scratch1_re;
wire [7:0] csrbank2_scratch1_r;
wire [7:0] csrbank2_scratch1_w;
wire csrbank2_scratch0_re;
wire [7:0] csrbank2_scratch0_r;
wire [7:0] csrbank2_scratch0_w;
wire csrbank2_bus_errors3_re;
wire [7:0] csrbank2_bus_errors3_r;
wire [7:0] csrbank2_bus_errors3_w;
wire csrbank2_bus_errors2_re;
wire [7:0] csrbank2_bus_errors2_r;
wire [7:0] csrbank2_bus_errors2_w;
wire csrbank2_bus_errors1_re;
wire [7:0] csrbank2_bus_errors1_r;
wire [7:0] csrbank2_bus_errors1_w;
wire csrbank2_bus_errors0_re;
wire [7:0] csrbank2_bus_errors0_r;
wire [7:0] csrbank2_bus_errors0_w;
wire csrbank2_sel;
wire [13:0] interface3_bank_bus_adr;
wire interface3_bank_bus_we;
wire [7:0] interface3_bank_bus_dat_w;
reg [7:0] interface3_bank_bus_dat_r = 8'd0;
wire csrbank3_sel0_re;
wire [3:0] csrbank3_sel0_r;
wire [3:0] csrbank3_sel0_w;
wire csrbank3_value0_re;
wire [3:0] csrbank3_value0_r;
wire [3:0] csrbank3_value0_w;
wire csrbank3_sel;
wire [13:0] interface4_bank_bus_adr;
wire interface4_bank_bus_we;
wire [7:0] interface4_bank_bus_dat_w;
reg [7:0] interface4_bank_bus_dat_r = 8'd0;
wire csrbank4_id7_re;
wire csrbank4_id7_r;
wire csrbank4_id7_w;
wire csrbank4_id6_re;
wire [7:0] csrbank4_id6_r;
wire [7:0] csrbank4_id6_w;
wire csrbank4_id5_re;
wire [7:0] csrbank4_id5_r;
wire [7:0] csrbank4_id5_w;
wire csrbank4_id4_re;
wire [7:0] csrbank4_id4_r;
wire [7:0] csrbank4_id4_w;
wire csrbank4_id3_re;
wire [7:0] csrbank4_id3_r;
wire [7:0] csrbank4_id3_w;
wire csrbank4_id2_re;
wire [7:0] csrbank4_id2_r;
wire [7:0] csrbank4_id2_w;
wire csrbank4_id1_re;
wire [7:0] csrbank4_id1_r;
wire [7:0] csrbank4_id1_w;
wire csrbank4_id0_re;
wire [7:0] csrbank4_id0_r;
wire [7:0] csrbank4_id0_w;
wire csrbank4_sel;
wire [13:0] sram_bus_adr;
wire sram_bus_we;
wire [7:0] sram_bus_dat_w;
reg [7:0] sram_bus_dat_r = 8'd0;
wire [5:0] adr;
wire [7:0] dat_r;
wire sel;
reg sel_r = 1'd0;
wire [13:0] interface5_bank_bus_adr;
wire interface5_bank_bus_we;
wire [7:0] interface5_bank_bus_dat_w;
reg [7:0] interface5_bank_bus_dat_r = 8'd0;
wire csrbank5_config3_re;
wire [7:0] csrbank5_config3_r;
wire [7:0] csrbank5_config3_w;
wire csrbank5_config2_re;
wire [7:0] csrbank5_config2_r;
wire [7:0] csrbank5_config2_w;
wire csrbank5_config1_re;
wire [7:0] csrbank5_config1_r;
wire [7:0] csrbank5_config1_w;
wire csrbank5_config0_re;
wire [7:0] csrbank5_config0_r;
wire [7:0] csrbank5_config0_w;
wire csrbank5_xfer3_re;
wire [7:0] csrbank5_xfer3_r;
wire [7:0] csrbank5_xfer3_w;
wire csrbank5_xfer2_re;
wire [7:0] csrbank5_xfer2_r;
wire [7:0] csrbank5_xfer2_w;
wire csrbank5_xfer1_re;
wire [7:0] csrbank5_xfer1_r;
wire [7:0] csrbank5_xfer1_w;
wire csrbank5_xfer0_re;
wire [7:0] csrbank5_xfer0_r;
wire [7:0] csrbank5_xfer0_w;
wire csrbank5_active_re;
wire csrbank5_active_r;
wire csrbank5_active_w;
wire csrbank5_pending_re;
wire csrbank5_pending_r;
wire csrbank5_pending_w;
wire csrbank5_mosi_data3_re;
wire [7:0] csrbank5_mosi_data3_r;
wire [7:0] csrbank5_mosi_data3_w;
wire csrbank5_mosi_data2_re;
wire [7:0] csrbank5_mosi_data2_r;
wire [7:0] csrbank5_mosi_data2_w;
wire csrbank5_mosi_data1_re;
wire [7:0] csrbank5_mosi_data1_r;
wire [7:0] csrbank5_mosi_data1_w;
wire csrbank5_mosi_data0_re;
wire [7:0] csrbank5_mosi_data0_r;
wire [7:0] csrbank5_mosi_data0_w;
wire csrbank5_miso_data3_re;
wire [7:0] csrbank5_miso_data3_r;
wire [7:0] csrbank5_miso_data3_w;
wire csrbank5_miso_data2_re;
wire [7:0] csrbank5_miso_data2_r;
wire [7:0] csrbank5_miso_data2_w;
wire csrbank5_miso_data1_re;
wire [7:0] csrbank5_miso_data1_r;
wire [7:0] csrbank5_miso_data1_w;
wire csrbank5_miso_data0_re;
wire [7:0] csrbank5_miso_data0_r;
wire [7:0] csrbank5_miso_data0_w;
wire csrbank5_sel;
wire [13:0] interface6_bank_bus_adr;
wire interface6_bank_bus_we;
wire [7:0] interface6_bank_bus_dat_w;
reg [7:0] interface6_bank_bus_dat_r = 8'd0;
wire csrbank6_out1_re;
wire [7:0] csrbank6_out1_r;
wire [7:0] csrbank6_out1_w;
wire csrbank6_out0_re;
wire [7:0] csrbank6_out0_r;
wire [7:0] csrbank6_out0_w;
wire csrbank6_sel;
wire [13:0] interface7_bank_bus_adr;
wire interface7_bank_bus_we;
wire [7:0] interface7_bank_bus_dat_w;
reg [7:0] interface7_bank_bus_dat_r = 8'd0;
wire csrbank7_r_enable0_re;
wire csrbank7_r_enable0_r;
wire csrbank7_r_enable0_w;
wire csrbank7_r_width3_re;
wire [7:0] csrbank7_r_width3_r;
wire [7:0] csrbank7_r_width3_w;
wire csrbank7_r_width2_re;
wire [7:0] csrbank7_r_width2_r;
wire [7:0] csrbank7_r_width2_w;
wire csrbank7_r_width1_re;
wire [7:0] csrbank7_r_width1_r;
wire [7:0] csrbank7_r_width1_w;
wire csrbank7_r_width0_re;
wire [7:0] csrbank7_r_width0_r;
wire [7:0] csrbank7_r_width0_w;
wire csrbank7_r_period3_re;
wire [7:0] csrbank7_r_period3_r;
wire [7:0] csrbank7_r_period3_w;
wire csrbank7_r_period2_re;
wire [7:0] csrbank7_r_period2_r;
wire [7:0] csrbank7_r_period2_w;
wire csrbank7_r_period1_re;
wire [7:0] csrbank7_r_period1_r;
wire [7:0] csrbank7_r_period1_w;
wire csrbank7_r_period0_re;
wire [7:0] csrbank7_r_period0_r;
wire [7:0] csrbank7_r_period0_w;
wire csrbank7_g_enable0_re;
wire csrbank7_g_enable0_r;
wire csrbank7_g_enable0_w;
wire csrbank7_g_width3_re;
wire [7:0] csrbank7_g_width3_r;
wire [7:0] csrbank7_g_width3_w;
wire csrbank7_g_width2_re;
wire [7:0] csrbank7_g_width2_r;
wire [7:0] csrbank7_g_width2_w;
wire csrbank7_g_width1_re;
wire [7:0] csrbank7_g_width1_r;
wire [7:0] csrbank7_g_width1_w;
wire csrbank7_g_width0_re;
wire [7:0] csrbank7_g_width0_r;
wire [7:0] csrbank7_g_width0_w;
wire csrbank7_g_period3_re;
wire [7:0] csrbank7_g_period3_r;
wire [7:0] csrbank7_g_period3_w;
wire csrbank7_g_period2_re;
wire [7:0] csrbank7_g_period2_r;
wire [7:0] csrbank7_g_period2_w;
wire csrbank7_g_period1_re;
wire [7:0] csrbank7_g_period1_r;
wire [7:0] csrbank7_g_period1_w;
wire csrbank7_g_period0_re;
wire [7:0] csrbank7_g_period0_r;
wire [7:0] csrbank7_g_period0_w;
wire csrbank7_b_enable0_re;
wire csrbank7_b_enable0_r;
wire csrbank7_b_enable0_w;
wire csrbank7_b_width3_re;
wire [7:0] csrbank7_b_width3_r;
wire [7:0] csrbank7_b_width3_w;
wire csrbank7_b_width2_re;
wire [7:0] csrbank7_b_width2_r;
wire [7:0] csrbank7_b_width2_w;
wire csrbank7_b_width1_re;
wire [7:0] csrbank7_b_width1_r;
wire [7:0] csrbank7_b_width1_w;
wire csrbank7_b_width0_re;
wire [7:0] csrbank7_b_width0_r;
wire [7:0] csrbank7_b_width0_w;
wire csrbank7_b_period3_re;
wire [7:0] csrbank7_b_period3_r;
wire [7:0] csrbank7_b_period3_w;
wire csrbank7_b_period2_re;
wire [7:0] csrbank7_b_period2_r;
wire [7:0] csrbank7_b_period2_w;
wire csrbank7_b_period1_re;
wire [7:0] csrbank7_b_period1_r;
wire [7:0] csrbank7_b_period1_w;
wire csrbank7_b_period0_re;
wire [7:0] csrbank7_b_period0_r;
wire [7:0] csrbank7_b_period0_w;
wire csrbank7_sel;
wire [13:0] interface8_bank_bus_adr;
wire interface8_bank_bus_we;
wire [7:0] interface8_bank_bus_dat_w;
reg [7:0] interface8_bank_bus_dat_r = 8'd0;
wire csrbank8_in1_re;
wire [7:0] csrbank8_in1_r;
wire [7:0] csrbank8_in1_w;
wire csrbank8_in0_re;
wire [7:0] csrbank8_in0_r;
wire [7:0] csrbank8_in0_w;
wire csrbank8_sel;
wire [13:0] interface9_bank_bus_adr;
wire interface9_bank_bus_we;
wire [7:0] interface9_bank_bus_dat_w;
reg [7:0] interface9_bank_bus_dat_r = 8'd0;
wire csrbank9_load3_re;
wire [7:0] csrbank9_load3_r;
wire [7:0] csrbank9_load3_w;
wire csrbank9_load2_re;
wire [7:0] csrbank9_load2_r;
wire [7:0] csrbank9_load2_w;
wire csrbank9_load1_re;
wire [7:0] csrbank9_load1_r;
wire [7:0] csrbank9_load1_w;
wire csrbank9_load0_re;
wire [7:0] csrbank9_load0_r;
wire [7:0] csrbank9_load0_w;
wire csrbank9_reload3_re;
wire [7:0] csrbank9_reload3_r;
wire [7:0] csrbank9_reload3_w;
wire csrbank9_reload2_re;
wire [7:0] csrbank9_reload2_r;
wire [7:0] csrbank9_reload2_w;
wire csrbank9_reload1_re;
wire [7:0] csrbank9_reload1_r;
wire [7:0] csrbank9_reload1_w;
wire csrbank9_reload0_re;
wire [7:0] csrbank9_reload0_r;
wire [7:0] csrbank9_reload0_w;
wire csrbank9_en0_re;
wire csrbank9_en0_r;
wire csrbank9_en0_w;
wire csrbank9_value3_re;
wire [7:0] csrbank9_value3_r;
wire [7:0] csrbank9_value3_w;
wire csrbank9_value2_re;
wire [7:0] csrbank9_value2_r;
wire [7:0] csrbank9_value2_w;
wire csrbank9_value1_re;
wire [7:0] csrbank9_value1_r;
wire [7:0] csrbank9_value1_w;
wire csrbank9_value0_re;
wire [7:0] csrbank9_value0_r;
wire [7:0] csrbank9_value0_w;
wire csrbank9_ev_enable0_re;
wire csrbank9_ev_enable0_r;
wire csrbank9_ev_enable0_w;
wire csrbank9_sel;
wire [13:0] interface10_bank_bus_adr;
wire interface10_bank_bus_we;
wire [7:0] interface10_bank_bus_dat_w;
reg [7:0] interface10_bank_bus_dat_r = 8'd0;
wire csrbank10_txfull_re;
wire csrbank10_txfull_r;
wire csrbank10_txfull_w;
wire csrbank10_rxempty_re;
wire csrbank10_rxempty_r;
wire csrbank10_rxempty_w;
wire csrbank10_ev_enable0_re;
wire [1:0] csrbank10_ev_enable0_r;
wire [1:0] csrbank10_ev_enable0_w;
wire csrbank10_sel;
wire [13:0] interface11_bank_bus_adr;
wire interface11_bank_bus_we;
wire [7:0] interface11_bank_bus_dat_w;
reg [7:0] interface11_bank_bus_dat_r = 8'd0;
wire csrbank11_tuning_word3_re;
wire [7:0] csrbank11_tuning_word3_r;
wire [7:0] csrbank11_tuning_word3_w;
wire csrbank11_tuning_word2_re;
wire [7:0] csrbank11_tuning_word2_r;
wire [7:0] csrbank11_tuning_word2_w;
wire csrbank11_tuning_word1_re;
wire [7:0] csrbank11_tuning_word1_r;
wire [7:0] csrbank11_tuning_word1_w;
wire csrbank11_tuning_word0_re;
wire [7:0] csrbank11_tuning_word0_r;
wire [7:0] csrbank11_tuning_word0_w;
wire csrbank11_sel;
wire [13:0] interface12_bank_bus_adr;
wire interface12_bank_bus_we;
wire [7:0] interface12_bank_bus_dat_w;
reg [7:0] interface12_bank_bus_dat_r = 8'd0;
wire csrbank12_temperature1_re;
wire [3:0] csrbank12_temperature1_r;
wire [3:0] csrbank12_temperature1_w;
wire csrbank12_temperature0_re;
wire [7:0] csrbank12_temperature0_r;
wire [7:0] csrbank12_temperature0_w;
wire csrbank12_vccint1_re;
wire [3:0] csrbank12_vccint1_r;
wire [3:0] csrbank12_vccint1_w;
wire csrbank12_vccint0_re;
wire [7:0] csrbank12_vccint0_r;
wire [7:0] csrbank12_vccint0_w;
wire csrbank12_vccaux1_re;
wire [3:0] csrbank12_vccaux1_r;
wire [3:0] csrbank12_vccaux1_w;
wire csrbank12_vccaux0_re;
wire [7:0] csrbank12_vccaux0_r;
wire [7:0] csrbank12_vccaux0_w;
wire csrbank12_vccbram1_re;
wire [3:0] csrbank12_vccbram1_r;
wire [3:0] csrbank12_vccbram1_w;
wire csrbank12_vccbram0_re;
wire [7:0] csrbank12_vccbram0_r;
wire [7:0] csrbank12_vccbram0_w;
wire csrbank12_sel;
reg [29:0] array_muxed0 = 30'd0;
reg [31:0] array_muxed1 = 32'd0;
reg [3:0] array_muxed2 = 4'd0;
reg array_muxed3 = 1'd0;
reg array_muxed4 = 1'd0;
reg array_muxed5 = 1'd0;
reg [2:0] array_muxed6 = 3'd0;
reg [1:0] array_muxed7 = 2'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg xilinxmultiregimpl0_regs0 = 1'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg xilinxmultiregimpl0_regs1 = 1'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg [15:0] xilinxmultiregimpl1_regs0 = 16'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg [15:0] xilinxmultiregimpl1_regs1 = 16'd0;
wire xilinxmultiregimpl1;
(* register_balancing = "no", shreg_extract = "no" *) reg [4:0] xilinxmultiregimpl2_regs0 = 5'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg [4:0] xilinxmultiregimpl2_regs1 = 5'd0;
wire xilinxmultiregimpl2;

assign basesoc_lm32_reset = basesoc_ctrl_reset;
assign display_cs_n = (~display_cs0);
assign display_abcdefg = (~display_abcdefg0);
assign basesoc_ctrl_bus_error = error;
always @(*) begin
	basesoc_lm32_interrupt <= 32'd0;
	basesoc_lm32_interrupt[1] <= basesoc_timer0_irq;
	basesoc_lm32_interrupt[2] <= basesoc_uart_irq;
end
assign basesoc_ctrl_reset = basesoc_ctrl_reset_reset_re;
assign basesoc_ctrl_bus_errors_status = basesoc_ctrl_bus_errors;
assign basesoc_lm32_ibus_adr = basesoc_lm32_i_adr_o[31:2];
assign basesoc_lm32_dbus_adr = basesoc_lm32_d_adr_o[31:2];
assign basesoc_rom_adr = basesoc_rom_bus_adr[12:0];
assign basesoc_rom_bus_dat_r = basesoc_rom_dat_r;
always @(*) begin
	basesoc_sram_we <= 4'd0;
	basesoc_sram_we[0] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[0]);
	basesoc_sram_we[1] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[1]);
	basesoc_sram_we[2] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[2]);
	basesoc_sram_we[3] <= (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & basesoc_sram_bus_we) & basesoc_sram_bus_sel[3]);
end
assign basesoc_sram_adr = basesoc_sram_bus_adr[9:0];
assign basesoc_sram_bus_dat_r = basesoc_sram_dat_r;
assign basesoc_sram_dat_w = basesoc_sram_bus_dat_w;
always @(*) begin
	basesoc_main_ram_we <= 4'd0;
	basesoc_main_ram_we[0] <= (((basesoc_main_ram_bus_cyc & basesoc_main_ram_bus_stb) & basesoc_main_ram_bus_we) & basesoc_main_ram_bus_sel[0]);
	basesoc_main_ram_we[1] <= (((basesoc_main_ram_bus_cyc & basesoc_main_ram_bus_stb) & basesoc_main_ram_bus_we) & basesoc_main_ram_bus_sel[1]);
	basesoc_main_ram_we[2] <= (((basesoc_main_ram_bus_cyc & basesoc_main_ram_bus_stb) & basesoc_main_ram_bus_we) & basesoc_main_ram_bus_sel[2]);
	basesoc_main_ram_we[3] <= (((basesoc_main_ram_bus_cyc & basesoc_main_ram_bus_stb) & basesoc_main_ram_bus_we) & basesoc_main_ram_bus_sel[3]);
end
assign basesoc_main_ram_adr = basesoc_main_ram_bus_adr[11:0];
assign basesoc_main_ram_bus_dat_r = basesoc_main_ram_dat_r;
assign basesoc_main_ram_dat_w = basesoc_main_ram_bus_dat_w;
assign basesoc_uart_tx_fifo_sink_valid = basesoc_uart_rxtx_re;
assign basesoc_uart_tx_fifo_sink_payload_data = basesoc_uart_rxtx_r;
assign basesoc_uart_txfull_status = (~basesoc_uart_tx_fifo_sink_ready);
assign basesoc_uart_phy_sink_valid = basesoc_uart_tx_fifo_source_valid;
assign basesoc_uart_tx_fifo_source_ready = basesoc_uart_phy_sink_ready;
assign basesoc_uart_phy_sink_first = basesoc_uart_tx_fifo_source_first;
assign basesoc_uart_phy_sink_last = basesoc_uart_tx_fifo_source_last;
assign basesoc_uart_phy_sink_payload_data = basesoc_uart_tx_fifo_source_payload_data;
assign basesoc_uart_tx_trigger = (~basesoc_uart_tx_fifo_sink_ready);
assign basesoc_uart_rx_fifo_sink_valid = basesoc_uart_phy_source_valid;
assign basesoc_uart_phy_source_ready = basesoc_uart_rx_fifo_sink_ready;
assign basesoc_uart_rx_fifo_sink_first = basesoc_uart_phy_source_first;
assign basesoc_uart_rx_fifo_sink_last = basesoc_uart_phy_source_last;
assign basesoc_uart_rx_fifo_sink_payload_data = basesoc_uart_phy_source_payload_data;
assign basesoc_uart_rxempty_status = (~basesoc_uart_rx_fifo_source_valid);
assign basesoc_uart_rxtx_w = basesoc_uart_rx_fifo_source_payload_data;
assign basesoc_uart_rx_fifo_source_ready = basesoc_uart_rx_clear;
assign basesoc_uart_rx_trigger = (~basesoc_uart_rx_fifo_source_valid);
always @(*) begin
	basesoc_uart_tx_clear <= 1'd0;
	if ((basesoc_uart_eventmanager_pending_re & basesoc_uart_eventmanager_pending_r[0])) begin
		basesoc_uart_tx_clear <= 1'd1;
	end
end
always @(*) begin
	basesoc_uart_eventmanager_status_w <= 2'd0;
	basesoc_uart_eventmanager_status_w[0] <= basesoc_uart_tx_status;
	basesoc_uart_eventmanager_status_w[1] <= basesoc_uart_rx_status;
end
always @(*) begin
	basesoc_uart_rx_clear <= 1'd0;
	if ((basesoc_uart_eventmanager_pending_re & basesoc_uart_eventmanager_pending_r[1])) begin
		basesoc_uart_rx_clear <= 1'd1;
	end
end
always @(*) begin
	basesoc_uart_eventmanager_pending_w <= 2'd0;
	basesoc_uart_eventmanager_pending_w[0] <= basesoc_uart_tx_pending;
	basesoc_uart_eventmanager_pending_w[1] <= basesoc_uart_rx_pending;
end
assign basesoc_uart_irq = ((basesoc_uart_eventmanager_pending_w[0] & basesoc_uart_eventmanager_storage[0]) | (basesoc_uart_eventmanager_pending_w[1] & basesoc_uart_eventmanager_storage[1]));
assign basesoc_uart_tx_status = basesoc_uart_tx_trigger;
assign basesoc_uart_rx_status = basesoc_uart_rx_trigger;
assign basesoc_uart_tx_fifo_syncfifo_din = {basesoc_uart_tx_fifo_fifo_in_last, basesoc_uart_tx_fifo_fifo_in_first, basesoc_uart_tx_fifo_fifo_in_payload_data};
assign {basesoc_uart_tx_fifo_fifo_out_last, basesoc_uart_tx_fifo_fifo_out_first, basesoc_uart_tx_fifo_fifo_out_payload_data} = basesoc_uart_tx_fifo_syncfifo_dout;
assign basesoc_uart_tx_fifo_sink_ready = basesoc_uart_tx_fifo_syncfifo_writable;
assign basesoc_uart_tx_fifo_syncfifo_we = basesoc_uart_tx_fifo_sink_valid;
assign basesoc_uart_tx_fifo_fifo_in_first = basesoc_uart_tx_fifo_sink_first;
assign basesoc_uart_tx_fifo_fifo_in_last = basesoc_uart_tx_fifo_sink_last;
assign basesoc_uart_tx_fifo_fifo_in_payload_data = basesoc_uart_tx_fifo_sink_payload_data;
assign basesoc_uart_tx_fifo_source_valid = basesoc_uart_tx_fifo_readable;
assign basesoc_uart_tx_fifo_source_first = basesoc_uart_tx_fifo_fifo_out_first;
assign basesoc_uart_tx_fifo_source_last = basesoc_uart_tx_fifo_fifo_out_last;
assign basesoc_uart_tx_fifo_source_payload_data = basesoc_uart_tx_fifo_fifo_out_payload_data;
assign basesoc_uart_tx_fifo_re = basesoc_uart_tx_fifo_source_ready;
assign basesoc_uart_tx_fifo_syncfifo_re = (basesoc_uart_tx_fifo_syncfifo_readable & ((~basesoc_uart_tx_fifo_readable) | basesoc_uart_tx_fifo_re));
assign basesoc_uart_tx_fifo_level1 = (basesoc_uart_tx_fifo_level0 + basesoc_uart_tx_fifo_readable);
always @(*) begin
	basesoc_uart_tx_fifo_wrport_adr <= 4'd0;
	if (basesoc_uart_tx_fifo_replace) begin
		basesoc_uart_tx_fifo_wrport_adr <= (basesoc_uart_tx_fifo_produce - 1'd1);
	end else begin
		basesoc_uart_tx_fifo_wrport_adr <= basesoc_uart_tx_fifo_produce;
	end
end
assign basesoc_uart_tx_fifo_wrport_dat_w = basesoc_uart_tx_fifo_syncfifo_din;
assign basesoc_uart_tx_fifo_wrport_we = (basesoc_uart_tx_fifo_syncfifo_we & (basesoc_uart_tx_fifo_syncfifo_writable | basesoc_uart_tx_fifo_replace));
assign basesoc_uart_tx_fifo_do_read = (basesoc_uart_tx_fifo_syncfifo_readable & basesoc_uart_tx_fifo_syncfifo_re);
assign basesoc_uart_tx_fifo_rdport_adr = basesoc_uart_tx_fifo_consume;
assign basesoc_uart_tx_fifo_syncfifo_dout = basesoc_uart_tx_fifo_rdport_dat_r;
assign basesoc_uart_tx_fifo_rdport_re = basesoc_uart_tx_fifo_do_read;
assign basesoc_uart_tx_fifo_syncfifo_writable = (basesoc_uart_tx_fifo_level0 != 5'd16);
assign basesoc_uart_tx_fifo_syncfifo_readable = (basesoc_uart_tx_fifo_level0 != 1'd0);
assign basesoc_uart_rx_fifo_syncfifo_din = {basesoc_uart_rx_fifo_fifo_in_last, basesoc_uart_rx_fifo_fifo_in_first, basesoc_uart_rx_fifo_fifo_in_payload_data};
assign {basesoc_uart_rx_fifo_fifo_out_last, basesoc_uart_rx_fifo_fifo_out_first, basesoc_uart_rx_fifo_fifo_out_payload_data} = basesoc_uart_rx_fifo_syncfifo_dout;
assign basesoc_uart_rx_fifo_sink_ready = basesoc_uart_rx_fifo_syncfifo_writable;
assign basesoc_uart_rx_fifo_syncfifo_we = basesoc_uart_rx_fifo_sink_valid;
assign basesoc_uart_rx_fifo_fifo_in_first = basesoc_uart_rx_fifo_sink_first;
assign basesoc_uart_rx_fifo_fifo_in_last = basesoc_uart_rx_fifo_sink_last;
assign basesoc_uart_rx_fifo_fifo_in_payload_data = basesoc_uart_rx_fifo_sink_payload_data;
assign basesoc_uart_rx_fifo_source_valid = basesoc_uart_rx_fifo_readable;
assign basesoc_uart_rx_fifo_source_first = basesoc_uart_rx_fifo_fifo_out_first;
assign basesoc_uart_rx_fifo_source_last = basesoc_uart_rx_fifo_fifo_out_last;
assign basesoc_uart_rx_fifo_source_payload_data = basesoc_uart_rx_fifo_fifo_out_payload_data;
assign basesoc_uart_rx_fifo_re = basesoc_uart_rx_fifo_source_ready;
assign basesoc_uart_rx_fifo_syncfifo_re = (basesoc_uart_rx_fifo_syncfifo_readable & ((~basesoc_uart_rx_fifo_readable) | basesoc_uart_rx_fifo_re));
assign basesoc_uart_rx_fifo_level1 = (basesoc_uart_rx_fifo_level0 + basesoc_uart_rx_fifo_readable);
always @(*) begin
	basesoc_uart_rx_fifo_wrport_adr <= 4'd0;
	if (basesoc_uart_rx_fifo_replace) begin
		basesoc_uart_rx_fifo_wrport_adr <= (basesoc_uart_rx_fifo_produce - 1'd1);
	end else begin
		basesoc_uart_rx_fifo_wrport_adr <= basesoc_uart_rx_fifo_produce;
	end
end
assign basesoc_uart_rx_fifo_wrport_dat_w = basesoc_uart_rx_fifo_syncfifo_din;
assign basesoc_uart_rx_fifo_wrport_we = (basesoc_uart_rx_fifo_syncfifo_we & (basesoc_uart_rx_fifo_syncfifo_writable | basesoc_uart_rx_fifo_replace));
assign basesoc_uart_rx_fifo_do_read = (basesoc_uart_rx_fifo_syncfifo_readable & basesoc_uart_rx_fifo_syncfifo_re);
assign basesoc_uart_rx_fifo_rdport_adr = basesoc_uart_rx_fifo_consume;
assign basesoc_uart_rx_fifo_syncfifo_dout = basesoc_uart_rx_fifo_rdport_dat_r;
assign basesoc_uart_rx_fifo_rdport_re = basesoc_uart_rx_fifo_do_read;
assign basesoc_uart_rx_fifo_syncfifo_writable = (basesoc_uart_rx_fifo_level0 != 5'd16);
assign basesoc_uart_rx_fifo_syncfifo_readable = (basesoc_uart_rx_fifo_level0 != 1'd0);
assign basesoc_timer0_zero_trigger = (basesoc_timer0_value != 1'd0);
assign basesoc_timer0_eventmanager_status_w = basesoc_timer0_zero_status;
always @(*) begin
	basesoc_timer0_zero_clear <= 1'd0;
	if ((basesoc_timer0_eventmanager_pending_re & basesoc_timer0_eventmanager_pending_r)) begin
		basesoc_timer0_zero_clear <= 1'd1;
	end
end
assign basesoc_timer0_eventmanager_pending_w = basesoc_timer0_zero_pending;
assign basesoc_timer0_irq = (basesoc_timer0_eventmanager_pending_w & basesoc_timer0_eventmanager_storage);
assign basesoc_timer0_zero_status = basesoc_timer0_zero_trigger;
assign sys_clk = clk100;
assign por_clk = clk100;
assign sys_rst = int_rst;
assign {user_led15, user_led14, user_led13, user_led12, user_led11, user_led10, user_led9, user_led8, user_led7, user_led6, user_led5, user_led4, user_led3, user_led2, user_led1, user_led0} = storage;
assign r_enable = r_enable_storage;
assign r_width = r_width_storage;
assign r_period = r_period_storage;
assign g_enable = g_enable_storage;
assign g_width = g_width_storage;
assign g_period = g_period_storage;
assign b_enable = b_enable_storage;
assign b_width = b_width_storage;
assign b_period = b_period_storage;
assign {adxl362_config_div_read, adxl362_config_div_write, adxl362_config_padding1, adxl362_config_half_duplex, adxl362_config_lsb_first, adxl362_config_clk_phase, adxl362_config_clk_polarity, adxl362_config_cs_polarity, adxl362_config_padding0, adxl362_config_offline} = adxl362_config_storage;
assign {adxl362_xfer_padding1, adxl362_xfer_read_length, adxl362_xfer_padding0, adxl362_xfer_write_length, adxl362_xfer_cs} = adxl362_xfer_storage;
assign adxl362_start = (adxl362_start_re & adxl362_start_r);
assign adxl362_active_status = adxl362_active;
assign adxl362_pending_status = adxl362_pending0;
assign adxl362_mosi_data = adxl362_mosi_data_storage;
assign adxl362_miso_data_status = adxl362_miso_data;
assign adxl362_miso_data = adxl362_data_read;
assign adxl362_machine_start = (adxl362_pending1 & ((~adxl362_machine_cs) | adxl362_machine_done1));
assign adxl362_machine_clk_phase = adxl362_config_clk_phase;
assign adxl362_machine_lsb = adxl362_config_lsb_first;
assign adxl362_machine_div_write = adxl362_config_div_write;
assign adxl362_machine_div_read = adxl362_config_div_read;
assign adxl362_cs_n_t_oe = (~adxl362_config_offline);
assign adxl362_cs_n_t_o = ((adxl362_cs & {16{adxl362_machine_cs}}) ^ {16{(~adxl362_config_cs_polarity)}});
assign adxl362_clk_t_oe = (~adxl362_config_offline);
assign adxl362_clk_t_o = ((adxl362_machine_clk & adxl362_machine_cs) ^ adxl362_config_clk_polarity);
assign adxl362_mosi_t_oe = (((~adxl362_config_offline) & adxl362_machine_cs) & (adxl362_machine_oe | (~adxl362_config_half_duplex)));
assign adxl362_mosi_t_o = adxl362_machine_o;
assign adxl362_machine_i = (adxl362_config_half_duplex ? adxl362_mosi_t_i : adxl362_spi_miso);
assign adxl362_machine_cg_ce = ((adxl362_machine_start | adxl362_machine_cs) | (~adxl362_machine_edge));
always @(*) begin
	adxl362_machine_load <= 8'd0;
	if ((adxl362_machine_write | (~adxl362_machine_read))) begin
		adxl362_machine_load <= adxl362_machine_div_write;
	end else begin
		adxl362_machine_load <= adxl362_machine_div_read;
	end
end
assign adxl362_machine_bias0 = adxl362_machine_clk_phase;
assign adxl362_machine_fsm_ce = adxl362_machine_edge;
assign adxl362_machine_cs = (~adxl362_machine_fsm_is_ongoing0);
assign adxl362_machine_reg_ce = adxl362_machine_edge;
assign adxl362_machine_bits_ce = (adxl362_machine_edge & adxl362_machine_sample);
assign adxl362_machine_done1 = ((adxl362_machine_edge & adxl362_machine_done0) & adxl362_machine_fsm_is_ongoing1);
assign adxl362_machine_oe = (adxl362_machine_write0 | adxl362_machine_write);
assign adxl362_machine_zero = (adxl362_machine_cnt == 1'd0);
assign adxl362_machine_edge = (adxl362_machine_zero & (~adxl362_machine_bias1));
assign adxl362_machine_o = (adxl362_machine_lsb ? adxl362_machine_data[0] : adxl362_machine_data[31]);
assign adxl362_machine_write = (adxl362_machine_n_write != 1'd0);
assign adxl362_machine_read = (adxl362_machine_n_read != 1'd0);
assign adxl362_machine_done0 = (~(adxl362_machine_write | adxl362_machine_read));
always @(*) begin
	adxl362_machine_fsm_is_ongoing0 <= 1'd0;
	adxl362_machine_sample <= 1'd0;
	spimaster0_next_state <= 2'd0;
	adxl362_machine_fsm_is_ongoing1 <= 1'd0;
	adxl362_machine_shift <= 1'd0;
	spimaster0_next_state <= spimaster0_state;
	case (spimaster0_state)
		1'd1: begin
			adxl362_machine_sample <= 1'd1;
			spimaster0_next_state <= 2'd2;
		end
		2'd2: begin
			if ((adxl362_machine_done0 & (~adxl362_machine_start))) begin
				if (adxl362_machine_clk_phase) begin
					spimaster0_next_state <= 1'd0;
				end else begin
					spimaster0_next_state <= 2'd3;
				end
			end else begin
				adxl362_machine_shift <= (~adxl362_machine_start);
				spimaster0_next_state <= 1'd1;
			end
			adxl362_machine_fsm_is_ongoing1 <= 1'd1;
		end
		2'd3: begin
			if (adxl362_machine_done0) begin
				spimaster0_next_state <= 1'd0;
			end else begin
				spimaster0_next_state <= 1'd1;
			end
		end
		default: begin
			if (adxl362_machine_start) begin
				if (adxl362_machine_clk_phase) begin
					spimaster0_next_state <= 2'd3;
				end else begin
					spimaster0_next_state <= 1'd1;
				end
			end
			adxl362_machine_fsm_is_ongoing0 <= 1'd1;
		end
	endcase
end
assign {lcd_config_div_read, lcd_config_div_write, lcd_config_padding1, lcd_config_half_duplex, lcd_config_lsb_first, lcd_config_clk_phase, lcd_config_clk_polarity, lcd_config_cs_polarity, lcd_config_padding0, lcd_config_offline} = lcd_config_storage;
assign {lcd_xfer_padding1, lcd_xfer_read_length, lcd_xfer_padding0, lcd_xfer_write_length, lcd_xfer_cs} = lcd_xfer_storage;
assign lcd_start = (lcd_start_re & lcd_start_r);
assign lcd_active_status = lcd_active;
assign lcd_pending_status = lcd_pending0;
assign lcd_mosi_data = lcd_mosi_data_storage;
assign lcd_miso_data_status = lcd_miso_data;
assign lcd_miso_data = lcd_data_read;
assign lcd_machine_start = (lcd_pending1 & ((~lcd_machine_cs) | lcd_machine_done1));
assign lcd_machine_clk_phase = lcd_config_clk_phase;
assign lcd_machine_lsb = lcd_config_lsb_first;
assign lcd_machine_div_write = lcd_config_div_write;
assign lcd_machine_div_read = lcd_config_div_read;
assign lcd_cs_n_t_oe = (~lcd_config_offline);
assign lcd_cs_n_t_o = ((lcd_cs & {16{lcd_machine_cs}}) ^ {16{(~lcd_config_cs_polarity)}});
assign lcd_clk_t_oe = (~lcd_config_offline);
assign lcd_clk_t_o = ((lcd_machine_clk & lcd_machine_cs) ^ lcd_config_clk_polarity);
assign lcd_mosi_t_oe = (((~lcd_config_offline) & lcd_machine_cs) & (lcd_machine_oe | (~lcd_config_half_duplex)));
assign lcd_mosi_t_o = lcd_machine_o;
assign lcd_machine_i = (lcd_config_half_duplex ? lcd_mosi_t_i : lcd_spi_miso);
assign lcd_machine_cg_ce = ((lcd_machine_start | lcd_machine_cs) | (~lcd_machine_edge));
always @(*) begin
	lcd_machine_load <= 8'd0;
	if ((lcd_machine_write | (~lcd_machine_read))) begin
		lcd_machine_load <= lcd_machine_div_write;
	end else begin
		lcd_machine_load <= lcd_machine_div_read;
	end
end
assign lcd_machine_bias0 = lcd_machine_clk_phase;
assign lcd_machine_fsm_ce = lcd_machine_edge;
assign lcd_machine_cs = (~lcd_machine_fsm_is_ongoing0);
assign lcd_machine_reg_ce = lcd_machine_edge;
assign lcd_machine_bits_ce = (lcd_machine_edge & lcd_machine_sample);
assign lcd_machine_done1 = ((lcd_machine_edge & lcd_machine_done0) & lcd_machine_fsm_is_ongoing1);
assign lcd_machine_oe = (lcd_machine_write0 | lcd_machine_write);
assign lcd_machine_zero = (lcd_machine_cnt == 1'd0);
assign lcd_machine_edge = (lcd_machine_zero & (~lcd_machine_bias1));
assign lcd_machine_o = (lcd_machine_lsb ? lcd_machine_data[0] : lcd_machine_data[31]);
assign lcd_machine_write = (lcd_machine_n_write != 1'd0);
assign lcd_machine_read = (lcd_machine_n_read != 1'd0);
assign lcd_machine_done0 = (~(lcd_machine_write | lcd_machine_read));
always @(*) begin
	lcd_machine_fsm_is_ongoing1 <= 1'd0;
	spimaster1_next_state <= 2'd0;
	lcd_machine_shift <= 1'd0;
	lcd_machine_fsm_is_ongoing0 <= 1'd0;
	lcd_machine_sample <= 1'd0;
	spimaster1_next_state <= spimaster1_state;
	case (spimaster1_state)
		1'd1: begin
			lcd_machine_sample <= 1'd1;
			spimaster1_next_state <= 2'd2;
		end
		2'd2: begin
			if ((lcd_machine_done0 & (~lcd_machine_start))) begin
				if (lcd_machine_clk_phase) begin
					spimaster1_next_state <= 1'd0;
				end else begin
					spimaster1_next_state <= 2'd3;
				end
			end else begin
				lcd_machine_shift <= (~lcd_machine_start);
				spimaster1_next_state <= 1'd1;
			end
			lcd_machine_fsm_is_ongoing1 <= 1'd1;
		end
		2'd3: begin
			if (lcd_machine_done0) begin
				spimaster1_next_state <= 1'd0;
			end else begin
				spimaster1_next_state <= 1'd1;
			end
		end
		default: begin
			if (lcd_machine_start) begin
				if (lcd_machine_clk_phase) begin
					spimaster1_next_state <= 2'd3;
				end else begin
					spimaster1_next_state <= 1'd1;
				end
			end
			lcd_machine_fsm_is_ongoing0 <= 1'd1;
		end
	endcase
end
assign display_cs0 = display_cs1;
assign display_abcdefg0 = display_abcdefg1;
assign display_abcdefg1 = display_abcdefg2;
assign display_cs1 = display_cs2;
always @(*) begin
	display_value <= 4'd0;
	case (display_cs1)
		1'd1: begin
			display_value <= display_values0;
		end
		2'd2: begin
			display_value <= display_values1;
		end
		3'd4: begin
			display_value <= display_values2;
		end
		4'd8: begin
			display_value <= display_values3;
		end
		5'd16: begin
			display_value <= display_values4;
		end
		6'd32: begin
			display_value <= display_values5;
		end
	endcase
end
always @(*) begin
	display_abcdefg2 <= 7'd0;
	case (display_value)
		1'd0: begin
			display_abcdefg2 <= 6'd63;
		end
		1'd1: begin
			display_abcdefg2 <= 3'd6;
		end
		2'd2: begin
			display_abcdefg2 <= 7'd91;
		end
		2'd3: begin
			display_abcdefg2 <= 7'd79;
		end
		3'd4: begin
			display_abcdefg2 <= 7'd102;
		end
		3'd5: begin
			display_abcdefg2 <= 7'd109;
		end
		3'd6: begin
			display_abcdefg2 <= 7'd125;
		end
		3'd7: begin
			display_abcdefg2 <= 3'd7;
		end
		4'd8: begin
			display_abcdefg2 <= 7'd127;
		end
		4'd9: begin
			display_abcdefg2 <= 7'd111;
		end
		4'd10: begin
			display_abcdefg2 <= 7'd119;
		end
		4'd11: begin
			display_abcdefg2 <= 7'd124;
		end
		4'd12: begin
			display_abcdefg2 <= 6'd57;
		end
		4'd13: begin
			display_abcdefg2 <= 7'd94;
		end
		4'd14: begin
			display_abcdefg2 <= 7'd121;
		end
		4'd15: begin
			display_abcdefg2 <= 7'd113;
		end
	endcase
end
assign display_ce = (display_counter == 1'd0);
assign shared_adr = array_muxed0;
assign shared_dat_w = array_muxed1;
assign shared_sel = array_muxed2;
assign shared_cyc = array_muxed3;
assign shared_stb = array_muxed4;
assign shared_we = array_muxed5;
assign shared_cti = array_muxed6;
assign shared_bte = array_muxed7;
assign basesoc_lm32_ibus_dat_r = shared_dat_r;
assign basesoc_lm32_dbus_dat_r = shared_dat_r;
assign basesoc_lm32_ibus_ack = (shared_ack & (grant == 1'd0));
assign basesoc_lm32_dbus_ack = (shared_ack & (grant == 1'd1));
assign basesoc_lm32_ibus_err = (shared_err & (grant == 1'd0));
assign basesoc_lm32_dbus_err = (shared_err & (grant == 1'd1));
assign request = {basesoc_lm32_dbus_cyc, basesoc_lm32_ibus_cyc};
always @(*) begin
	slave_sel <= 4'd0;
	slave_sel[0] <= (shared_adr[28:26] == 1'd0);
	slave_sel[1] <= (shared_adr[28:26] == 1'd1);
	slave_sel[2] <= (shared_adr[28:26] == 3'd4);
	slave_sel[3] <= (shared_adr[28:26] == 3'd6);
end
assign basesoc_rom_bus_adr = shared_adr;
assign basesoc_rom_bus_dat_w = shared_dat_w;
assign basesoc_rom_bus_sel = shared_sel;
assign basesoc_rom_bus_stb = shared_stb;
assign basesoc_rom_bus_we = shared_we;
assign basesoc_rom_bus_cti = shared_cti;
assign basesoc_rom_bus_bte = shared_bte;
assign basesoc_sram_bus_adr = shared_adr;
assign basesoc_sram_bus_dat_w = shared_dat_w;
assign basesoc_sram_bus_sel = shared_sel;
assign basesoc_sram_bus_stb = shared_stb;
assign basesoc_sram_bus_we = shared_we;
assign basesoc_sram_bus_cti = shared_cti;
assign basesoc_sram_bus_bte = shared_bte;
assign basesoc_main_ram_bus_adr = shared_adr;
assign basesoc_main_ram_bus_dat_w = shared_dat_w;
assign basesoc_main_ram_bus_sel = shared_sel;
assign basesoc_main_ram_bus_stb = shared_stb;
assign basesoc_main_ram_bus_we = shared_we;
assign basesoc_main_ram_bus_cti = shared_cti;
assign basesoc_main_ram_bus_bte = shared_bte;
assign basesoc_bus_wishbone_adr = shared_adr;
assign basesoc_bus_wishbone_dat_w = shared_dat_w;
assign basesoc_bus_wishbone_sel = shared_sel;
assign basesoc_bus_wishbone_stb = shared_stb;
assign basesoc_bus_wishbone_we = shared_we;
assign basesoc_bus_wishbone_cti = shared_cti;
assign basesoc_bus_wishbone_bte = shared_bte;
assign basesoc_rom_bus_cyc = (shared_cyc & slave_sel[0]);
assign basesoc_sram_bus_cyc = (shared_cyc & slave_sel[1]);
assign basesoc_main_ram_bus_cyc = (shared_cyc & slave_sel[2]);
assign basesoc_bus_wishbone_cyc = (shared_cyc & slave_sel[3]);
assign shared_err = (((basesoc_rom_bus_err | basesoc_sram_bus_err) | basesoc_main_ram_bus_err) | basesoc_bus_wishbone_err);
assign wait_1 = ((shared_stb & shared_cyc) & (~shared_ack));
always @(*) begin
	shared_dat_r <= 32'd0;
	shared_ack <= 1'd0;
	error <= 1'd0;
	shared_ack <= (((basesoc_rom_bus_ack | basesoc_sram_bus_ack) | basesoc_main_ram_bus_ack) | basesoc_bus_wishbone_ack);
	shared_dat_r <= (((({32{slave_sel_r[0]}} & basesoc_rom_bus_dat_r) | ({32{slave_sel_r[1]}} & basesoc_sram_bus_dat_r)) | ({32{slave_sel_r[2]}} & basesoc_main_ram_bus_dat_r)) | ({32{slave_sel_r[3]}} & basesoc_bus_wishbone_dat_r));
	if (done) begin
		shared_dat_r <= 32'd4294967295;
		shared_ack <= 1'd1;
		error <= 1'd1;
	end
end
assign done = (count == 1'd0);
assign csrbank0_sel = (interface0_bank_bus_adr[13:9] == 4'd14);
assign csrbank0_config3_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_config3_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 1'd0));
assign csrbank0_config2_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_config2_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 1'd1));
assign csrbank0_config1_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_config1_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 2'd2));
assign csrbank0_config0_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_config0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 2'd3));
assign csrbank0_xfer3_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_xfer3_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 3'd4));
assign csrbank0_xfer2_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_xfer2_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 3'd5));
assign csrbank0_xfer1_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_xfer1_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 3'd6));
assign csrbank0_xfer0_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_xfer0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 3'd7));
assign adxl362_start_r = interface0_bank_bus_dat_w[0];
assign adxl362_start_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 4'd8));
assign csrbank0_active_r = interface0_bank_bus_dat_w[0];
assign csrbank0_active_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 4'd9));
assign csrbank0_pending_r = interface0_bank_bus_dat_w[0];
assign csrbank0_pending_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 4'd10));
assign csrbank0_mosi_data3_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_mosi_data3_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 4'd11));
assign csrbank0_mosi_data2_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_mosi_data2_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 4'd12));
assign csrbank0_mosi_data1_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_mosi_data1_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 4'd13));
assign csrbank0_mosi_data0_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_mosi_data0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 4'd14));
assign csrbank0_miso_data3_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_miso_data3_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 4'd15));
assign csrbank0_miso_data2_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_miso_data2_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 5'd16));
assign csrbank0_miso_data1_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_miso_data1_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 5'd17));
assign csrbank0_miso_data0_r = interface0_bank_bus_dat_w[7:0];
assign csrbank0_miso_data0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[4:0] == 5'd18));
assign adxl362_config_storage = adxl362_config_storage_full[31:0];
assign csrbank0_config3_w = adxl362_config_storage_full[31:24];
assign csrbank0_config2_w = adxl362_config_storage_full[23:16];
assign csrbank0_config1_w = adxl362_config_storage_full[15:8];
assign csrbank0_config0_w = adxl362_config_storage_full[7:0];
assign adxl362_xfer_storage = adxl362_xfer_storage_full[31:0];
assign csrbank0_xfer3_w = adxl362_xfer_storage_full[31:24];
assign csrbank0_xfer2_w = adxl362_xfer_storage_full[23:16];
assign csrbank0_xfer1_w = adxl362_xfer_storage_full[15:8];
assign csrbank0_xfer0_w = adxl362_xfer_storage_full[7:0];
assign csrbank0_active_w = adxl362_active_status;
assign csrbank0_pending_w = adxl362_pending_status;
assign adxl362_mosi_data_storage = adxl362_mosi_data_storage_full[31:0];
assign csrbank0_mosi_data3_w = adxl362_mosi_data_storage_full[31:24];
assign csrbank0_mosi_data2_w = adxl362_mosi_data_storage_full[23:16];
assign csrbank0_mosi_data1_w = adxl362_mosi_data_storage_full[15:8];
assign csrbank0_mosi_data0_w = adxl362_mosi_data_storage_full[7:0];
assign csrbank0_miso_data3_w = adxl362_miso_data_status[31:24];
assign csrbank0_miso_data2_w = adxl362_miso_data_status[23:16];
assign csrbank0_miso_data1_w = adxl362_miso_data_status[15:8];
assign csrbank0_miso_data0_w = adxl362_miso_data_status[7:0];
assign csrbank1_sel = (interface1_bank_bus_adr[13:9] == 4'd13);
assign csrbank1_in_r = interface1_bank_bus_dat_w[4:0];
assign csrbank1_in_re = ((csrbank1_sel & interface1_bank_bus_we) & (interface1_bank_bus_adr[0] == 1'd0));
assign csrbank1_in_w = buttons_status[4:0];
assign csrbank2_sel = (interface2_bank_bus_adr[13:9] == 1'd0);
assign basesoc_ctrl_reset_reset_r = interface2_bank_bus_dat_w[0];
assign basesoc_ctrl_reset_reset_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[3:0] == 1'd0));
assign csrbank2_scratch3_r = interface2_bank_bus_dat_w[7:0];
assign csrbank2_scratch3_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[3:0] == 1'd1));
assign csrbank2_scratch2_r = interface2_bank_bus_dat_w[7:0];
assign csrbank2_scratch2_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[3:0] == 2'd2));
assign csrbank2_scratch1_r = interface2_bank_bus_dat_w[7:0];
assign csrbank2_scratch1_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[3:0] == 2'd3));
assign csrbank2_scratch0_r = interface2_bank_bus_dat_w[7:0];
assign csrbank2_scratch0_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[3:0] == 3'd4));
assign csrbank2_bus_errors3_r = interface2_bank_bus_dat_w[7:0];
assign csrbank2_bus_errors3_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[3:0] == 3'd5));
assign csrbank2_bus_errors2_r = interface2_bank_bus_dat_w[7:0];
assign csrbank2_bus_errors2_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[3:0] == 3'd6));
assign csrbank2_bus_errors1_r = interface2_bank_bus_dat_w[7:0];
assign csrbank2_bus_errors1_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[3:0] == 3'd7));
assign csrbank2_bus_errors0_r = interface2_bank_bus_dat_w[7:0];
assign csrbank2_bus_errors0_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[3:0] == 4'd8));
assign basesoc_ctrl_storage = basesoc_ctrl_storage_full[31:0];
assign csrbank2_scratch3_w = basesoc_ctrl_storage_full[31:24];
assign csrbank2_scratch2_w = basesoc_ctrl_storage_full[23:16];
assign csrbank2_scratch1_w = basesoc_ctrl_storage_full[15:8];
assign csrbank2_scratch0_w = basesoc_ctrl_storage_full[7:0];
assign csrbank2_bus_errors3_w = basesoc_ctrl_bus_errors_status[31:24];
assign csrbank2_bus_errors2_w = basesoc_ctrl_bus_errors_status[23:16];
assign csrbank2_bus_errors1_w = basesoc_ctrl_bus_errors_status[15:8];
assign csrbank2_bus_errors0_w = basesoc_ctrl_bus_errors_status[7:0];
assign csrbank3_sel = (interface3_bank_bus_adr[13:9] == 4'd15);
assign csrbank3_sel0_r = interface3_bank_bus_dat_w[3:0];
assign csrbank3_sel0_re = ((csrbank3_sel & interface3_bank_bus_we) & (interface3_bank_bus_adr[1:0] == 1'd0));
assign csrbank3_value0_r = interface3_bank_bus_dat_w[3:0];
assign csrbank3_value0_re = ((csrbank3_sel & interface3_bank_bus_we) & (interface3_bank_bus_adr[1:0] == 1'd1));
assign display_write_r = interface3_bank_bus_dat_w[0];
assign display_write_re = ((csrbank3_sel & interface3_bank_bus_we) & (interface3_bank_bus_adr[1:0] == 2'd2));
assign display_sel_storage = display_sel_storage_full[3:0];
assign csrbank3_sel0_w = display_sel_storage_full[3:0];
assign display_value_storage = display_value_storage_full[3:0];
assign csrbank3_value0_w = display_value_storage_full[3:0];
assign csrbank4_sel = (interface4_bank_bus_adr[13:9] == 4'd8);
assign csrbank4_id7_r = interface4_bank_bus_dat_w[0];
assign csrbank4_id7_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[2:0] == 1'd0));
assign csrbank4_id6_r = interface4_bank_bus_dat_w[7:0];
assign csrbank4_id6_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[2:0] == 1'd1));
assign csrbank4_id5_r = interface4_bank_bus_dat_w[7:0];
assign csrbank4_id5_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[2:0] == 2'd2));
assign csrbank4_id4_r = interface4_bank_bus_dat_w[7:0];
assign csrbank4_id4_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[2:0] == 2'd3));
assign csrbank4_id3_r = interface4_bank_bus_dat_w[7:0];
assign csrbank4_id3_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[2:0] == 3'd4));
assign csrbank4_id2_r = interface4_bank_bus_dat_w[7:0];
assign csrbank4_id2_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[2:0] == 3'd5));
assign csrbank4_id1_r = interface4_bank_bus_dat_w[7:0];
assign csrbank4_id1_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[2:0] == 3'd6));
assign csrbank4_id0_r = interface4_bank_bus_dat_w[7:0];
assign csrbank4_id0_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[2:0] == 3'd7));
assign csrbank4_id7_w = dna_status[56];
assign csrbank4_id6_w = dna_status[55:48];
assign csrbank4_id5_w = dna_status[47:40];
assign csrbank4_id4_w = dna_status[39:32];
assign csrbank4_id3_w = dna_status[31:24];
assign csrbank4_id2_w = dna_status[23:16];
assign csrbank4_id1_w = dna_status[15:8];
assign csrbank4_id0_w = dna_status[7:0];
assign sel = (sram_bus_adr[13:9] == 3'd4);
always @(*) begin
	sram_bus_dat_r <= 8'd0;
	if (sel_r) begin
		sram_bus_dat_r <= dat_r;
	end
end
assign adr = sram_bus_adr[5:0];
assign csrbank5_sel = (interface5_bank_bus_adr[13:9] == 5'd17);
assign csrbank5_config3_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_config3_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 1'd0));
assign csrbank5_config2_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_config2_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 1'd1));
assign csrbank5_config1_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_config1_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 2'd2));
assign csrbank5_config0_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_config0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 2'd3));
assign csrbank5_xfer3_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_xfer3_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 3'd4));
assign csrbank5_xfer2_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_xfer2_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 3'd5));
assign csrbank5_xfer1_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_xfer1_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 3'd6));
assign csrbank5_xfer0_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_xfer0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 3'd7));
assign lcd_start_r = interface5_bank_bus_dat_w[0];
assign lcd_start_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 4'd8));
assign csrbank5_active_r = interface5_bank_bus_dat_w[0];
assign csrbank5_active_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 4'd9));
assign csrbank5_pending_r = interface5_bank_bus_dat_w[0];
assign csrbank5_pending_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 4'd10));
assign csrbank5_mosi_data3_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_mosi_data3_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 4'd11));
assign csrbank5_mosi_data2_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_mosi_data2_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 4'd12));
assign csrbank5_mosi_data1_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_mosi_data1_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 4'd13));
assign csrbank5_mosi_data0_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_mosi_data0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 4'd14));
assign csrbank5_miso_data3_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_miso_data3_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 4'd15));
assign csrbank5_miso_data2_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_miso_data2_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 5'd16));
assign csrbank5_miso_data1_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_miso_data1_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 5'd17));
assign csrbank5_miso_data0_r = interface5_bank_bus_dat_w[7:0];
assign csrbank5_miso_data0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[4:0] == 5'd18));
assign lcd_config_storage = lcd_config_storage_full[31:0];
assign csrbank5_config3_w = lcd_config_storage_full[31:24];
assign csrbank5_config2_w = lcd_config_storage_full[23:16];
assign csrbank5_config1_w = lcd_config_storage_full[15:8];
assign csrbank5_config0_w = lcd_config_storage_full[7:0];
assign lcd_xfer_storage = lcd_xfer_storage_full[31:0];
assign csrbank5_xfer3_w = lcd_xfer_storage_full[31:24];
assign csrbank5_xfer2_w = lcd_xfer_storage_full[23:16];
assign csrbank5_xfer1_w = lcd_xfer_storage_full[15:8];
assign csrbank5_xfer0_w = lcd_xfer_storage_full[7:0];
assign csrbank5_active_w = lcd_active_status;
assign csrbank5_pending_w = lcd_pending_status;
assign lcd_mosi_data_storage = lcd_mosi_data_storage_full[31:0];
assign csrbank5_mosi_data3_w = lcd_mosi_data_storage_full[31:24];
assign csrbank5_mosi_data2_w = lcd_mosi_data_storage_full[23:16];
assign csrbank5_mosi_data1_w = lcd_mosi_data_storage_full[15:8];
assign csrbank5_mosi_data0_w = lcd_mosi_data_storage_full[7:0];
assign csrbank5_miso_data3_w = lcd_miso_data_status[31:24];
assign csrbank5_miso_data2_w = lcd_miso_data_status[23:16];
assign csrbank5_miso_data1_w = lcd_miso_data_status[15:8];
assign csrbank5_miso_data0_w = lcd_miso_data_status[7:0];
assign csrbank6_sel = (interface6_bank_bus_adr[13:9] == 4'd11);
assign csrbank6_out1_r = interface6_bank_bus_dat_w[7:0];
assign csrbank6_out1_re = ((csrbank6_sel & interface6_bank_bus_we) & (interface6_bank_bus_adr[0] == 1'd0));
assign csrbank6_out0_r = interface6_bank_bus_dat_w[7:0];
assign csrbank6_out0_re = ((csrbank6_sel & interface6_bank_bus_we) & (interface6_bank_bus_adr[0] == 1'd1));
assign storage = storage_full[15:0];
assign csrbank6_out1_w = storage_full[15:8];
assign csrbank6_out0_w = storage_full[7:0];
assign csrbank7_sel = (interface7_bank_bus_adr[13:9] == 4'd10);
assign csrbank7_r_enable0_r = interface7_bank_bus_dat_w[0];
assign csrbank7_r_enable0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 1'd0));
assign csrbank7_r_width3_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_r_width3_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 1'd1));
assign csrbank7_r_width2_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_r_width2_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 2'd2));
assign csrbank7_r_width1_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_r_width1_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 2'd3));
assign csrbank7_r_width0_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_r_width0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 3'd4));
assign csrbank7_r_period3_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_r_period3_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 3'd5));
assign csrbank7_r_period2_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_r_period2_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 3'd6));
assign csrbank7_r_period1_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_r_period1_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 3'd7));
assign csrbank7_r_period0_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_r_period0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 4'd8));
assign csrbank7_g_enable0_r = interface7_bank_bus_dat_w[0];
assign csrbank7_g_enable0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 4'd9));
assign csrbank7_g_width3_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_g_width3_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 4'd10));
assign csrbank7_g_width2_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_g_width2_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 4'd11));
assign csrbank7_g_width1_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_g_width1_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 4'd12));
assign csrbank7_g_width0_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_g_width0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 4'd13));
assign csrbank7_g_period3_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_g_period3_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 4'd14));
assign csrbank7_g_period2_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_g_period2_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 4'd15));
assign csrbank7_g_period1_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_g_period1_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd16));
assign csrbank7_g_period0_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_g_period0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd17));
assign csrbank7_b_enable0_r = interface7_bank_bus_dat_w[0];
assign csrbank7_b_enable0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd18));
assign csrbank7_b_width3_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_b_width3_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd19));
assign csrbank7_b_width2_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_b_width2_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd20));
assign csrbank7_b_width1_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_b_width1_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd21));
assign csrbank7_b_width0_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_b_width0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd22));
assign csrbank7_b_period3_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_b_period3_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd23));
assign csrbank7_b_period2_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_b_period2_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd24));
assign csrbank7_b_period1_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_b_period1_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd25));
assign csrbank7_b_period0_r = interface7_bank_bus_dat_w[7:0];
assign csrbank7_b_period0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[4:0] == 5'd26));
assign r_enable_storage = r_enable_storage_full;
assign csrbank7_r_enable0_w = r_enable_storage_full;
assign r_width_storage = r_width_storage_full[31:0];
assign csrbank7_r_width3_w = r_width_storage_full[31:24];
assign csrbank7_r_width2_w = r_width_storage_full[23:16];
assign csrbank7_r_width1_w = r_width_storage_full[15:8];
assign csrbank7_r_width0_w = r_width_storage_full[7:0];
assign r_period_storage = r_period_storage_full[31:0];
assign csrbank7_r_period3_w = r_period_storage_full[31:24];
assign csrbank7_r_period2_w = r_period_storage_full[23:16];
assign csrbank7_r_period1_w = r_period_storage_full[15:8];
assign csrbank7_r_period0_w = r_period_storage_full[7:0];
assign g_enable_storage = g_enable_storage_full;
assign csrbank7_g_enable0_w = g_enable_storage_full;
assign g_width_storage = g_width_storage_full[31:0];
assign csrbank7_g_width3_w = g_width_storage_full[31:24];
assign csrbank7_g_width2_w = g_width_storage_full[23:16];
assign csrbank7_g_width1_w = g_width_storage_full[15:8];
assign csrbank7_g_width0_w = g_width_storage_full[7:0];
assign g_period_storage = g_period_storage_full[31:0];
assign csrbank7_g_period3_w = g_period_storage_full[31:24];
assign csrbank7_g_period2_w = g_period_storage_full[23:16];
assign csrbank7_g_period1_w = g_period_storage_full[15:8];
assign csrbank7_g_period0_w = g_period_storage_full[7:0];
assign b_enable_storage = b_enable_storage_full;
assign csrbank7_b_enable0_w = b_enable_storage_full;
assign b_width_storage = b_width_storage_full[31:0];
assign csrbank7_b_width3_w = b_width_storage_full[31:24];
assign csrbank7_b_width2_w = b_width_storage_full[23:16];
assign csrbank7_b_width1_w = b_width_storage_full[15:8];
assign csrbank7_b_width0_w = b_width_storage_full[7:0];
assign b_period_storage = b_period_storage_full[31:0];
assign csrbank7_b_period3_w = b_period_storage_full[31:24];
assign csrbank7_b_period2_w = b_period_storage_full[23:16];
assign csrbank7_b_period1_w = b_period_storage_full[15:8];
assign csrbank7_b_period0_w = b_period_storage_full[7:0];
assign csrbank8_sel = (interface8_bank_bus_adr[13:9] == 4'd12);
assign csrbank8_in1_r = interface8_bank_bus_dat_w[7:0];
assign csrbank8_in1_re = ((csrbank8_sel & interface8_bank_bus_we) & (interface8_bank_bus_adr[0] == 1'd0));
assign csrbank8_in0_r = interface8_bank_bus_dat_w[7:0];
assign csrbank8_in0_re = ((csrbank8_sel & interface8_bank_bus_we) & (interface8_bank_bus_adr[0] == 1'd1));
assign csrbank8_in1_w = switches_status[15:8];
assign csrbank8_in0_w = switches_status[7:0];
assign csrbank9_sel = (interface9_bank_bus_adr[13:9] == 3'd5);
assign csrbank9_load3_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_load3_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 1'd0));
assign csrbank9_load2_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_load2_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 1'd1));
assign csrbank9_load1_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_load1_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 2'd2));
assign csrbank9_load0_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_load0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 2'd3));
assign csrbank9_reload3_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_reload3_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 3'd4));
assign csrbank9_reload2_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_reload2_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 3'd5));
assign csrbank9_reload1_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_reload1_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 3'd6));
assign csrbank9_reload0_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_reload0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 3'd7));
assign csrbank9_en0_r = interface9_bank_bus_dat_w[0];
assign csrbank9_en0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 4'd8));
assign basesoc_timer0_update_value_r = interface9_bank_bus_dat_w[0];
assign basesoc_timer0_update_value_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 4'd9));
assign csrbank9_value3_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_value3_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 4'd10));
assign csrbank9_value2_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_value2_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 4'd11));
assign csrbank9_value1_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_value1_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 4'd12));
assign csrbank9_value0_r = interface9_bank_bus_dat_w[7:0];
assign csrbank9_value0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 4'd13));
assign basesoc_timer0_eventmanager_status_r = interface9_bank_bus_dat_w[0];
assign basesoc_timer0_eventmanager_status_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 4'd14));
assign basesoc_timer0_eventmanager_pending_r = interface9_bank_bus_dat_w[0];
assign basesoc_timer0_eventmanager_pending_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 4'd15));
assign csrbank9_ev_enable0_r = interface9_bank_bus_dat_w[0];
assign csrbank9_ev_enable0_re = ((csrbank9_sel & interface9_bank_bus_we) & (interface9_bank_bus_adr[4:0] == 5'd16));
assign basesoc_timer0_load_storage = basesoc_timer0_load_storage_full[31:0];
assign csrbank9_load3_w = basesoc_timer0_load_storage_full[31:24];
assign csrbank9_load2_w = basesoc_timer0_load_storage_full[23:16];
assign csrbank9_load1_w = basesoc_timer0_load_storage_full[15:8];
assign csrbank9_load0_w = basesoc_timer0_load_storage_full[7:0];
assign basesoc_timer0_reload_storage = basesoc_timer0_reload_storage_full[31:0];
assign csrbank9_reload3_w = basesoc_timer0_reload_storage_full[31:24];
assign csrbank9_reload2_w = basesoc_timer0_reload_storage_full[23:16];
assign csrbank9_reload1_w = basesoc_timer0_reload_storage_full[15:8];
assign csrbank9_reload0_w = basesoc_timer0_reload_storage_full[7:0];
assign basesoc_timer0_en_storage = basesoc_timer0_en_storage_full;
assign csrbank9_en0_w = basesoc_timer0_en_storage_full;
assign csrbank9_value3_w = basesoc_timer0_value_status[31:24];
assign csrbank9_value2_w = basesoc_timer0_value_status[23:16];
assign csrbank9_value1_w = basesoc_timer0_value_status[15:8];
assign csrbank9_value0_w = basesoc_timer0_value_status[7:0];
assign basesoc_timer0_eventmanager_storage = basesoc_timer0_eventmanager_storage_full;
assign csrbank9_ev_enable0_w = basesoc_timer0_eventmanager_storage_full;
assign csrbank10_sel = (interface10_bank_bus_adr[13:9] == 2'd3);
assign basesoc_uart_rxtx_r = interface10_bank_bus_dat_w[7:0];
assign basesoc_uart_rxtx_re = ((csrbank10_sel & interface10_bank_bus_we) & (interface10_bank_bus_adr[2:0] == 1'd0));
assign csrbank10_txfull_r = interface10_bank_bus_dat_w[0];
assign csrbank10_txfull_re = ((csrbank10_sel & interface10_bank_bus_we) & (interface10_bank_bus_adr[2:0] == 1'd1));
assign csrbank10_rxempty_r = interface10_bank_bus_dat_w[0];
assign csrbank10_rxempty_re = ((csrbank10_sel & interface10_bank_bus_we) & (interface10_bank_bus_adr[2:0] == 2'd2));
assign basesoc_uart_eventmanager_status_r = interface10_bank_bus_dat_w[1:0];
assign basesoc_uart_eventmanager_status_re = ((csrbank10_sel & interface10_bank_bus_we) & (interface10_bank_bus_adr[2:0] == 2'd3));
assign basesoc_uart_eventmanager_pending_r = interface10_bank_bus_dat_w[1:0];
assign basesoc_uart_eventmanager_pending_re = ((csrbank10_sel & interface10_bank_bus_we) & (interface10_bank_bus_adr[2:0] == 3'd4));
assign csrbank10_ev_enable0_r = interface10_bank_bus_dat_w[1:0];
assign csrbank10_ev_enable0_re = ((csrbank10_sel & interface10_bank_bus_we) & (interface10_bank_bus_adr[2:0] == 3'd5));
assign csrbank10_txfull_w = basesoc_uart_txfull_status;
assign csrbank10_rxempty_w = basesoc_uart_rxempty_status;
assign basesoc_uart_eventmanager_storage = basesoc_uart_eventmanager_storage_full[1:0];
assign csrbank10_ev_enable0_w = basesoc_uart_eventmanager_storage_full[1:0];
assign csrbank11_sel = (interface11_bank_bus_adr[13:9] == 2'd2);
assign csrbank11_tuning_word3_r = interface11_bank_bus_dat_w[7:0];
assign csrbank11_tuning_word3_re = ((csrbank11_sel & interface11_bank_bus_we) & (interface11_bank_bus_adr[1:0] == 1'd0));
assign csrbank11_tuning_word2_r = interface11_bank_bus_dat_w[7:0];
assign csrbank11_tuning_word2_re = ((csrbank11_sel & interface11_bank_bus_we) & (interface11_bank_bus_adr[1:0] == 1'd1));
assign csrbank11_tuning_word1_r = interface11_bank_bus_dat_w[7:0];
assign csrbank11_tuning_word1_re = ((csrbank11_sel & interface11_bank_bus_we) & (interface11_bank_bus_adr[1:0] == 2'd2));
assign csrbank11_tuning_word0_r = interface11_bank_bus_dat_w[7:0];
assign csrbank11_tuning_word0_re = ((csrbank11_sel & interface11_bank_bus_we) & (interface11_bank_bus_adr[1:0] == 2'd3));
assign basesoc_uart_phy_storage = basesoc_uart_phy_storage_full[31:0];
assign csrbank11_tuning_word3_w = basesoc_uart_phy_storage_full[31:24];
assign csrbank11_tuning_word2_w = basesoc_uart_phy_storage_full[23:16];
assign csrbank11_tuning_word1_w = basesoc_uart_phy_storage_full[15:8];
assign csrbank11_tuning_word0_w = basesoc_uart_phy_storage_full[7:0];
assign csrbank12_sel = (interface12_bank_bus_adr[13:9] == 4'd9);
assign csrbank12_temperature1_r = interface12_bank_bus_dat_w[3:0];
assign csrbank12_temperature1_re = ((csrbank12_sel & interface12_bank_bus_we) & (interface12_bank_bus_adr[2:0] == 1'd0));
assign csrbank12_temperature0_r = interface12_bank_bus_dat_w[7:0];
assign csrbank12_temperature0_re = ((csrbank12_sel & interface12_bank_bus_we) & (interface12_bank_bus_adr[2:0] == 1'd1));
assign csrbank12_vccint1_r = interface12_bank_bus_dat_w[3:0];
assign csrbank12_vccint1_re = ((csrbank12_sel & interface12_bank_bus_we) & (interface12_bank_bus_adr[2:0] == 2'd2));
assign csrbank12_vccint0_r = interface12_bank_bus_dat_w[7:0];
assign csrbank12_vccint0_re = ((csrbank12_sel & interface12_bank_bus_we) & (interface12_bank_bus_adr[2:0] == 2'd3));
assign csrbank12_vccaux1_r = interface12_bank_bus_dat_w[3:0];
assign csrbank12_vccaux1_re = ((csrbank12_sel & interface12_bank_bus_we) & (interface12_bank_bus_adr[2:0] == 3'd4));
assign csrbank12_vccaux0_r = interface12_bank_bus_dat_w[7:0];
assign csrbank12_vccaux0_re = ((csrbank12_sel & interface12_bank_bus_we) & (interface12_bank_bus_adr[2:0] == 3'd5));
assign csrbank12_vccbram1_r = interface12_bank_bus_dat_w[3:0];
assign csrbank12_vccbram1_re = ((csrbank12_sel & interface12_bank_bus_we) & (interface12_bank_bus_adr[2:0] == 3'd6));
assign csrbank12_vccbram0_r = interface12_bank_bus_dat_w[7:0];
assign csrbank12_vccbram0_re = ((csrbank12_sel & interface12_bank_bus_we) & (interface12_bank_bus_adr[2:0] == 3'd7));
assign csrbank12_temperature1_w = temperature_status[11:8];
assign csrbank12_temperature0_w = temperature_status[7:0];
assign csrbank12_vccint1_w = vccint_status[11:8];
assign csrbank12_vccint0_w = vccint_status[7:0];
assign csrbank12_vccaux1_w = vccaux_status[11:8];
assign csrbank12_vccaux0_w = vccaux_status[7:0];
assign csrbank12_vccbram1_w = vccbram_status[11:8];
assign csrbank12_vccbram0_w = vccbram_status[7:0];
assign interface0_bank_bus_adr = basesoc_interface_adr;
assign interface1_bank_bus_adr = basesoc_interface_adr;
assign interface2_bank_bus_adr = basesoc_interface_adr;
assign interface3_bank_bus_adr = basesoc_interface_adr;
assign interface4_bank_bus_adr = basesoc_interface_adr;
assign interface5_bank_bus_adr = basesoc_interface_adr;
assign interface6_bank_bus_adr = basesoc_interface_adr;
assign interface7_bank_bus_adr = basesoc_interface_adr;
assign interface8_bank_bus_adr = basesoc_interface_adr;
assign interface9_bank_bus_adr = basesoc_interface_adr;
assign interface10_bank_bus_adr = basesoc_interface_adr;
assign interface11_bank_bus_adr = basesoc_interface_adr;
assign interface12_bank_bus_adr = basesoc_interface_adr;
assign sram_bus_adr = basesoc_interface_adr;
assign interface0_bank_bus_we = basesoc_interface_we;
assign interface1_bank_bus_we = basesoc_interface_we;
assign interface2_bank_bus_we = basesoc_interface_we;
assign interface3_bank_bus_we = basesoc_interface_we;
assign interface4_bank_bus_we = basesoc_interface_we;
assign interface5_bank_bus_we = basesoc_interface_we;
assign interface6_bank_bus_we = basesoc_interface_we;
assign interface7_bank_bus_we = basesoc_interface_we;
assign interface8_bank_bus_we = basesoc_interface_we;
assign interface9_bank_bus_we = basesoc_interface_we;
assign interface10_bank_bus_we = basesoc_interface_we;
assign interface11_bank_bus_we = basesoc_interface_we;
assign interface12_bank_bus_we = basesoc_interface_we;
assign sram_bus_we = basesoc_interface_we;
assign interface0_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface1_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface2_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface3_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface4_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface5_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface6_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface7_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface8_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface9_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface10_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface11_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface12_bank_bus_dat_w = basesoc_interface_dat_w;
assign sram_bus_dat_w = basesoc_interface_dat_w;
assign basesoc_interface_dat_r = (((((((((((((interface0_bank_bus_dat_r | interface1_bank_bus_dat_r) | interface2_bank_bus_dat_r) | interface3_bank_bus_dat_r) | interface4_bank_bus_dat_r) | interface5_bank_bus_dat_r) | interface6_bank_bus_dat_r) | interface7_bank_bus_dat_r) | interface8_bank_bus_dat_r) | interface9_bank_bus_dat_r) | interface10_bank_bus_dat_r) | interface11_bank_bus_dat_r) | interface12_bank_bus_dat_r) | sram_bus_dat_r);
always @(*) begin
	array_muxed0 <= 30'd0;
	case (grant)
		1'd0: begin
			array_muxed0 <= basesoc_lm32_ibus_adr;
		end
		default: begin
			array_muxed0 <= basesoc_lm32_dbus_adr;
		end
	endcase
end
always @(*) begin
	array_muxed1 <= 32'd0;
	case (grant)
		1'd0: begin
			array_muxed1 <= basesoc_lm32_ibus_dat_w;
		end
		default: begin
			array_muxed1 <= basesoc_lm32_dbus_dat_w;
		end
	endcase
end
always @(*) begin
	array_muxed2 <= 4'd0;
	case (grant)
		1'd0: begin
			array_muxed2 <= basesoc_lm32_ibus_sel;
		end
		default: begin
			array_muxed2 <= basesoc_lm32_dbus_sel;
		end
	endcase
end
always @(*) begin
	array_muxed3 <= 1'd0;
	case (grant)
		1'd0: begin
			array_muxed3 <= basesoc_lm32_ibus_cyc;
		end
		default: begin
			array_muxed3 <= basesoc_lm32_dbus_cyc;
		end
	endcase
end
always @(*) begin
	array_muxed4 <= 1'd0;
	case (grant)
		1'd0: begin
			array_muxed4 <= basesoc_lm32_ibus_stb;
		end
		default: begin
			array_muxed4 <= basesoc_lm32_dbus_stb;
		end
	endcase
end
always @(*) begin
	array_muxed5 <= 1'd0;
	case (grant)
		1'd0: begin
			array_muxed5 <= basesoc_lm32_ibus_we;
		end
		default: begin
			array_muxed5 <= basesoc_lm32_dbus_we;
		end
	endcase
end
always @(*) begin
	array_muxed6 <= 3'd0;
	case (grant)
		1'd0: begin
			array_muxed6 <= basesoc_lm32_ibus_cti;
		end
		default: begin
			array_muxed6 <= basesoc_lm32_dbus_cti;
		end
	endcase
end
always @(*) begin
	array_muxed7 <= 2'd0;
	case (grant)
		1'd0: begin
			array_muxed7 <= basesoc_lm32_ibus_bte;
		end
		default: begin
			array_muxed7 <= basesoc_lm32_dbus_bte;
		end
	endcase
end
assign basesoc_uart_phy_rx = xilinxmultiregimpl0_regs1;
assign switches_status = xilinxmultiregimpl1_regs1;
assign xilinxmultiregimpl1 = {user_sw15, user_sw14, user_sw13, user_sw12, user_sw11, user_sw10, user_sw9, user_sw8, user_sw7, user_sw6, user_sw5, user_sw4, user_sw3, user_sw2, user_sw1, user_sw0};
assign buttons_status = xilinxmultiregimpl2_regs1;
assign xilinxmultiregimpl2 = {user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};

always @(posedge por_clk) begin
	int_rst <= (~cpu_reset);
end

always @(posedge sys_clk) begin
	if ((basesoc_ctrl_bus_errors != 32'd4294967295)) begin
		if (basesoc_ctrl_bus_error) begin
			basesoc_ctrl_bus_errors <= (basesoc_ctrl_bus_errors + 1'd1);
		end
	end
	basesoc_rom_bus_ack <= 1'd0;
	if (((basesoc_rom_bus_cyc & basesoc_rom_bus_stb) & (~basesoc_rom_bus_ack))) begin
		basesoc_rom_bus_ack <= 1'd1;
	end
	basesoc_sram_bus_ack <= 1'd0;
	if (((basesoc_sram_bus_cyc & basesoc_sram_bus_stb) & (~basesoc_sram_bus_ack))) begin
		basesoc_sram_bus_ack <= 1'd1;
	end
	basesoc_main_ram_bus_ack <= 1'd0;
	if (((basesoc_main_ram_bus_cyc & basesoc_main_ram_bus_stb) & (~basesoc_main_ram_bus_ack))) begin
		basesoc_main_ram_bus_ack <= 1'd1;
	end
	basesoc_interface_we <= 1'd0;
	basesoc_interface_dat_w <= basesoc_bus_wishbone_dat_w;
	basesoc_interface_adr <= basesoc_bus_wishbone_adr;
	basesoc_bus_wishbone_dat_r <= basesoc_interface_dat_r;
	if ((basesoc_counter == 1'd1)) begin
		basesoc_interface_we <= basesoc_bus_wishbone_we;
	end
	if ((basesoc_counter == 2'd2)) begin
		basesoc_bus_wishbone_ack <= 1'd1;
	end
	if ((basesoc_counter == 2'd3)) begin
		basesoc_bus_wishbone_ack <= 1'd0;
	end
	if ((basesoc_counter != 1'd0)) begin
		basesoc_counter <= (basesoc_counter + 1'd1);
	end else begin
		if ((basesoc_bus_wishbone_cyc & basesoc_bus_wishbone_stb)) begin
			basesoc_counter <= 1'd1;
		end
	end
	basesoc_uart_phy_sink_ready <= 1'd0;
	if (((basesoc_uart_phy_sink_valid & (~basesoc_uart_phy_tx_busy)) & (~basesoc_uart_phy_sink_ready))) begin
		basesoc_uart_phy_tx_reg <= basesoc_uart_phy_sink_payload_data;
		basesoc_uart_phy_tx_bitcount <= 1'd0;
		basesoc_uart_phy_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((basesoc_uart_phy_uart_clk_txen & basesoc_uart_phy_tx_busy)) begin
			basesoc_uart_phy_tx_bitcount <= (basesoc_uart_phy_tx_bitcount + 1'd1);
			if ((basesoc_uart_phy_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((basesoc_uart_phy_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					basesoc_uart_phy_tx_busy <= 1'd0;
					basesoc_uart_phy_sink_ready <= 1'd1;
				end else begin
					serial_tx <= basesoc_uart_phy_tx_reg[0];
					basesoc_uart_phy_tx_reg <= {1'd0, basesoc_uart_phy_tx_reg[7:1]};
				end
			end
		end
	end
	if (basesoc_uart_phy_tx_busy) begin
		{basesoc_uart_phy_uart_clk_txen, basesoc_uart_phy_phase_accumulator_tx} <= (basesoc_uart_phy_phase_accumulator_tx + basesoc_uart_phy_storage);
	end else begin
		{basesoc_uart_phy_uart_clk_txen, basesoc_uart_phy_phase_accumulator_tx} <= 1'd0;
	end
	basesoc_uart_phy_source_valid <= 1'd0;
	basesoc_uart_phy_rx_r <= basesoc_uart_phy_rx;
	if ((~basesoc_uart_phy_rx_busy)) begin
		if (((~basesoc_uart_phy_rx) & basesoc_uart_phy_rx_r)) begin
			basesoc_uart_phy_rx_busy <= 1'd1;
			basesoc_uart_phy_rx_bitcount <= 1'd0;
		end
	end else begin
		if (basesoc_uart_phy_uart_clk_rxen) begin
			basesoc_uart_phy_rx_bitcount <= (basesoc_uart_phy_rx_bitcount + 1'd1);
			if ((basesoc_uart_phy_rx_bitcount == 1'd0)) begin
				if (basesoc_uart_phy_rx) begin
					basesoc_uart_phy_rx_busy <= 1'd0;
				end
			end else begin
				if ((basesoc_uart_phy_rx_bitcount == 4'd9)) begin
					basesoc_uart_phy_rx_busy <= 1'd0;
					if (basesoc_uart_phy_rx) begin
						basesoc_uart_phy_source_payload_data <= basesoc_uart_phy_rx_reg;
						basesoc_uart_phy_source_valid <= 1'd1;
					end
				end else begin
					basesoc_uart_phy_rx_reg <= {basesoc_uart_phy_rx, basesoc_uart_phy_rx_reg[7:1]};
				end
			end
		end
	end
	if (basesoc_uart_phy_rx_busy) begin
		{basesoc_uart_phy_uart_clk_rxen, basesoc_uart_phy_phase_accumulator_rx} <= (basesoc_uart_phy_phase_accumulator_rx + basesoc_uart_phy_storage);
	end else begin
		{basesoc_uart_phy_uart_clk_rxen, basesoc_uart_phy_phase_accumulator_rx} <= 32'd2147483648;
	end
	if (basesoc_uart_tx_clear) begin
		basesoc_uart_tx_pending <= 1'd0;
	end
	basesoc_uart_tx_old_trigger <= basesoc_uart_tx_trigger;
	if (((~basesoc_uart_tx_trigger) & basesoc_uart_tx_old_trigger)) begin
		basesoc_uart_tx_pending <= 1'd1;
	end
	if (basesoc_uart_rx_clear) begin
		basesoc_uart_rx_pending <= 1'd0;
	end
	basesoc_uart_rx_old_trigger <= basesoc_uart_rx_trigger;
	if (((~basesoc_uart_rx_trigger) & basesoc_uart_rx_old_trigger)) begin
		basesoc_uart_rx_pending <= 1'd1;
	end
	if (basesoc_uart_tx_fifo_syncfifo_re) begin
		basesoc_uart_tx_fifo_readable <= 1'd1;
	end else begin
		if (basesoc_uart_tx_fifo_re) begin
			basesoc_uart_tx_fifo_readable <= 1'd0;
		end
	end
	if (((basesoc_uart_tx_fifo_syncfifo_we & basesoc_uart_tx_fifo_syncfifo_writable) & (~basesoc_uart_tx_fifo_replace))) begin
		basesoc_uart_tx_fifo_produce <= (basesoc_uart_tx_fifo_produce + 1'd1);
	end
	if (basesoc_uart_tx_fifo_do_read) begin
		basesoc_uart_tx_fifo_consume <= (basesoc_uart_tx_fifo_consume + 1'd1);
	end
	if (((basesoc_uart_tx_fifo_syncfifo_we & basesoc_uart_tx_fifo_syncfifo_writable) & (~basesoc_uart_tx_fifo_replace))) begin
		if ((~basesoc_uart_tx_fifo_do_read)) begin
			basesoc_uart_tx_fifo_level0 <= (basesoc_uart_tx_fifo_level0 + 1'd1);
		end
	end else begin
		if (basesoc_uart_tx_fifo_do_read) begin
			basesoc_uart_tx_fifo_level0 <= (basesoc_uart_tx_fifo_level0 - 1'd1);
		end
	end
	if (basesoc_uart_rx_fifo_syncfifo_re) begin
		basesoc_uart_rx_fifo_readable <= 1'd1;
	end else begin
		if (basesoc_uart_rx_fifo_re) begin
			basesoc_uart_rx_fifo_readable <= 1'd0;
		end
	end
	if (((basesoc_uart_rx_fifo_syncfifo_we & basesoc_uart_rx_fifo_syncfifo_writable) & (~basesoc_uart_rx_fifo_replace))) begin
		basesoc_uart_rx_fifo_produce <= (basesoc_uart_rx_fifo_produce + 1'd1);
	end
	if (basesoc_uart_rx_fifo_do_read) begin
		basesoc_uart_rx_fifo_consume <= (basesoc_uart_rx_fifo_consume + 1'd1);
	end
	if (((basesoc_uart_rx_fifo_syncfifo_we & basesoc_uart_rx_fifo_syncfifo_writable) & (~basesoc_uart_rx_fifo_replace))) begin
		if ((~basesoc_uart_rx_fifo_do_read)) begin
			basesoc_uart_rx_fifo_level0 <= (basesoc_uart_rx_fifo_level0 + 1'd1);
		end
	end else begin
		if (basesoc_uart_rx_fifo_do_read) begin
			basesoc_uart_rx_fifo_level0 <= (basesoc_uart_rx_fifo_level0 - 1'd1);
		end
	end
	if (basesoc_uart_reset) begin
		basesoc_uart_tx_pending <= 1'd0;
		basesoc_uart_tx_old_trigger <= 1'd0;
		basesoc_uart_rx_pending <= 1'd0;
		basesoc_uart_rx_old_trigger <= 1'd0;
		basesoc_uart_tx_fifo_readable <= 1'd0;
		basesoc_uart_tx_fifo_level0 <= 5'd0;
		basesoc_uart_tx_fifo_produce <= 4'd0;
		basesoc_uart_tx_fifo_consume <= 4'd0;
		basesoc_uart_rx_fifo_readable <= 1'd0;
		basesoc_uart_rx_fifo_level0 <= 5'd0;
		basesoc_uart_rx_fifo_produce <= 4'd0;
		basesoc_uart_rx_fifo_consume <= 4'd0;
	end
	if (basesoc_timer0_en_storage) begin
		if ((basesoc_timer0_value == 1'd0)) begin
			basesoc_timer0_value <= basesoc_timer0_reload_storage;
		end else begin
			basesoc_timer0_value <= (basesoc_timer0_value - 1'd1);
		end
	end else begin
		basesoc_timer0_value <= basesoc_timer0_load_storage;
	end
	if (basesoc_timer0_update_value_re) begin
		basesoc_timer0_value_status <= basesoc_timer0_value;
	end
	if (basesoc_timer0_zero_clear) begin
		basesoc_timer0_zero_pending <= 1'd0;
	end
	basesoc_timer0_zero_old_trigger <= basesoc_timer0_zero_trigger;
	if (((~basesoc_timer0_zero_trigger) & basesoc_timer0_zero_old_trigger)) begin
		basesoc_timer0_zero_pending <= 1'd1;
	end
	if ((dna_cnt < 7'd114)) begin
		dna_cnt <= (dna_cnt + 1'd1);
		if (dna_cnt[0]) begin
			dna_status <= {dna_status, dna_do};
		end
	end
	if (drdy) begin
		case (channel)
			1'd0: begin
				temperature_status <= (data >>> 3'd4);
			end
			1'd1: begin
				vccint_status <= (data >>> 3'd4);
			end
			2'd2: begin
				vccaux_status <= (data >>> 3'd4);
			end
			3'd6: begin
				vccbram_status <= (data >>> 3'd4);
			end
		endcase
	end
	if (r_enable) begin
		if ((r_count < r_width)) begin
			user_rgb_led0_r <= 1'd1;
		end else begin
			user_rgb_led0_r <= 1'd0;
		end
		if ((r_count == (r_period - 1'd1))) begin
			r_count <= 1'd0;
		end else begin
			r_count <= (r_count + 1'd1);
		end
	end else begin
		r_count <= 1'd0;
		user_rgb_led0_r <= 1'd0;
	end
	if (g_enable) begin
		if ((g_count < g_width)) begin
			user_rgb_led0_g <= 1'd1;
		end else begin
			user_rgb_led0_g <= 1'd0;
		end
		if ((g_count == (g_period - 1'd1))) begin
			g_count <= 1'd0;
		end else begin
			g_count <= (g_count + 1'd1);
		end
	end else begin
		g_count <= 1'd0;
		user_rgb_led0_g <= 1'd0;
	end
	if (b_enable) begin
		if ((b_count < b_width)) begin
			user_rgb_led0_b <= 1'd1;
		end else begin
			user_rgb_led0_b <= 1'd0;
		end
		if ((b_count == (b_period - 1'd1))) begin
			b_count <= 1'd0;
		end else begin
			b_count <= (b_count + 1'd1);
		end
	end else begin
		b_count <= 1'd0;
		user_rgb_led0_b <= 1'd0;
	end
	if (adxl362_machine_done1) begin
		adxl362_data_read <= adxl362_machine_data;
	end
	if (adxl362_machine_start) begin
		adxl362_cs <= adxl362_xfer_cs;
		adxl362_machine_n_write <= adxl362_xfer_write_length;
		adxl362_machine_n_read <= adxl362_xfer_read_length;
		adxl362_machine_data <= adxl362_data_write;
		adxl362_pending1 <= 1'd0;
	end
	if (adxl362_start) begin
		adxl362_data_write <= adxl362_mosi_data;
		adxl362_pending1 <= 1'd1;
	end
	adxl362_active <= adxl362_machine_cs;
	adxl362_pending0 <= adxl362_pending1;
	if ((adxl362_machine_edge & adxl362_machine_shift)) begin
		adxl362_machine_write0 <= adxl362_machine_write;
	end
	if (adxl362_machine_cg_ce) begin
		if (adxl362_machine_zero) begin
			adxl362_machine_bias1 <= 1'd0;
		end else begin
			adxl362_machine_cnt <= (adxl362_machine_cnt - 1'd1);
		end
		if (adxl362_machine_edge) begin
			adxl362_machine_cnt <= adxl362_machine_load[7:1];
			adxl362_machine_bias1 <= (adxl362_machine_load[0] & (adxl362_machine_clk ^ adxl362_machine_bias0));
			adxl362_machine_clk <= (~adxl362_machine_clk);
		end
	end
	if (adxl362_machine_reg_ce) begin
		if (adxl362_machine_lsb) begin
			if (adxl362_machine_shift) begin
				adxl362_machine_data[30:0] <= adxl362_machine_data[31:1];
			end
			if (adxl362_machine_sample) begin
				adxl362_machine_data[0] <= adxl362_machine_i;
			end
		end else begin
			if (adxl362_machine_shift) begin
				adxl362_machine_data[31:1] <= adxl362_machine_data[30:0];
			end
			if (adxl362_machine_sample) begin
				adxl362_machine_data[0] <= adxl362_machine_i;
			end
		end
	end
	if (adxl362_machine_bits_ce) begin
		if (adxl362_machine_write) begin
			adxl362_machine_n_write <= (adxl362_machine_n_write - 1'd1);
		end else begin
			if (adxl362_machine_read) begin
				adxl362_machine_n_read <= (adxl362_machine_n_read - 1'd1);
			end
		end
	end
	if (adxl362_machine_fsm_ce) begin
		spimaster0_state <= spimaster0_next_state;
	end
	if (lcd_machine_done1) begin
		lcd_data_read <= lcd_machine_data;
	end
	if (lcd_machine_start) begin
		lcd_cs <= lcd_xfer_cs;
		lcd_machine_n_write <= lcd_xfer_write_length;
		lcd_machine_n_read <= lcd_xfer_read_length;
		lcd_machine_data <= lcd_data_write;
		lcd_pending1 <= 1'd0;
	end
	if (lcd_start) begin
		lcd_data_write <= lcd_mosi_data;
		lcd_pending1 <= 1'd1;
	end
	lcd_active <= lcd_machine_cs;
	lcd_pending0 <= lcd_pending1;
	if ((lcd_machine_edge & lcd_machine_shift)) begin
		lcd_machine_write0 <= lcd_machine_write;
	end
	if (lcd_machine_cg_ce) begin
		if (lcd_machine_zero) begin
			lcd_machine_bias1 <= 1'd0;
		end else begin
			lcd_machine_cnt <= (lcd_machine_cnt - 1'd1);
		end
		if (lcd_machine_edge) begin
			lcd_machine_cnt <= lcd_machine_load[7:1];
			lcd_machine_bias1 <= (lcd_machine_load[0] & (lcd_machine_clk ^ lcd_machine_bias0));
			lcd_machine_clk <= (~lcd_machine_clk);
		end
	end
	if (lcd_machine_reg_ce) begin
		if (lcd_machine_lsb) begin
			if (lcd_machine_shift) begin
				lcd_machine_data[30:0] <= lcd_machine_data[31:1];
			end
			if (lcd_machine_sample) begin
				lcd_machine_data[0] <= lcd_machine_i;
			end
		end else begin
			if (lcd_machine_shift) begin
				lcd_machine_data[31:1] <= lcd_machine_data[30:0];
			end
			if (lcd_machine_sample) begin
				lcd_machine_data[0] <= lcd_machine_i;
			end
		end
	end
	if (lcd_machine_bits_ce) begin
		if (lcd_machine_write) begin
			lcd_machine_n_write <= (lcd_machine_n_write - 1'd1);
		end else begin
			if (lcd_machine_read) begin
				lcd_machine_n_read <= (lcd_machine_n_read - 1'd1);
			end
		end
	end
	if (lcd_machine_fsm_ce) begin
		spimaster1_state <= spimaster1_next_state;
	end
	if (display_write_re) begin
		case (display_sel_storage)
			1'd0: begin
				display_values0 <= display_value_storage;
			end
			1'd1: begin
				display_values1 <= display_value_storage;
			end
			2'd2: begin
				display_values2 <= display_value_storage;
			end
			2'd3: begin
				display_values3 <= display_value_storage;
			end
			3'd4: begin
				display_values4 <= display_value_storage;
			end
			3'd5: begin
				display_values5 <= display_value_storage;
			end
		endcase
	end
	if (display_ce) begin
		display_cs2[1] <= display_cs2[0];
		display_cs2[2] <= display_cs2[1];
		display_cs2[3] <= display_cs2[2];
		display_cs2[4] <= display_cs2[3];
		display_cs2[5] <= display_cs2[4];
		display_cs2[0] <= display_cs2[5];
	end
	if (((~display_enable) | display_ce)) begin
		display_counter <= 17'd99999;
	end else begin
		display_counter <= (display_counter - 1'd1);
	end
	case (grant)
		1'd0: begin
			if ((~request[0])) begin
				if (request[1]) begin
					grant <= 1'd1;
				end
			end
		end
		1'd1: begin
			if ((~request[1])) begin
				if (request[0]) begin
					grant <= 1'd0;
				end
			end
		end
	endcase
	slave_sel_r <= slave_sel;
	if (wait_1) begin
		if ((~done)) begin
			count <= (count - 1'd1);
		end
	end else begin
		count <= 20'd1000000;
	end
	interface0_bank_bus_dat_r <= 1'd0;
	if (csrbank0_sel) begin
		case (interface0_bank_bus_adr[4:0])
			1'd0: begin
				interface0_bank_bus_dat_r <= csrbank0_config3_w;
			end
			1'd1: begin
				interface0_bank_bus_dat_r <= csrbank0_config2_w;
			end
			2'd2: begin
				interface0_bank_bus_dat_r <= csrbank0_config1_w;
			end
			2'd3: begin
				interface0_bank_bus_dat_r <= csrbank0_config0_w;
			end
			3'd4: begin
				interface0_bank_bus_dat_r <= csrbank0_xfer3_w;
			end
			3'd5: begin
				interface0_bank_bus_dat_r <= csrbank0_xfer2_w;
			end
			3'd6: begin
				interface0_bank_bus_dat_r <= csrbank0_xfer1_w;
			end
			3'd7: begin
				interface0_bank_bus_dat_r <= csrbank0_xfer0_w;
			end
			4'd8: begin
				interface0_bank_bus_dat_r <= adxl362_start_w;
			end
			4'd9: begin
				interface0_bank_bus_dat_r <= csrbank0_active_w;
			end
			4'd10: begin
				interface0_bank_bus_dat_r <= csrbank0_pending_w;
			end
			4'd11: begin
				interface0_bank_bus_dat_r <= csrbank0_mosi_data3_w;
			end
			4'd12: begin
				interface0_bank_bus_dat_r <= csrbank0_mosi_data2_w;
			end
			4'd13: begin
				interface0_bank_bus_dat_r <= csrbank0_mosi_data1_w;
			end
			4'd14: begin
				interface0_bank_bus_dat_r <= csrbank0_mosi_data0_w;
			end
			4'd15: begin
				interface0_bank_bus_dat_r <= csrbank0_miso_data3_w;
			end
			5'd16: begin
				interface0_bank_bus_dat_r <= csrbank0_miso_data2_w;
			end
			5'd17: begin
				interface0_bank_bus_dat_r <= csrbank0_miso_data1_w;
			end
			5'd18: begin
				interface0_bank_bus_dat_r <= csrbank0_miso_data0_w;
			end
		endcase
	end
	if (csrbank0_config3_re) begin
		adxl362_config_storage_full[31:24] <= csrbank0_config3_r;
	end
	if (csrbank0_config2_re) begin
		adxl362_config_storage_full[23:16] <= csrbank0_config2_r;
	end
	if (csrbank0_config1_re) begin
		adxl362_config_storage_full[15:8] <= csrbank0_config1_r;
	end
	if (csrbank0_config0_re) begin
		adxl362_config_storage_full[7:0] <= csrbank0_config0_r;
	end
	adxl362_config_re <= csrbank0_config0_re;
	if (csrbank0_xfer3_re) begin
		adxl362_xfer_storage_full[31:24] <= csrbank0_xfer3_r;
	end
	if (csrbank0_xfer2_re) begin
		adxl362_xfer_storage_full[23:16] <= csrbank0_xfer2_r;
	end
	if (csrbank0_xfer1_re) begin
		adxl362_xfer_storage_full[15:8] <= csrbank0_xfer1_r;
	end
	if (csrbank0_xfer0_re) begin
		adxl362_xfer_storage_full[7:0] <= csrbank0_xfer0_r;
	end
	adxl362_xfer_re <= csrbank0_xfer0_re;
	if (csrbank0_mosi_data3_re) begin
		adxl362_mosi_data_storage_full[31:24] <= csrbank0_mosi_data3_r;
	end
	if (csrbank0_mosi_data2_re) begin
		adxl362_mosi_data_storage_full[23:16] <= csrbank0_mosi_data2_r;
	end
	if (csrbank0_mosi_data1_re) begin
		adxl362_mosi_data_storage_full[15:8] <= csrbank0_mosi_data1_r;
	end
	if (csrbank0_mosi_data0_re) begin
		adxl362_mosi_data_storage_full[7:0] <= csrbank0_mosi_data0_r;
	end
	adxl362_mosi_data_re <= csrbank0_mosi_data0_re;
	interface1_bank_bus_dat_r <= 1'd0;
	if (csrbank1_sel) begin
		case (interface1_bank_bus_adr[0])
			1'd0: begin
				interface1_bank_bus_dat_r <= csrbank1_in_w;
			end
		endcase
	end
	interface2_bank_bus_dat_r <= 1'd0;
	if (csrbank2_sel) begin
		case (interface2_bank_bus_adr[3:0])
			1'd0: begin
				interface2_bank_bus_dat_r <= basesoc_ctrl_reset_reset_w;
			end
			1'd1: begin
				interface2_bank_bus_dat_r <= csrbank2_scratch3_w;
			end
			2'd2: begin
				interface2_bank_bus_dat_r <= csrbank2_scratch2_w;
			end
			2'd3: begin
				interface2_bank_bus_dat_r <= csrbank2_scratch1_w;
			end
			3'd4: begin
				interface2_bank_bus_dat_r <= csrbank2_scratch0_w;
			end
			3'd5: begin
				interface2_bank_bus_dat_r <= csrbank2_bus_errors3_w;
			end
			3'd6: begin
				interface2_bank_bus_dat_r <= csrbank2_bus_errors2_w;
			end
			3'd7: begin
				interface2_bank_bus_dat_r <= csrbank2_bus_errors1_w;
			end
			4'd8: begin
				interface2_bank_bus_dat_r <= csrbank2_bus_errors0_w;
			end
		endcase
	end
	if (csrbank2_scratch3_re) begin
		basesoc_ctrl_storage_full[31:24] <= csrbank2_scratch3_r;
	end
	if (csrbank2_scratch2_re) begin
		basesoc_ctrl_storage_full[23:16] <= csrbank2_scratch2_r;
	end
	if (csrbank2_scratch1_re) begin
		basesoc_ctrl_storage_full[15:8] <= csrbank2_scratch1_r;
	end
	if (csrbank2_scratch0_re) begin
		basesoc_ctrl_storage_full[7:0] <= csrbank2_scratch0_r;
	end
	basesoc_ctrl_re <= csrbank2_scratch0_re;
	interface3_bank_bus_dat_r <= 1'd0;
	if (csrbank3_sel) begin
		case (interface3_bank_bus_adr[1:0])
			1'd0: begin
				interface3_bank_bus_dat_r <= csrbank3_sel0_w;
			end
			1'd1: begin
				interface3_bank_bus_dat_r <= csrbank3_value0_w;
			end
			2'd2: begin
				interface3_bank_bus_dat_r <= display_write_w;
			end
		endcase
	end
	if (csrbank3_sel0_re) begin
		display_sel_storage_full[3:0] <= csrbank3_sel0_r;
	end
	display_sel_re <= csrbank3_sel0_re;
	if (csrbank3_value0_re) begin
		display_value_storage_full[3:0] <= csrbank3_value0_r;
	end
	display_value_re <= csrbank3_value0_re;
	interface4_bank_bus_dat_r <= 1'd0;
	if (csrbank4_sel) begin
		case (interface4_bank_bus_adr[2:0])
			1'd0: begin
				interface4_bank_bus_dat_r <= csrbank4_id7_w;
			end
			1'd1: begin
				interface4_bank_bus_dat_r <= csrbank4_id6_w;
			end
			2'd2: begin
				interface4_bank_bus_dat_r <= csrbank4_id5_w;
			end
			2'd3: begin
				interface4_bank_bus_dat_r <= csrbank4_id4_w;
			end
			3'd4: begin
				interface4_bank_bus_dat_r <= csrbank4_id3_w;
			end
			3'd5: begin
				interface4_bank_bus_dat_r <= csrbank4_id2_w;
			end
			3'd6: begin
				interface4_bank_bus_dat_r <= csrbank4_id1_w;
			end
			3'd7: begin
				interface4_bank_bus_dat_r <= csrbank4_id0_w;
			end
		endcase
	end
	sel_r <= sel;
	interface5_bank_bus_dat_r <= 1'd0;
	if (csrbank5_sel) begin
		case (interface5_bank_bus_adr[4:0])
			1'd0: begin
				interface5_bank_bus_dat_r <= csrbank5_config3_w;
			end
			1'd1: begin
				interface5_bank_bus_dat_r <= csrbank5_config2_w;
			end
			2'd2: begin
				interface5_bank_bus_dat_r <= csrbank5_config1_w;
			end
			2'd3: begin
				interface5_bank_bus_dat_r <= csrbank5_config0_w;
			end
			3'd4: begin
				interface5_bank_bus_dat_r <= csrbank5_xfer3_w;
			end
			3'd5: begin
				interface5_bank_bus_dat_r <= csrbank5_xfer2_w;
			end
			3'd6: begin
				interface5_bank_bus_dat_r <= csrbank5_xfer1_w;
			end
			3'd7: begin
				interface5_bank_bus_dat_r <= csrbank5_xfer0_w;
			end
			4'd8: begin
				interface5_bank_bus_dat_r <= lcd_start_w;
			end
			4'd9: begin
				interface5_bank_bus_dat_r <= csrbank5_active_w;
			end
			4'd10: begin
				interface5_bank_bus_dat_r <= csrbank5_pending_w;
			end
			4'd11: begin
				interface5_bank_bus_dat_r <= csrbank5_mosi_data3_w;
			end
			4'd12: begin
				interface5_bank_bus_dat_r <= csrbank5_mosi_data2_w;
			end
			4'd13: begin
				interface5_bank_bus_dat_r <= csrbank5_mosi_data1_w;
			end
			4'd14: begin
				interface5_bank_bus_dat_r <= csrbank5_mosi_data0_w;
			end
			4'd15: begin
				interface5_bank_bus_dat_r <= csrbank5_miso_data3_w;
			end
			5'd16: begin
				interface5_bank_bus_dat_r <= csrbank5_miso_data2_w;
			end
			5'd17: begin
				interface5_bank_bus_dat_r <= csrbank5_miso_data1_w;
			end
			5'd18: begin
				interface5_bank_bus_dat_r <= csrbank5_miso_data0_w;
			end
		endcase
	end
	if (csrbank5_config3_re) begin
		lcd_config_storage_full[31:24] <= csrbank5_config3_r;
	end
	if (csrbank5_config2_re) begin
		lcd_config_storage_full[23:16] <= csrbank5_config2_r;
	end
	if (csrbank5_config1_re) begin
		lcd_config_storage_full[15:8] <= csrbank5_config1_r;
	end
	if (csrbank5_config0_re) begin
		lcd_config_storage_full[7:0] <= csrbank5_config0_r;
	end
	lcd_config_re <= csrbank5_config0_re;
	if (csrbank5_xfer3_re) begin
		lcd_xfer_storage_full[31:24] <= csrbank5_xfer3_r;
	end
	if (csrbank5_xfer2_re) begin
		lcd_xfer_storage_full[23:16] <= csrbank5_xfer2_r;
	end
	if (csrbank5_xfer1_re) begin
		lcd_xfer_storage_full[15:8] <= csrbank5_xfer1_r;
	end
	if (csrbank5_xfer0_re) begin
		lcd_xfer_storage_full[7:0] <= csrbank5_xfer0_r;
	end
	lcd_xfer_re <= csrbank5_xfer0_re;
	if (csrbank5_mosi_data3_re) begin
		lcd_mosi_data_storage_full[31:24] <= csrbank5_mosi_data3_r;
	end
	if (csrbank5_mosi_data2_re) begin
		lcd_mosi_data_storage_full[23:16] <= csrbank5_mosi_data2_r;
	end
	if (csrbank5_mosi_data1_re) begin
		lcd_mosi_data_storage_full[15:8] <= csrbank5_mosi_data1_r;
	end
	if (csrbank5_mosi_data0_re) begin
		lcd_mosi_data_storage_full[7:0] <= csrbank5_mosi_data0_r;
	end
	lcd_mosi_data_re <= csrbank5_mosi_data0_re;
	interface6_bank_bus_dat_r <= 1'd0;
	if (csrbank6_sel) begin
		case (interface6_bank_bus_adr[0])
			1'd0: begin
				interface6_bank_bus_dat_r <= csrbank6_out1_w;
			end
			1'd1: begin
				interface6_bank_bus_dat_r <= csrbank6_out0_w;
			end
		endcase
	end
	if (csrbank6_out1_re) begin
		storage_full[15:8] <= csrbank6_out1_r;
	end
	if (csrbank6_out0_re) begin
		storage_full[7:0] <= csrbank6_out0_r;
	end
	re <= csrbank6_out0_re;
	interface7_bank_bus_dat_r <= 1'd0;
	if (csrbank7_sel) begin
		case (interface7_bank_bus_adr[4:0])
			1'd0: begin
				interface7_bank_bus_dat_r <= csrbank7_r_enable0_w;
			end
			1'd1: begin
				interface7_bank_bus_dat_r <= csrbank7_r_width3_w;
			end
			2'd2: begin
				interface7_bank_bus_dat_r <= csrbank7_r_width2_w;
			end
			2'd3: begin
				interface7_bank_bus_dat_r <= csrbank7_r_width1_w;
			end
			3'd4: begin
				interface7_bank_bus_dat_r <= csrbank7_r_width0_w;
			end
			3'd5: begin
				interface7_bank_bus_dat_r <= csrbank7_r_period3_w;
			end
			3'd6: begin
				interface7_bank_bus_dat_r <= csrbank7_r_period2_w;
			end
			3'd7: begin
				interface7_bank_bus_dat_r <= csrbank7_r_period1_w;
			end
			4'd8: begin
				interface7_bank_bus_dat_r <= csrbank7_r_period0_w;
			end
			4'd9: begin
				interface7_bank_bus_dat_r <= csrbank7_g_enable0_w;
			end
			4'd10: begin
				interface7_bank_bus_dat_r <= csrbank7_g_width3_w;
			end
			4'd11: begin
				interface7_bank_bus_dat_r <= csrbank7_g_width2_w;
			end
			4'd12: begin
				interface7_bank_bus_dat_r <= csrbank7_g_width1_w;
			end
			4'd13: begin
				interface7_bank_bus_dat_r <= csrbank7_g_width0_w;
			end
			4'd14: begin
				interface7_bank_bus_dat_r <= csrbank7_g_period3_w;
			end
			4'd15: begin
				interface7_bank_bus_dat_r <= csrbank7_g_period2_w;
			end
			5'd16: begin
				interface7_bank_bus_dat_r <= csrbank7_g_period1_w;
			end
			5'd17: begin
				interface7_bank_bus_dat_r <= csrbank7_g_period0_w;
			end
			5'd18: begin
				interface7_bank_bus_dat_r <= csrbank7_b_enable0_w;
			end
			5'd19: begin
				interface7_bank_bus_dat_r <= csrbank7_b_width3_w;
			end
			5'd20: begin
				interface7_bank_bus_dat_r <= csrbank7_b_width2_w;
			end
			5'd21: begin
				interface7_bank_bus_dat_r <= csrbank7_b_width1_w;
			end
			5'd22: begin
				interface7_bank_bus_dat_r <= csrbank7_b_width0_w;
			end
			5'd23: begin
				interface7_bank_bus_dat_r <= csrbank7_b_period3_w;
			end
			5'd24: begin
				interface7_bank_bus_dat_r <= csrbank7_b_period2_w;
			end
			5'd25: begin
				interface7_bank_bus_dat_r <= csrbank7_b_period1_w;
			end
			5'd26: begin
				interface7_bank_bus_dat_r <= csrbank7_b_period0_w;
			end
		endcase
	end
	if (csrbank7_r_enable0_re) begin
		r_enable_storage_full <= csrbank7_r_enable0_r;
	end
	r_enable_re <= csrbank7_r_enable0_re;
	if (csrbank7_r_width3_re) begin
		r_width_storage_full[31:24] <= csrbank7_r_width3_r;
	end
	if (csrbank7_r_width2_re) begin
		r_width_storage_full[23:16] <= csrbank7_r_width2_r;
	end
	if (csrbank7_r_width1_re) begin
		r_width_storage_full[15:8] <= csrbank7_r_width1_r;
	end
	if (csrbank7_r_width0_re) begin
		r_width_storage_full[7:0] <= csrbank7_r_width0_r;
	end
	r_width_re <= csrbank7_r_width0_re;
	if (csrbank7_r_period3_re) begin
		r_period_storage_full[31:24] <= csrbank7_r_period3_r;
	end
	if (csrbank7_r_period2_re) begin
		r_period_storage_full[23:16] <= csrbank7_r_period2_r;
	end
	if (csrbank7_r_period1_re) begin
		r_period_storage_full[15:8] <= csrbank7_r_period1_r;
	end
	if (csrbank7_r_period0_re) begin
		r_period_storage_full[7:0] <= csrbank7_r_period0_r;
	end
	r_period_re <= csrbank7_r_period0_re;
	if (csrbank7_g_enable0_re) begin
		g_enable_storage_full <= csrbank7_g_enable0_r;
	end
	g_enable_re <= csrbank7_g_enable0_re;
	if (csrbank7_g_width3_re) begin
		g_width_storage_full[31:24] <= csrbank7_g_width3_r;
	end
	if (csrbank7_g_width2_re) begin
		g_width_storage_full[23:16] <= csrbank7_g_width2_r;
	end
	if (csrbank7_g_width1_re) begin
		g_width_storage_full[15:8] <= csrbank7_g_width1_r;
	end
	if (csrbank7_g_width0_re) begin
		g_width_storage_full[7:0] <= csrbank7_g_width0_r;
	end
	g_width_re <= csrbank7_g_width0_re;
	if (csrbank7_g_period3_re) begin
		g_period_storage_full[31:24] <= csrbank7_g_period3_r;
	end
	if (csrbank7_g_period2_re) begin
		g_period_storage_full[23:16] <= csrbank7_g_period2_r;
	end
	if (csrbank7_g_period1_re) begin
		g_period_storage_full[15:8] <= csrbank7_g_period1_r;
	end
	if (csrbank7_g_period0_re) begin
		g_period_storage_full[7:0] <= csrbank7_g_period0_r;
	end
	g_period_re <= csrbank7_g_period0_re;
	if (csrbank7_b_enable0_re) begin
		b_enable_storage_full <= csrbank7_b_enable0_r;
	end
	b_enable_re <= csrbank7_b_enable0_re;
	if (csrbank7_b_width3_re) begin
		b_width_storage_full[31:24] <= csrbank7_b_width3_r;
	end
	if (csrbank7_b_width2_re) begin
		b_width_storage_full[23:16] <= csrbank7_b_width2_r;
	end
	if (csrbank7_b_width1_re) begin
		b_width_storage_full[15:8] <= csrbank7_b_width1_r;
	end
	if (csrbank7_b_width0_re) begin
		b_width_storage_full[7:0] <= csrbank7_b_width0_r;
	end
	b_width_re <= csrbank7_b_width0_re;
	if (csrbank7_b_period3_re) begin
		b_period_storage_full[31:24] <= csrbank7_b_period3_r;
	end
	if (csrbank7_b_period2_re) begin
		b_period_storage_full[23:16] <= csrbank7_b_period2_r;
	end
	if (csrbank7_b_period1_re) begin
		b_period_storage_full[15:8] <= csrbank7_b_period1_r;
	end
	if (csrbank7_b_period0_re) begin
		b_period_storage_full[7:0] <= csrbank7_b_period0_r;
	end
	b_period_re <= csrbank7_b_period0_re;
	interface8_bank_bus_dat_r <= 1'd0;
	if (csrbank8_sel) begin
		case (interface8_bank_bus_adr[0])
			1'd0: begin
				interface8_bank_bus_dat_r <= csrbank8_in1_w;
			end
			1'd1: begin
				interface8_bank_bus_dat_r <= csrbank8_in0_w;
			end
		endcase
	end
	interface9_bank_bus_dat_r <= 1'd0;
	if (csrbank9_sel) begin
		case (interface9_bank_bus_adr[4:0])
			1'd0: begin
				interface9_bank_bus_dat_r <= csrbank9_load3_w;
			end
			1'd1: begin
				interface9_bank_bus_dat_r <= csrbank9_load2_w;
			end
			2'd2: begin
				interface9_bank_bus_dat_r <= csrbank9_load1_w;
			end
			2'd3: begin
				interface9_bank_bus_dat_r <= csrbank9_load0_w;
			end
			3'd4: begin
				interface9_bank_bus_dat_r <= csrbank9_reload3_w;
			end
			3'd5: begin
				interface9_bank_bus_dat_r <= csrbank9_reload2_w;
			end
			3'd6: begin
				interface9_bank_bus_dat_r <= csrbank9_reload1_w;
			end
			3'd7: begin
				interface9_bank_bus_dat_r <= csrbank9_reload0_w;
			end
			4'd8: begin
				interface9_bank_bus_dat_r <= csrbank9_en0_w;
			end
			4'd9: begin
				interface9_bank_bus_dat_r <= basesoc_timer0_update_value_w;
			end
			4'd10: begin
				interface9_bank_bus_dat_r <= csrbank9_value3_w;
			end
			4'd11: begin
				interface9_bank_bus_dat_r <= csrbank9_value2_w;
			end
			4'd12: begin
				interface9_bank_bus_dat_r <= csrbank9_value1_w;
			end
			4'd13: begin
				interface9_bank_bus_dat_r <= csrbank9_value0_w;
			end
			4'd14: begin
				interface9_bank_bus_dat_r <= basesoc_timer0_eventmanager_status_w;
			end
			4'd15: begin
				interface9_bank_bus_dat_r <= basesoc_timer0_eventmanager_pending_w;
			end
			5'd16: begin
				interface9_bank_bus_dat_r <= csrbank9_ev_enable0_w;
			end
		endcase
	end
	if (csrbank9_load3_re) begin
		basesoc_timer0_load_storage_full[31:24] <= csrbank9_load3_r;
	end
	if (csrbank9_load2_re) begin
		basesoc_timer0_load_storage_full[23:16] <= csrbank9_load2_r;
	end
	if (csrbank9_load1_re) begin
		basesoc_timer0_load_storage_full[15:8] <= csrbank9_load1_r;
	end
	if (csrbank9_load0_re) begin
		basesoc_timer0_load_storage_full[7:0] <= csrbank9_load0_r;
	end
	basesoc_timer0_load_re <= csrbank9_load0_re;
	if (csrbank9_reload3_re) begin
		basesoc_timer0_reload_storage_full[31:24] <= csrbank9_reload3_r;
	end
	if (csrbank9_reload2_re) begin
		basesoc_timer0_reload_storage_full[23:16] <= csrbank9_reload2_r;
	end
	if (csrbank9_reload1_re) begin
		basesoc_timer0_reload_storage_full[15:8] <= csrbank9_reload1_r;
	end
	if (csrbank9_reload0_re) begin
		basesoc_timer0_reload_storage_full[7:0] <= csrbank9_reload0_r;
	end
	basesoc_timer0_reload_re <= csrbank9_reload0_re;
	if (csrbank9_en0_re) begin
		basesoc_timer0_en_storage_full <= csrbank9_en0_r;
	end
	basesoc_timer0_en_re <= csrbank9_en0_re;
	if (csrbank9_ev_enable0_re) begin
		basesoc_timer0_eventmanager_storage_full <= csrbank9_ev_enable0_r;
	end
	basesoc_timer0_eventmanager_re <= csrbank9_ev_enable0_re;
	interface10_bank_bus_dat_r <= 1'd0;
	if (csrbank10_sel) begin
		case (interface10_bank_bus_adr[2:0])
			1'd0: begin
				interface10_bank_bus_dat_r <= basesoc_uart_rxtx_w;
			end
			1'd1: begin
				interface10_bank_bus_dat_r <= csrbank10_txfull_w;
			end
			2'd2: begin
				interface10_bank_bus_dat_r <= csrbank10_rxempty_w;
			end
			2'd3: begin
				interface10_bank_bus_dat_r <= basesoc_uart_eventmanager_status_w;
			end
			3'd4: begin
				interface10_bank_bus_dat_r <= basesoc_uart_eventmanager_pending_w;
			end
			3'd5: begin
				interface10_bank_bus_dat_r <= csrbank10_ev_enable0_w;
			end
		endcase
	end
	if (csrbank10_ev_enable0_re) begin
		basesoc_uart_eventmanager_storage_full[1:0] <= csrbank10_ev_enable0_r;
	end
	basesoc_uart_eventmanager_re <= csrbank10_ev_enable0_re;
	interface11_bank_bus_dat_r <= 1'd0;
	if (csrbank11_sel) begin
		case (interface11_bank_bus_adr[1:0])
			1'd0: begin
				interface11_bank_bus_dat_r <= csrbank11_tuning_word3_w;
			end
			1'd1: begin
				interface11_bank_bus_dat_r <= csrbank11_tuning_word2_w;
			end
			2'd2: begin
				interface11_bank_bus_dat_r <= csrbank11_tuning_word1_w;
			end
			2'd3: begin
				interface11_bank_bus_dat_r <= csrbank11_tuning_word0_w;
			end
		endcase
	end
	if (csrbank11_tuning_word3_re) begin
		basesoc_uart_phy_storage_full[31:24] <= csrbank11_tuning_word3_r;
	end
	if (csrbank11_tuning_word2_re) begin
		basesoc_uart_phy_storage_full[23:16] <= csrbank11_tuning_word2_r;
	end
	if (csrbank11_tuning_word1_re) begin
		basesoc_uart_phy_storage_full[15:8] <= csrbank11_tuning_word1_r;
	end
	if (csrbank11_tuning_word0_re) begin
		basesoc_uart_phy_storage_full[7:0] <= csrbank11_tuning_word0_r;
	end
	basesoc_uart_phy_re <= csrbank11_tuning_word0_re;
	interface12_bank_bus_dat_r <= 1'd0;
	if (csrbank12_sel) begin
		case (interface12_bank_bus_adr[2:0])
			1'd0: begin
				interface12_bank_bus_dat_r <= csrbank12_temperature1_w;
			end
			1'd1: begin
				interface12_bank_bus_dat_r <= csrbank12_temperature0_w;
			end
			2'd2: begin
				interface12_bank_bus_dat_r <= csrbank12_vccint1_w;
			end
			2'd3: begin
				interface12_bank_bus_dat_r <= csrbank12_vccint0_w;
			end
			3'd4: begin
				interface12_bank_bus_dat_r <= csrbank12_vccaux1_w;
			end
			3'd5: begin
				interface12_bank_bus_dat_r <= csrbank12_vccaux0_w;
			end
			3'd6: begin
				interface12_bank_bus_dat_r <= csrbank12_vccbram1_w;
			end
			3'd7: begin
				interface12_bank_bus_dat_r <= csrbank12_vccbram0_w;
			end
		endcase
	end
	if (sys_rst) begin
		basesoc_ctrl_storage_full <= 32'd305419896;
		basesoc_ctrl_re <= 1'd0;
		basesoc_ctrl_bus_errors <= 32'd0;
		basesoc_rom_bus_ack <= 1'd0;
		basesoc_sram_bus_ack <= 1'd0;
		basesoc_main_ram_bus_ack <= 1'd0;
		basesoc_interface_adr <= 14'd0;
		basesoc_interface_we <= 1'd0;
		basesoc_interface_dat_w <= 8'd0;
		basesoc_bus_wishbone_dat_r <= 32'd0;
		basesoc_bus_wishbone_ack <= 1'd0;
		basesoc_counter <= 2'd0;
		serial_tx <= 1'd1;
		basesoc_uart_phy_storage_full <= 32'd4947802;
		basesoc_uart_phy_re <= 1'd0;
		basesoc_uart_phy_sink_ready <= 1'd0;
		basesoc_uart_phy_uart_clk_txen <= 1'd0;
		basesoc_uart_phy_phase_accumulator_tx <= 32'd0;
		basesoc_uart_phy_tx_reg <= 8'd0;
		basesoc_uart_phy_tx_bitcount <= 4'd0;
		basesoc_uart_phy_tx_busy <= 1'd0;
		basesoc_uart_phy_source_valid <= 1'd0;
		basesoc_uart_phy_source_payload_data <= 8'd0;
		basesoc_uart_phy_uart_clk_rxen <= 1'd0;
		basesoc_uart_phy_phase_accumulator_rx <= 32'd0;
		basesoc_uart_phy_rx_r <= 1'd0;
		basesoc_uart_phy_rx_reg <= 8'd0;
		basesoc_uart_phy_rx_bitcount <= 4'd0;
		basesoc_uart_phy_rx_busy <= 1'd0;
		basesoc_uart_tx_pending <= 1'd0;
		basesoc_uart_tx_old_trigger <= 1'd0;
		basesoc_uart_rx_pending <= 1'd0;
		basesoc_uart_rx_old_trigger <= 1'd0;
		basesoc_uart_eventmanager_storage_full <= 2'd0;
		basesoc_uart_eventmanager_re <= 1'd0;
		basesoc_uart_tx_fifo_readable <= 1'd0;
		basesoc_uart_tx_fifo_level0 <= 5'd0;
		basesoc_uart_tx_fifo_produce <= 4'd0;
		basesoc_uart_tx_fifo_consume <= 4'd0;
		basesoc_uart_rx_fifo_readable <= 1'd0;
		basesoc_uart_rx_fifo_level0 <= 5'd0;
		basesoc_uart_rx_fifo_produce <= 4'd0;
		basesoc_uart_rx_fifo_consume <= 4'd0;
		basesoc_timer0_load_storage_full <= 32'd0;
		basesoc_timer0_load_re <= 1'd0;
		basesoc_timer0_reload_storage_full <= 32'd0;
		basesoc_timer0_reload_re <= 1'd0;
		basesoc_timer0_en_storage_full <= 1'd0;
		basesoc_timer0_en_re <= 1'd0;
		basesoc_timer0_value_status <= 32'd0;
		basesoc_timer0_zero_pending <= 1'd0;
		basesoc_timer0_zero_old_trigger <= 1'd0;
		basesoc_timer0_eventmanager_storage_full <= 1'd0;
		basesoc_timer0_eventmanager_re <= 1'd0;
		basesoc_timer0_value <= 32'd0;
		dna_status <= 57'd0;
		dna_cnt <= 7'd0;
		temperature_status <= 12'd0;
		vccint_status <= 12'd0;
		vccaux_status <= 12'd0;
		vccbram_status <= 12'd0;
		storage_full <= 16'd0;
		re <= 1'd0;
		user_rgb_led0_r <= 1'd0;
		user_rgb_led0_g <= 1'd0;
		user_rgb_led0_b <= 1'd0;
		r_enable_storage_full <= 1'd0;
		r_enable_re <= 1'd0;
		r_width_storage_full <= 32'd0;
		r_width_re <= 1'd0;
		r_period_storage_full <= 32'd0;
		r_period_re <= 1'd0;
		r_count <= 32'd0;
		g_enable_storage_full <= 1'd0;
		g_enable_re <= 1'd0;
		g_width_storage_full <= 32'd0;
		g_width_re <= 1'd0;
		g_period_storage_full <= 32'd0;
		g_period_re <= 1'd0;
		g_count <= 32'd0;
		b_enable_storage_full <= 1'd0;
		b_enable_re <= 1'd0;
		b_width_storage_full <= 32'd0;
		b_width_re <= 1'd0;
		b_period_storage_full <= 32'd0;
		b_period_re <= 1'd0;
		b_count <= 32'd0;
		adxl362_active <= 1'd0;
		adxl362_pending0 <= 1'd0;
		adxl362_machine_clk <= 1'd1;
		adxl362_machine_cnt <= 8'd0;
		adxl362_machine_bias1 <= 1'd0;
		adxl362_machine_data <= 32'd0;
		adxl362_machine_n_read <= 6'd0;
		adxl362_machine_n_write <= 6'd0;
		adxl362_machine_write0 <= 1'd0;
		adxl362_pending1 <= 1'd0;
		adxl362_cs <= 16'd0;
		adxl362_data_read <= 32'd0;
		adxl362_data_write <= 32'd0;
		adxl362_config_storage_full <= 32'd0;
		adxl362_config_re <= 1'd0;
		adxl362_xfer_storage_full <= 32'd0;
		adxl362_xfer_re <= 1'd0;
		adxl362_mosi_data_storage_full <= 32'd0;
		adxl362_mosi_data_re <= 1'd0;
		lcd_active <= 1'd0;
		lcd_pending0 <= 1'd0;
		lcd_machine_clk <= 1'd1;
		lcd_machine_cnt <= 8'd0;
		lcd_machine_bias1 <= 1'd0;
		lcd_machine_data <= 32'd0;
		lcd_machine_n_read <= 6'd0;
		lcd_machine_n_write <= 6'd0;
		lcd_machine_write0 <= 1'd0;
		lcd_pending1 <= 1'd0;
		lcd_cs <= 16'd0;
		lcd_data_read <= 32'd0;
		lcd_data_write <= 32'd0;
		lcd_config_storage_full <= 32'd0;
		lcd_config_re <= 1'd0;
		lcd_xfer_storage_full <= 32'd0;
		lcd_xfer_re <= 1'd0;
		lcd_mosi_data_storage_full <= 32'd0;
		lcd_mosi_data_re <= 1'd0;
		display_sel_storage_full <= 4'd0;
		display_sel_re <= 1'd0;
		display_value_storage_full <= 4'd0;
		display_value_re <= 1'd0;
		display_values0 <= 5'd0;
		display_values1 <= 5'd0;
		display_values2 <= 5'd0;
		display_values3 <= 5'd0;
		display_values4 <= 5'd0;
		display_values5 <= 5'd0;
		display_counter <= 17'd0;
		display_cs2 <= 6'd1;
		spimaster0_state <= 2'd0;
		spimaster1_state <= 2'd0;
		grant <= 1'd0;
		slave_sel_r <= 4'd0;
		count <= 20'd1000000;
		interface0_bank_bus_dat_r <= 8'd0;
		interface1_bank_bus_dat_r <= 8'd0;
		interface2_bank_bus_dat_r <= 8'd0;
		interface3_bank_bus_dat_r <= 8'd0;
		interface4_bank_bus_dat_r <= 8'd0;
		sel_r <= 1'd0;
		interface5_bank_bus_dat_r <= 8'd0;
		interface6_bank_bus_dat_r <= 8'd0;
		interface7_bank_bus_dat_r <= 8'd0;
		interface8_bank_bus_dat_r <= 8'd0;
		interface9_bank_bus_dat_r <= 8'd0;
		interface10_bank_bus_dat_r <= 8'd0;
		interface11_bank_bus_dat_r <= 8'd0;
		interface12_bank_bus_dat_r <= 8'd0;
	end
	xilinxmultiregimpl0_regs0 <= serial_rx;
	xilinxmultiregimpl0_regs1 <= xilinxmultiregimpl0_regs0;
	xilinxmultiregimpl1_regs0 <= {user_sw15, user_sw14, user_sw13, user_sw12, user_sw11, user_sw10, user_sw9, user_sw8, user_sw7, user_sw6, user_sw5, user_sw4, user_sw3, user_sw2, user_sw1, user_sw0};
	xilinxmultiregimpl1_regs1 <= xilinxmultiregimpl1_regs0;
	xilinxmultiregimpl2_regs0 <= {user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
	xilinxmultiregimpl2_regs1 <= xilinxmultiregimpl2_regs0;
end

lm32_cpu #(
	.eba_reset(32'h00000000)
) lm32_cpu (
	.D_ACK_I(basesoc_lm32_dbus_ack),
	.D_DAT_I(basesoc_lm32_dbus_dat_r),
	.D_ERR_I(basesoc_lm32_dbus_err),
	.D_RTY_I(1'd0),
	.I_ACK_I(basesoc_lm32_ibus_ack),
	.I_DAT_I(basesoc_lm32_ibus_dat_r),
	.I_ERR_I(basesoc_lm32_ibus_err),
	.I_RTY_I(1'd0),
	.clk_i(sys_clk),
	.interrupt(basesoc_lm32_interrupt),
	.rst_i((sys_rst | basesoc_lm32_reset)),
	.D_ADR_O(basesoc_lm32_d_adr_o),
	.D_BTE_O(basesoc_lm32_dbus_bte),
	.D_CTI_O(basesoc_lm32_dbus_cti),
	.D_CYC_O(basesoc_lm32_dbus_cyc),
	.D_DAT_O(basesoc_lm32_dbus_dat_w),
	.D_SEL_O(basesoc_lm32_dbus_sel),
	.D_STB_O(basesoc_lm32_dbus_stb),
	.D_WE_O(basesoc_lm32_dbus_we),
	.I_ADR_O(basesoc_lm32_i_adr_o),
	.I_BTE_O(basesoc_lm32_ibus_bte),
	.I_CTI_O(basesoc_lm32_ibus_cti),
	.I_CYC_O(basesoc_lm32_ibus_cyc),
	.I_DAT_O(basesoc_lm32_ibus_dat_w),
	.I_SEL_O(basesoc_lm32_ibus_sel),
	.I_STB_O(basesoc_lm32_ibus_stb),
	.I_WE_O(basesoc_lm32_ibus_we)
);

reg [31:0] mem[0:8191];
reg [12:0] memadr;
always @(posedge sys_clk) begin
	memadr <= basesoc_rom_adr;
end

assign basesoc_rom_dat_r = mem[memadr];

initial begin
	$readmemh("mem.init", mem);
end

reg [31:0] mem_1[0:1023];
reg [9:0] memadr_1;
always @(posedge sys_clk) begin
	if (basesoc_sram_we[0])
		mem_1[basesoc_sram_adr][7:0] <= basesoc_sram_dat_w[7:0];
	if (basesoc_sram_we[1])
		mem_1[basesoc_sram_adr][15:8] <= basesoc_sram_dat_w[15:8];
	if (basesoc_sram_we[2])
		mem_1[basesoc_sram_adr][23:16] <= basesoc_sram_dat_w[23:16];
	if (basesoc_sram_we[3])
		mem_1[basesoc_sram_adr][31:24] <= basesoc_sram_dat_w[31:24];
	memadr_1 <= basesoc_sram_adr;
end

assign basesoc_sram_dat_r = mem_1[memadr_1];

reg [31:0] mem_2[0:4095];
reg [11:0] memadr_2;
always @(posedge sys_clk) begin
	if (basesoc_main_ram_we[0])
		mem_2[basesoc_main_ram_adr][7:0] <= basesoc_main_ram_dat_w[7:0];
	if (basesoc_main_ram_we[1])
		mem_2[basesoc_main_ram_adr][15:8] <= basesoc_main_ram_dat_w[15:8];
	if (basesoc_main_ram_we[2])
		mem_2[basesoc_main_ram_adr][23:16] <= basesoc_main_ram_dat_w[23:16];
	if (basesoc_main_ram_we[3])
		mem_2[basesoc_main_ram_adr][31:24] <= basesoc_main_ram_dat_w[31:24];
	memadr_2 <= basesoc_main_ram_adr;
end

assign basesoc_main_ram_dat_r = mem_2[memadr_2];

initial begin
	$readmemh("mem_2.init", mem_2);
end

reg [9:0] storage_1[0:15];
reg [9:0] memdat;
reg [9:0] memdat_1;
always @(posedge sys_clk) begin
	if (basesoc_uart_tx_fifo_wrport_we)
		storage_1[basesoc_uart_tx_fifo_wrport_adr] <= basesoc_uart_tx_fifo_wrport_dat_w;
	memdat <= storage_1[basesoc_uart_tx_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
	if (basesoc_uart_tx_fifo_rdport_re)
		memdat_1 <= storage_1[basesoc_uart_tx_fifo_rdport_adr];
end

assign basesoc_uart_tx_fifo_wrport_dat_r = memdat;
assign basesoc_uart_tx_fifo_rdport_dat_r = memdat_1;

reg [9:0] storage_2[0:15];
reg [9:0] memdat_2;
reg [9:0] memdat_3;
always @(posedge sys_clk) begin
	if (basesoc_uart_rx_fifo_wrport_we)
		storage_2[basesoc_uart_rx_fifo_wrport_adr] <= basesoc_uart_rx_fifo_wrport_dat_w;
	memdat_2 <= storage_2[basesoc_uart_rx_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
	if (basesoc_uart_rx_fifo_rdport_re)
		memdat_3 <= storage_2[basesoc_uart_rx_fifo_rdport_adr];
end

assign basesoc_uart_rx_fifo_wrport_dat_r = memdat_2;
assign basesoc_uart_rx_fifo_rdport_dat_r = memdat_3;

reg [7:0] mem_3[0:32];
reg [5:0] memadr_3;
always @(posedge sys_clk) begin
	memadr_3 <= adr;
end

assign dat_r = mem_3[memadr_3];

initial begin
	$readmemh("mem_3.init", mem_3);
end

DNA_PORT DNA_PORT(
	.CLK(dna_cnt[0]),
	.DIN(dna_status[56]),
	.READ((dna_cnt < 2'd2)),
	.SHIFT(1'd1),
	.DOUT(dna_do)
);

XADC #(
	.INIT_40(16'd36864),
	.INIT_41(14'd12016),
	.INIT_42(11'd1024),
	.INIT_48(15'd18177),
	.INIT_49(4'd15),
	.INIT_4A(15'd18176),
	.INIT_4B(1'd0),
	.INIT_4C(1'd0),
	.INIT_4D(1'd0),
	.INIT_4E(1'd0),
	.INIT_4F(1'd0),
	.INIT_50(16'd46573),
	.INIT_51(15'd22937),
	.INIT_52(16'd41287),
	.INIT_53(16'd56797),
	.INIT_54(16'd43322),
	.INIT_55(15'd20753),
	.INIT_56(16'd37355),
	.INIT_57(16'd44622),
	.INIT_58(15'd22937),
	.INIT_5C(15'd20753)
) XADC (
	.CONVST(1'd0),
	.CONVSTCLK(1'd0),
	.DADDR(channel),
	.DCLK(sys_clk),
	.DEN(eoc),
	.DI(1'd0),
	.DWE(1'd0),
	.RESET(sys_rst),
	.VAUXN(1'd0),
	.VAUXP(1'd1),
	.VN(1'd0),
	.VP(1'd1),
	.ALM(alarm),
	.BUSY(busy),
	.CHANNEL(channel),
	.DO(data),
	.DRDY(drdy),
	.EOC(eoc),
	.EOS(eos),
	.OT(ot)
);

assign adxl362_spi_cs_n = adxl362_cs_n_t_oe ? adxl362_cs_n_t_o : 1'bz;
assign adxl362_cs_n_t_i = adxl362_spi_cs_n;

assign adxl362_spi_clk = adxl362_clk_t_oe ? adxl362_clk_t_o : 1'bz;
assign adxl362_clk_t_i = adxl362_spi_clk;

assign adxl362_spi_mosi = adxl362_mosi_t_oe ? adxl362_mosi_t_o : 1'bz;
assign adxl362_mosi_t_i = adxl362_spi_mosi;

assign lcd_spi_cs_n = lcd_cs_n_t_oe ? lcd_cs_n_t_o : 1'bz;
assign lcd_cs_n_t_i = lcd_spi_cs_n;

assign lcd_spi_clk = lcd_clk_t_oe ? lcd_clk_t_o : 1'bz;
assign lcd_clk_t_i = lcd_spi_clk;

assign lcd_spi_mosi = lcd_mosi_t_oe ? lcd_mosi_t_o : 1'bz;
assign lcd_mosi_t_i = lcd_spi_mosi;

endmodule
