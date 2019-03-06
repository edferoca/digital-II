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
	input user_btn0,
	input user_btn1,
	input user_btn2,
	input user_btn3,
	input user_btn4,
	inout sd_spi_cs_n,
	inout sd_spi_mosi,
	input sd_spi_miso,
	inout sd_spi_clk,
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
reg [31:0] basesoc_interface_dat_w = 32'd0;
wire [31:0] basesoc_interface_dat_r;
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
reg [15:0] storage_full = 16'd0;
wire [15:0] storage;
reg re = 1'd0;
wire [4:0] status;
wire SD_config_offline;
wire [1:0] SD_config_padding0;
wire SD_config_cs_polarity;
wire SD_config_clk_polarity;
wire SD_config_clk_phase;
wire SD_config_lsb_first;
wire SD_config_half_duplex;
wire [7:0] SD_config_padding1;
wire [7:0] SD_config_div_write;
wire [7:0] SD_config_div_read;
wire [15:0] SD_xfer_cs;
wire [5:0] SD_xfer_write_length;
wire [1:0] SD_xfer_padding0;
wire [5:0] SD_xfer_read_length;
wire [1:0] SD_xfer_padding1;
wire SD_start;
reg SD_active = 1'd0;
reg SD_pending0 = 1'd0;
wire [31:0] SD_mosi_data;
wire [31:0] SD_miso_data;
reg [7:0] SD_machine_load = 8'd0;
wire SD_machine_bias0;
wire SD_machine_edge;
reg SD_machine_clk = 1'd1;
reg [7:0] SD_machine_cnt = 8'd0;
reg SD_machine_bias1 = 1'd0;
wire SD_machine_zero;
wire SD_machine_cg_ce;
reg [31:0] SD_machine_data = 32'd0;
wire SD_machine_o;
wire SD_machine_i;
wire SD_machine_lsb;
reg SD_machine_shift = 1'd0;
reg SD_machine_sample = 1'd0;
wire SD_machine_reg_ce;
reg [5:0] SD_machine_n_read = 6'd0;
reg [5:0] SD_machine_n_write = 6'd0;
wire SD_machine_read;
wire SD_machine_write;
wire SD_machine_done0;
wire SD_machine_bits_ce;
wire [7:0] SD_machine_div_write;
wire [7:0] SD_machine_div_read;
wire SD_machine_clk_phase;
wire SD_machine_start;
wire SD_machine_cs;
wire SD_machine_oe;
wire SD_machine_done1;
wire SD_machine_fsm_ce;
reg SD_machine_write0 = 1'd0;
reg SD_machine_fsm_is_ongoing0 = 1'd0;
reg SD_machine_fsm_is_ongoing1 = 1'd0;
reg SD_pending1 = 1'd0;
reg [15:0] SD_cs = 16'd0;
reg [31:0] SD_data_read = 32'd0;
reg [31:0] SD_data_write = 32'd0;
wire SD_cs_n_t_o;
wire SD_cs_n_t_oe;
wire SD_cs_n_t_i;
wire SD_clk_t_o;
wire SD_clk_t_oe;
wire SD_clk_t_i;
wire SD_mosi_t_o;
wire SD_mosi_t_oe;
wire SD_mosi_t_i;
reg [31:0] SD_config_storage_full = 32'd0;
wire [31:0] SD_config_storage;
reg SD_config_re = 1'd0;
reg [31:0] SD_xfer_storage_full = 32'd0;
wire [31:0] SD_xfer_storage;
reg SD_xfer_re = 1'd0;
wire SD_start_re;
wire SD_start_r;
reg SD_start_w = 1'd0;
wire SD_active_status;
wire SD_pending_status;
reg [31:0] SD_mosi_data_storage_full = 32'd0;
wire [31:0] SD_mosi_data_storage;
reg SD_mosi_data_re = 1'd0;
wire [31:0] SD_miso_data_status;
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
reg [1:0] state = 2'd0;
reg [1:0] next_state = 2'd0;
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
wire [31:0] interface0_bank_bus_dat_w;
reg [31:0] interface0_bank_bus_dat_r = 32'd0;
wire csrbank0_config0_re;
wire [31:0] csrbank0_config0_r;
wire [31:0] csrbank0_config0_w;
wire csrbank0_xfer0_re;
wire [31:0] csrbank0_xfer0_r;
wire [31:0] csrbank0_xfer0_w;
wire csrbank0_active_re;
wire csrbank0_active_r;
wire csrbank0_active_w;
wire csrbank0_pending_re;
wire csrbank0_pending_r;
wire csrbank0_pending_w;
wire csrbank0_mosi_data0_re;
wire [31:0] csrbank0_mosi_data0_r;
wire [31:0] csrbank0_mosi_data0_w;
wire csrbank0_miso_data_re;
wire [31:0] csrbank0_miso_data_r;
wire [31:0] csrbank0_miso_data_w;
wire csrbank0_sel;
wire [13:0] interface1_bank_bus_adr;
wire interface1_bank_bus_we;
wire [31:0] interface1_bank_bus_dat_w;
reg [31:0] interface1_bank_bus_dat_r = 32'd0;
wire csrbank1_in_re;
wire [4:0] csrbank1_in_r;
wire [4:0] csrbank1_in_w;
wire csrbank1_sel;
wire [13:0] interface2_bank_bus_adr;
wire interface2_bank_bus_we;
wire [31:0] interface2_bank_bus_dat_w;
reg [31:0] interface2_bank_bus_dat_r = 32'd0;
wire csrbank2_scratch0_re;
wire [31:0] csrbank2_scratch0_r;
wire [31:0] csrbank2_scratch0_w;
wire csrbank2_bus_errors_re;
wire [31:0] csrbank2_bus_errors_r;
wire [31:0] csrbank2_bus_errors_w;
wire csrbank2_sel;
wire [13:0] interface3_bank_bus_adr;
wire interface3_bank_bus_we;
wire [31:0] interface3_bank_bus_dat_w;
reg [31:0] interface3_bank_bus_dat_r = 32'd0;
wire csrbank3_sel0_re;
wire [3:0] csrbank3_sel0_r;
wire [3:0] csrbank3_sel0_w;
wire csrbank3_value0_re;
wire [3:0] csrbank3_value0_r;
wire [3:0] csrbank3_value0_w;
wire csrbank3_sel;
wire [13:0] sram_bus_adr;
wire sram_bus_we;
wire [31:0] sram_bus_dat_w;
reg [31:0] sram_bus_dat_r = 32'd0;
wire [5:0] adr;
wire [7:0] dat_r;
wire sel;
reg sel_r = 1'd0;
wire [13:0] interface4_bank_bus_adr;
wire interface4_bank_bus_we;
wire [31:0] interface4_bank_bus_dat_w;
reg [31:0] interface4_bank_bus_dat_r = 32'd0;
wire csrbank4_out0_re;
wire [15:0] csrbank4_out0_r;
wire [15:0] csrbank4_out0_w;
wire csrbank4_sel;
wire [13:0] interface5_bank_bus_adr;
wire interface5_bank_bus_we;
wire [31:0] interface5_bank_bus_dat_w;
reg [31:0] interface5_bank_bus_dat_r = 32'd0;
wire csrbank5_load0_re;
wire [31:0] csrbank5_load0_r;
wire [31:0] csrbank5_load0_w;
wire csrbank5_reload0_re;
wire [31:0] csrbank5_reload0_r;
wire [31:0] csrbank5_reload0_w;
wire csrbank5_en0_re;
wire csrbank5_en0_r;
wire csrbank5_en0_w;
wire csrbank5_value_re;
wire [31:0] csrbank5_value_r;
wire [31:0] csrbank5_value_w;
wire csrbank5_ev_enable0_re;
wire csrbank5_ev_enable0_r;
wire csrbank5_ev_enable0_w;
wire csrbank5_sel;
wire [13:0] interface6_bank_bus_adr;
wire interface6_bank_bus_we;
wire [31:0] interface6_bank_bus_dat_w;
reg [31:0] interface6_bank_bus_dat_r = 32'd0;
wire csrbank6_txfull_re;
wire csrbank6_txfull_r;
wire csrbank6_txfull_w;
wire csrbank6_rxempty_re;
wire csrbank6_rxempty_r;
wire csrbank6_rxempty_w;
wire csrbank6_ev_enable0_re;
wire [1:0] csrbank6_ev_enable0_r;
wire [1:0] csrbank6_ev_enable0_w;
wire csrbank6_sel;
wire [13:0] interface7_bank_bus_adr;
wire interface7_bank_bus_we;
wire [31:0] interface7_bank_bus_dat_w;
reg [31:0] interface7_bank_bus_dat_r = 32'd0;
wire csrbank7_tuning_word0_re;
wire [31:0] csrbank7_tuning_word0_r;
wire [31:0] csrbank7_tuning_word0_w;
wire csrbank7_sel;
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
(* register_balancing = "no", shreg_extract = "no" *) reg [4:0] xilinxmultiregimpl1_regs0 = 5'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg [4:0] xilinxmultiregimpl1_regs1 = 5'd0;
wire xilinxmultiregimpl1;

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
assign {SD_config_div_read, SD_config_div_write, SD_config_padding1, SD_config_half_duplex, SD_config_lsb_first, SD_config_clk_phase, SD_config_clk_polarity, SD_config_cs_polarity, SD_config_padding0, SD_config_offline} = SD_config_storage;
assign {SD_xfer_padding1, SD_xfer_read_length, SD_xfer_padding0, SD_xfer_write_length, SD_xfer_cs} = SD_xfer_storage;
assign SD_start = (SD_start_re & SD_start_r);
assign SD_active_status = SD_active;
assign SD_pending_status = SD_pending0;
assign SD_mosi_data = SD_mosi_data_storage;
assign SD_miso_data_status = SD_miso_data;
assign SD_miso_data = SD_data_read;
assign SD_machine_start = (SD_pending1 & ((~SD_machine_cs) | SD_machine_done1));
assign SD_machine_clk_phase = SD_config_clk_phase;
assign SD_machine_lsb = SD_config_lsb_first;
assign SD_machine_div_write = SD_config_div_write;
assign SD_machine_div_read = SD_config_div_read;
assign SD_cs_n_t_oe = (~SD_config_offline);
assign SD_cs_n_t_o = ((SD_cs & {16{SD_machine_cs}}) ^ {16{(~SD_config_cs_polarity)}});
assign SD_clk_t_oe = (~SD_config_offline);
assign SD_clk_t_o = ((SD_machine_clk & SD_machine_cs) ^ SD_config_clk_polarity);
assign SD_mosi_t_oe = (((~SD_config_offline) & SD_machine_cs) & (SD_machine_oe | (~SD_config_half_duplex)));
assign SD_mosi_t_o = SD_machine_o;
assign SD_machine_i = (SD_config_half_duplex ? SD_mosi_t_i : sd_spi_miso);
assign SD_machine_cg_ce = ((SD_machine_start | SD_machine_cs) | (~SD_machine_edge));
always @(*) begin
	SD_machine_load <= 8'd0;
	if ((SD_machine_write | (~SD_machine_read))) begin
		SD_machine_load <= SD_machine_div_write;
	end else begin
		SD_machine_load <= SD_machine_div_read;
	end
end
assign SD_machine_bias0 = SD_machine_clk_phase;
assign SD_machine_fsm_ce = SD_machine_edge;
assign SD_machine_cs = (~SD_machine_fsm_is_ongoing0);
assign SD_machine_reg_ce = SD_machine_edge;
assign SD_machine_bits_ce = (SD_machine_edge & SD_machine_sample);
assign SD_machine_done1 = ((SD_machine_edge & SD_machine_done0) & SD_machine_fsm_is_ongoing1);
assign SD_machine_oe = (SD_machine_write0 | SD_machine_write);
assign SD_machine_zero = (SD_machine_cnt == 1'd0);
assign SD_machine_edge = (SD_machine_zero & (~SD_machine_bias1));
assign SD_machine_o = (SD_machine_lsb ? SD_machine_data[0] : SD_machine_data[31]);
assign SD_machine_write = (SD_machine_n_write != 1'd0);
assign SD_machine_read = (SD_machine_n_read != 1'd0);
assign SD_machine_done0 = (~(SD_machine_write | SD_machine_read));
always @(*) begin
	SD_machine_shift <= 1'd0;
	SD_machine_fsm_is_ongoing0 <= 1'd0;
	SD_machine_sample <= 1'd0;
	next_state <= 2'd0;
	SD_machine_fsm_is_ongoing1 <= 1'd0;
	next_state <= state;
	case (state)
		1'd1: begin
			SD_machine_sample <= 1'd1;
			next_state <= 2'd2;
		end
		2'd2: begin
			if ((SD_machine_done0 & (~SD_machine_start))) begin
				if (SD_machine_clk_phase) begin
					next_state <= 1'd0;
				end else begin
					next_state <= 2'd3;
				end
			end else begin
				SD_machine_shift <= (~SD_machine_start);
				next_state <= 1'd1;
			end
			SD_machine_fsm_is_ongoing1 <= 1'd1;
		end
		2'd3: begin
			if (SD_machine_done0) begin
				next_state <= 1'd0;
			end else begin
				next_state <= 1'd1;
			end
		end
		default: begin
			if (SD_machine_start) begin
				if (SD_machine_clk_phase) begin
					next_state <= 2'd3;
				end else begin
					next_state <= 1'd1;
				end
			end
			SD_machine_fsm_is_ongoing0 <= 1'd1;
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
	error <= 1'd0;
	shared_dat_r <= 32'd0;
	shared_ack <= 1'd0;
	shared_ack <= (((basesoc_rom_bus_ack | basesoc_sram_bus_ack) | basesoc_main_ram_bus_ack) | basesoc_bus_wishbone_ack);
	shared_dat_r <= (((({32{slave_sel_r[0]}} & basesoc_rom_bus_dat_r) | ({32{slave_sel_r[1]}} & basesoc_sram_bus_dat_r)) | ({32{slave_sel_r[2]}} & basesoc_main_ram_bus_dat_r)) | ({32{slave_sel_r[3]}} & basesoc_bus_wishbone_dat_r));
	if (done) begin
		shared_dat_r <= 32'd4294967295;
		shared_ack <= 1'd1;
		error <= 1'd1;
	end
end
assign done = (count == 1'd0);
assign csrbank0_sel = (interface0_bank_bus_adr[13:9] == 4'd11);
assign csrbank0_config0_r = interface0_bank_bus_dat_w[31:0];
assign csrbank0_config0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 1'd0));
assign csrbank0_xfer0_r = interface0_bank_bus_dat_w[31:0];
assign csrbank0_xfer0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 1'd1));
assign SD_start_r = interface0_bank_bus_dat_w[0];
assign SD_start_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 2'd2));
assign csrbank0_active_r = interface0_bank_bus_dat_w[0];
assign csrbank0_active_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 2'd3));
assign csrbank0_pending_r = interface0_bank_bus_dat_w[0];
assign csrbank0_pending_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 3'd4));
assign csrbank0_mosi_data0_r = interface0_bank_bus_dat_w[31:0];
assign csrbank0_mosi_data0_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 3'd5));
assign csrbank0_miso_data_r = interface0_bank_bus_dat_w[31:0];
assign csrbank0_miso_data_re = ((csrbank0_sel & interface0_bank_bus_we) & (interface0_bank_bus_adr[2:0] == 3'd6));
assign SD_config_storage = SD_config_storage_full[31:0];
assign csrbank0_config0_w = SD_config_storage_full[31:0];
assign SD_xfer_storage = SD_xfer_storage_full[31:0];
assign csrbank0_xfer0_w = SD_xfer_storage_full[31:0];
assign csrbank0_active_w = SD_active_status;
assign csrbank0_pending_w = SD_pending_status;
assign SD_mosi_data_storage = SD_mosi_data_storage_full[31:0];
assign csrbank0_mosi_data0_w = SD_mosi_data_storage_full[31:0];
assign csrbank0_miso_data_w = SD_miso_data_status[31:0];
assign csrbank1_sel = (interface1_bank_bus_adr[13:9] == 4'd9);
assign csrbank1_in_r = interface1_bank_bus_dat_w[4:0];
assign csrbank1_in_re = ((csrbank1_sel & interface1_bank_bus_we) & (interface1_bank_bus_adr[0] == 1'd0));
assign csrbank1_in_w = status[4:0];
assign csrbank2_sel = (interface2_bank_bus_adr[13:9] == 1'd0);
assign basesoc_ctrl_reset_reset_r = interface2_bank_bus_dat_w[0];
assign basesoc_ctrl_reset_reset_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[1:0] == 1'd0));
assign csrbank2_scratch0_r = interface2_bank_bus_dat_w[31:0];
assign csrbank2_scratch0_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[1:0] == 1'd1));
assign csrbank2_bus_errors_r = interface2_bank_bus_dat_w[31:0];
assign csrbank2_bus_errors_re = ((csrbank2_sel & interface2_bank_bus_we) & (interface2_bank_bus_adr[1:0] == 2'd2));
assign basesoc_ctrl_storage = basesoc_ctrl_storage_full[31:0];
assign csrbank2_scratch0_w = basesoc_ctrl_storage_full[31:0];
assign csrbank2_bus_errors_w = basesoc_ctrl_bus_errors_status[31:0];
assign csrbank3_sel = (interface3_bank_bus_adr[13:9] == 4'd10);
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
assign sel = (sram_bus_adr[13:9] == 3'd4);
always @(*) begin
	sram_bus_dat_r <= 32'd0;
	if (sel_r) begin
		sram_bus_dat_r <= dat_r;
	end
end
assign adr = sram_bus_adr[5:0];
assign csrbank4_sel = (interface4_bank_bus_adr[13:9] == 4'd8);
assign csrbank4_out0_r = interface4_bank_bus_dat_w[15:0];
assign csrbank4_out0_re = ((csrbank4_sel & interface4_bank_bus_we) & (interface4_bank_bus_adr[0] == 1'd0));
assign storage = storage_full[15:0];
assign csrbank4_out0_w = storage_full[15:0];
assign csrbank5_sel = (interface5_bank_bus_adr[13:9] == 3'd5);
assign csrbank5_load0_r = interface5_bank_bus_dat_w[31:0];
assign csrbank5_load0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 1'd0));
assign csrbank5_reload0_r = interface5_bank_bus_dat_w[31:0];
assign csrbank5_reload0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 1'd1));
assign csrbank5_en0_r = interface5_bank_bus_dat_w[0];
assign csrbank5_en0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 2'd2));
assign basesoc_timer0_update_value_r = interface5_bank_bus_dat_w[0];
assign basesoc_timer0_update_value_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 2'd3));
assign csrbank5_value_r = interface5_bank_bus_dat_w[31:0];
assign csrbank5_value_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 3'd4));
assign basesoc_timer0_eventmanager_status_r = interface5_bank_bus_dat_w[0];
assign basesoc_timer0_eventmanager_status_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 3'd5));
assign basesoc_timer0_eventmanager_pending_r = interface5_bank_bus_dat_w[0];
assign basesoc_timer0_eventmanager_pending_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 3'd6));
assign csrbank5_ev_enable0_r = interface5_bank_bus_dat_w[0];
assign csrbank5_ev_enable0_re = ((csrbank5_sel & interface5_bank_bus_we) & (interface5_bank_bus_adr[2:0] == 3'd7));
assign basesoc_timer0_load_storage = basesoc_timer0_load_storage_full[31:0];
assign csrbank5_load0_w = basesoc_timer0_load_storage_full[31:0];
assign basesoc_timer0_reload_storage = basesoc_timer0_reload_storage_full[31:0];
assign csrbank5_reload0_w = basesoc_timer0_reload_storage_full[31:0];
assign basesoc_timer0_en_storage = basesoc_timer0_en_storage_full;
assign csrbank5_en0_w = basesoc_timer0_en_storage_full;
assign csrbank5_value_w = basesoc_timer0_value_status[31:0];
assign basesoc_timer0_eventmanager_storage = basesoc_timer0_eventmanager_storage_full;
assign csrbank5_ev_enable0_w = basesoc_timer0_eventmanager_storage_full;
assign csrbank6_sel = (interface6_bank_bus_adr[13:9] == 2'd3);
assign basesoc_uart_rxtx_r = interface6_bank_bus_dat_w[7:0];
assign basesoc_uart_rxtx_re = ((csrbank6_sel & interface6_bank_bus_we) & (interface6_bank_bus_adr[2:0] == 1'd0));
assign csrbank6_txfull_r = interface6_bank_bus_dat_w[0];
assign csrbank6_txfull_re = ((csrbank6_sel & interface6_bank_bus_we) & (interface6_bank_bus_adr[2:0] == 1'd1));
assign csrbank6_rxempty_r = interface6_bank_bus_dat_w[0];
assign csrbank6_rxempty_re = ((csrbank6_sel & interface6_bank_bus_we) & (interface6_bank_bus_adr[2:0] == 2'd2));
assign basesoc_uart_eventmanager_status_r = interface6_bank_bus_dat_w[1:0];
assign basesoc_uart_eventmanager_status_re = ((csrbank6_sel & interface6_bank_bus_we) & (interface6_bank_bus_adr[2:0] == 2'd3));
assign basesoc_uart_eventmanager_pending_r = interface6_bank_bus_dat_w[1:0];
assign basesoc_uart_eventmanager_pending_re = ((csrbank6_sel & interface6_bank_bus_we) & (interface6_bank_bus_adr[2:0] == 3'd4));
assign csrbank6_ev_enable0_r = interface6_bank_bus_dat_w[1:0];
assign csrbank6_ev_enable0_re = ((csrbank6_sel & interface6_bank_bus_we) & (interface6_bank_bus_adr[2:0] == 3'd5));
assign csrbank6_txfull_w = basesoc_uart_txfull_status;
assign csrbank6_rxempty_w = basesoc_uart_rxempty_status;
assign basesoc_uart_eventmanager_storage = basesoc_uart_eventmanager_storage_full[1:0];
assign csrbank6_ev_enable0_w = basesoc_uart_eventmanager_storage_full[1:0];
assign csrbank7_sel = (interface7_bank_bus_adr[13:9] == 2'd2);
assign csrbank7_tuning_word0_r = interface7_bank_bus_dat_w[31:0];
assign csrbank7_tuning_word0_re = ((csrbank7_sel & interface7_bank_bus_we) & (interface7_bank_bus_adr[0] == 1'd0));
assign basesoc_uart_phy_storage = basesoc_uart_phy_storage_full[31:0];
assign csrbank7_tuning_word0_w = basesoc_uart_phy_storage_full[31:0];
assign interface0_bank_bus_adr = basesoc_interface_adr;
assign interface1_bank_bus_adr = basesoc_interface_adr;
assign interface2_bank_bus_adr = basesoc_interface_adr;
assign interface3_bank_bus_adr = basesoc_interface_adr;
assign interface4_bank_bus_adr = basesoc_interface_adr;
assign interface5_bank_bus_adr = basesoc_interface_adr;
assign interface6_bank_bus_adr = basesoc_interface_adr;
assign interface7_bank_bus_adr = basesoc_interface_adr;
assign sram_bus_adr = basesoc_interface_adr;
assign interface0_bank_bus_we = basesoc_interface_we;
assign interface1_bank_bus_we = basesoc_interface_we;
assign interface2_bank_bus_we = basesoc_interface_we;
assign interface3_bank_bus_we = basesoc_interface_we;
assign interface4_bank_bus_we = basesoc_interface_we;
assign interface5_bank_bus_we = basesoc_interface_we;
assign interface6_bank_bus_we = basesoc_interface_we;
assign interface7_bank_bus_we = basesoc_interface_we;
assign sram_bus_we = basesoc_interface_we;
assign interface0_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface1_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface2_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface3_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface4_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface5_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface6_bank_bus_dat_w = basesoc_interface_dat_w;
assign interface7_bank_bus_dat_w = basesoc_interface_dat_w;
assign sram_bus_dat_w = basesoc_interface_dat_w;
assign basesoc_interface_dat_r = ((((((((interface0_bank_bus_dat_r | interface1_bank_bus_dat_r) | interface2_bank_bus_dat_r) | interface3_bank_bus_dat_r) | interface4_bank_bus_dat_r) | interface5_bank_bus_dat_r) | interface6_bank_bus_dat_r) | interface7_bank_bus_dat_r) | sram_bus_dat_r);
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
assign status = xilinxmultiregimpl1_regs1;
assign xilinxmultiregimpl1 = {user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};

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
	if (SD_machine_done1) begin
		SD_data_read <= SD_machine_data;
	end
	if (SD_machine_start) begin
		SD_cs <= SD_xfer_cs;
		SD_machine_n_write <= SD_xfer_write_length;
		SD_machine_n_read <= SD_xfer_read_length;
		SD_machine_data <= SD_data_write;
		SD_pending1 <= 1'd0;
	end
	if (SD_start) begin
		SD_data_write <= SD_mosi_data;
		SD_pending1 <= 1'd1;
	end
	SD_active <= SD_machine_cs;
	SD_pending0 <= SD_pending1;
	if ((SD_machine_edge & SD_machine_shift)) begin
		SD_machine_write0 <= SD_machine_write;
	end
	if (SD_machine_cg_ce) begin
		if (SD_machine_zero) begin
			SD_machine_bias1 <= 1'd0;
		end else begin
			SD_machine_cnt <= (SD_machine_cnt - 1'd1);
		end
		if (SD_machine_edge) begin
			SD_machine_cnt <= SD_machine_load[7:1];
			SD_machine_bias1 <= (SD_machine_load[0] & (SD_machine_clk ^ SD_machine_bias0));
			SD_machine_clk <= (~SD_machine_clk);
		end
	end
	if (SD_machine_reg_ce) begin
		if (SD_machine_lsb) begin
			if (SD_machine_shift) begin
				SD_machine_data[30:0] <= SD_machine_data[31:1];
			end
			if (SD_machine_sample) begin
				SD_machine_data[0] <= SD_machine_i;
			end
		end else begin
			if (SD_machine_shift) begin
				SD_machine_data[31:1] <= SD_machine_data[30:0];
			end
			if (SD_machine_sample) begin
				SD_machine_data[0] <= SD_machine_i;
			end
		end
	end
	if (SD_machine_bits_ce) begin
		if (SD_machine_write) begin
			SD_machine_n_write <= (SD_machine_n_write - 1'd1);
		end else begin
			if (SD_machine_read) begin
				SD_machine_n_read <= (SD_machine_n_read - 1'd1);
			end
		end
	end
	if (SD_machine_fsm_ce) begin
		state <= next_state;
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
		case (interface0_bank_bus_adr[2:0])
			1'd0: begin
				interface0_bank_bus_dat_r <= csrbank0_config0_w;
			end
			1'd1: begin
				interface0_bank_bus_dat_r <= csrbank0_xfer0_w;
			end
			2'd2: begin
				interface0_bank_bus_dat_r <= SD_start_w;
			end
			2'd3: begin
				interface0_bank_bus_dat_r <= csrbank0_active_w;
			end
			3'd4: begin
				interface0_bank_bus_dat_r <= csrbank0_pending_w;
			end
			3'd5: begin
				interface0_bank_bus_dat_r <= csrbank0_mosi_data0_w;
			end
			3'd6: begin
				interface0_bank_bus_dat_r <= csrbank0_miso_data_w;
			end
		endcase
	end
	if (csrbank0_config0_re) begin
		SD_config_storage_full[31:0] <= csrbank0_config0_r;
	end
	SD_config_re <= csrbank0_config0_re;
	if (csrbank0_xfer0_re) begin
		SD_xfer_storage_full[31:0] <= csrbank0_xfer0_r;
	end
	SD_xfer_re <= csrbank0_xfer0_re;
	if (csrbank0_mosi_data0_re) begin
		SD_mosi_data_storage_full[31:0] <= csrbank0_mosi_data0_r;
	end
	SD_mosi_data_re <= csrbank0_mosi_data0_re;
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
		case (interface2_bank_bus_adr[1:0])
			1'd0: begin
				interface2_bank_bus_dat_r <= basesoc_ctrl_reset_reset_w;
			end
			1'd1: begin
				interface2_bank_bus_dat_r <= csrbank2_scratch0_w;
			end
			2'd2: begin
				interface2_bank_bus_dat_r <= csrbank2_bus_errors_w;
			end
		endcase
	end
	if (csrbank2_scratch0_re) begin
		basesoc_ctrl_storage_full[31:0] <= csrbank2_scratch0_r;
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
	sel_r <= sel;
	interface4_bank_bus_dat_r <= 1'd0;
	if (csrbank4_sel) begin
		case (interface4_bank_bus_adr[0])
			1'd0: begin
				interface4_bank_bus_dat_r <= csrbank4_out0_w;
			end
		endcase
	end
	if (csrbank4_out0_re) begin
		storage_full[15:0] <= csrbank4_out0_r;
	end
	re <= csrbank4_out0_re;
	interface5_bank_bus_dat_r <= 1'd0;
	if (csrbank5_sel) begin
		case (interface5_bank_bus_adr[2:0])
			1'd0: begin
				interface5_bank_bus_dat_r <= csrbank5_load0_w;
			end
			1'd1: begin
				interface5_bank_bus_dat_r <= csrbank5_reload0_w;
			end
			2'd2: begin
				interface5_bank_bus_dat_r <= csrbank5_en0_w;
			end
			2'd3: begin
				interface5_bank_bus_dat_r <= basesoc_timer0_update_value_w;
			end
			3'd4: begin
				interface5_bank_bus_dat_r <= csrbank5_value_w;
			end
			3'd5: begin
				interface5_bank_bus_dat_r <= basesoc_timer0_eventmanager_status_w;
			end
			3'd6: begin
				interface5_bank_bus_dat_r <= basesoc_timer0_eventmanager_pending_w;
			end
			3'd7: begin
				interface5_bank_bus_dat_r <= csrbank5_ev_enable0_w;
			end
		endcase
	end
	if (csrbank5_load0_re) begin
		basesoc_timer0_load_storage_full[31:0] <= csrbank5_load0_r;
	end
	basesoc_timer0_load_re <= csrbank5_load0_re;
	if (csrbank5_reload0_re) begin
		basesoc_timer0_reload_storage_full[31:0] <= csrbank5_reload0_r;
	end
	basesoc_timer0_reload_re <= csrbank5_reload0_re;
	if (csrbank5_en0_re) begin
		basesoc_timer0_en_storage_full <= csrbank5_en0_r;
	end
	basesoc_timer0_en_re <= csrbank5_en0_re;
	if (csrbank5_ev_enable0_re) begin
		basesoc_timer0_eventmanager_storage_full <= csrbank5_ev_enable0_r;
	end
	basesoc_timer0_eventmanager_re <= csrbank5_ev_enable0_re;
	interface6_bank_bus_dat_r <= 1'd0;
	if (csrbank6_sel) begin
		case (interface6_bank_bus_adr[2:0])
			1'd0: begin
				interface6_bank_bus_dat_r <= basesoc_uart_rxtx_w;
			end
			1'd1: begin
				interface6_bank_bus_dat_r <= csrbank6_txfull_w;
			end
			2'd2: begin
				interface6_bank_bus_dat_r <= csrbank6_rxempty_w;
			end
			2'd3: begin
				interface6_bank_bus_dat_r <= basesoc_uart_eventmanager_status_w;
			end
			3'd4: begin
				interface6_bank_bus_dat_r <= basesoc_uart_eventmanager_pending_w;
			end
			3'd5: begin
				interface6_bank_bus_dat_r <= csrbank6_ev_enable0_w;
			end
		endcase
	end
	if (csrbank6_ev_enable0_re) begin
		basesoc_uart_eventmanager_storage_full[1:0] <= csrbank6_ev_enable0_r;
	end
	basesoc_uart_eventmanager_re <= csrbank6_ev_enable0_re;
	interface7_bank_bus_dat_r <= 1'd0;
	if (csrbank7_sel) begin
		case (interface7_bank_bus_adr[0])
			1'd0: begin
				interface7_bank_bus_dat_r <= csrbank7_tuning_word0_w;
			end
		endcase
	end
	if (csrbank7_tuning_word0_re) begin
		basesoc_uart_phy_storage_full[31:0] <= csrbank7_tuning_word0_r;
	end
	basesoc_uart_phy_re <= csrbank7_tuning_word0_re;
	if (sys_rst) begin
		basesoc_ctrl_storage_full <= 32'd305419896;
		basesoc_ctrl_re <= 1'd0;
		basesoc_ctrl_bus_errors <= 32'd0;
		basesoc_rom_bus_ack <= 1'd0;
		basesoc_sram_bus_ack <= 1'd0;
		basesoc_main_ram_bus_ack <= 1'd0;
		basesoc_interface_adr <= 14'd0;
		basesoc_interface_we <= 1'd0;
		basesoc_interface_dat_w <= 32'd0;
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
		storage_full <= 16'd0;
		re <= 1'd0;
		SD_active <= 1'd0;
		SD_pending0 <= 1'd0;
		SD_machine_clk <= 1'd1;
		SD_machine_cnt <= 8'd0;
		SD_machine_bias1 <= 1'd0;
		SD_machine_data <= 32'd0;
		SD_machine_n_read <= 6'd0;
		SD_machine_n_write <= 6'd0;
		SD_machine_write0 <= 1'd0;
		SD_pending1 <= 1'd0;
		SD_cs <= 16'd0;
		SD_data_read <= 32'd0;
		SD_data_write <= 32'd0;
		SD_config_storage_full <= 32'd0;
		SD_config_re <= 1'd0;
		SD_xfer_storage_full <= 32'd0;
		SD_xfer_re <= 1'd0;
		SD_mosi_data_storage_full <= 32'd0;
		SD_mosi_data_re <= 1'd0;
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
		state <= 2'd0;
		grant <= 1'd0;
		slave_sel_r <= 4'd0;
		count <= 20'd1000000;
		interface0_bank_bus_dat_r <= 32'd0;
		interface1_bank_bus_dat_r <= 32'd0;
		interface2_bank_bus_dat_r <= 32'd0;
		interface3_bank_bus_dat_r <= 32'd0;
		sel_r <= 1'd0;
		interface4_bank_bus_dat_r <= 32'd0;
		interface5_bank_bus_dat_r <= 32'd0;
		interface6_bank_bus_dat_r <= 32'd0;
		interface7_bank_bus_dat_r <= 32'd0;
	end
	xilinxmultiregimpl0_regs0 <= serial_rx;
	xilinxmultiregimpl0_regs1 <= xilinxmultiregimpl0_regs0;
	xilinxmultiregimpl1_regs0 <= {user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
	xilinxmultiregimpl1_regs1 <= xilinxmultiregimpl1_regs0;
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

assign sd_spi_cs_n = SD_cs_n_t_oe ? SD_cs_n_t_o : 1'bz;
assign SD_cs_n_t_i = sd_spi_cs_n;

assign sd_spi_clk = SD_clk_t_oe ? SD_clk_t_o : 1'bz;
assign SD_clk_t_i = sd_spi_clk;

assign sd_spi_mosi = SD_mosi_t_oe ? SD_mosi_t_o : 1'bz;
assign SD_mosi_t_i = sd_spi_mosi;

endmodule
