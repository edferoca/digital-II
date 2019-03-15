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
	input user_btn0,
	input user_btn1,
	input user_btn2,
	input user_btn3,
	input user_btn4,
	input user_btn5,
	input user_btn6,
	input user_btn7
);

wire __main___ctrl_reset_reset_re;
wire __main___ctrl_reset_reset_r;
reg __main___ctrl_reset_reset_w = 1'd0;
reg [31:0] __main___ctrl_storage_full = 32'd305419896;
wire [31:0] __main___ctrl_storage;
reg __main___ctrl_re = 1'd0;
wire [31:0] __main___ctrl_bus_errors_status;
wire __main___ctrl_reset;
wire __main___ctrl_bus_error;
reg [31:0] __main___ctrl_bus_errors = 32'd0;
wire __main___lm32_reset;
wire [29:0] __main___lm32_ibus_adr;
wire [31:0] __main___lm32_ibus_dat_w;
wire [31:0] __main___lm32_ibus_dat_r;
wire [3:0] __main___lm32_ibus_sel;
wire __main___lm32_ibus_cyc;
wire __main___lm32_ibus_stb;
wire __main___lm32_ibus_ack;
wire __main___lm32_ibus_we;
wire [2:0] __main___lm32_ibus_cti;
wire [1:0] __main___lm32_ibus_bte;
wire __main___lm32_ibus_err;
wire [29:0] __main___lm32_dbus_adr;
wire [31:0] __main___lm32_dbus_dat_w;
wire [31:0] __main___lm32_dbus_dat_r;
wire [3:0] __main___lm32_dbus_sel;
wire __main___lm32_dbus_cyc;
wire __main___lm32_dbus_stb;
wire __main___lm32_dbus_ack;
wire __main___lm32_dbus_we;
wire [2:0] __main___lm32_dbus_cti;
wire [1:0] __main___lm32_dbus_bte;
wire __main___lm32_dbus_err;
reg [31:0] __main___lm32_interrupt = 32'd0;
wire [31:0] __main___lm32_i_adr_o;
wire [31:0] __main___lm32_d_adr_o;
wire [29:0] __main___rom_bus_adr;
wire [31:0] __main___rom_bus_dat_w;
wire [31:0] __main___rom_bus_dat_r;
wire [3:0] __main___rom_bus_sel;
wire __main___rom_bus_cyc;
wire __main___rom_bus_stb;
reg __main___rom_bus_ack = 1'd0;
wire __main___rom_bus_we;
wire [2:0] __main___rom_bus_cti;
wire [1:0] __main___rom_bus_bte;
reg __main___rom_bus_err = 1'd0;
wire [12:0] __main___rom_adr;
wire [31:0] __main___rom_dat_r;
wire [29:0] __main___sram_bus_adr;
wire [31:0] __main___sram_bus_dat_w;
wire [31:0] __main___sram_bus_dat_r;
wire [3:0] __main___sram_bus_sel;
wire __main___sram_bus_cyc;
wire __main___sram_bus_stb;
reg __main___sram_bus_ack = 1'd0;
wire __main___sram_bus_we;
wire [2:0] __main___sram_bus_cti;
wire [1:0] __main___sram_bus_bte;
reg __main___sram_bus_err = 1'd0;
wire [9:0] __main___sram_adr;
wire [31:0] __main___sram_dat_r;
reg [3:0] __main___sram_we = 4'd0;
wire [31:0] __main___sram_dat_w;
wire [29:0] __main___main_ram_bus_adr;
wire [31:0] __main___main_ram_bus_dat_w;
wire [31:0] __main___main_ram_bus_dat_r;
wire [3:0] __main___main_ram_bus_sel;
wire __main___main_ram_bus_cyc;
wire __main___main_ram_bus_stb;
reg __main___main_ram_bus_ack = 1'd0;
wire __main___main_ram_bus_we;
wire [2:0] __main___main_ram_bus_cti;
wire [1:0] __main___main_ram_bus_bte;
reg __main___main_ram_bus_err = 1'd0;
wire [11:0] __main___main_ram_adr;
wire [31:0] __main___main_ram_dat_r;
reg [3:0] __main___main_ram_we = 4'd0;
wire [31:0] __main___main_ram_dat_w;
reg [13:0] __main___interface_adr = 14'd0;
reg __main___interface_we = 1'd0;
reg [7:0] __main___interface_dat_w = 8'd0;
wire [7:0] __main___interface_dat_r;
wire [29:0] __main___bus_wishbone_adr;
wire [31:0] __main___bus_wishbone_dat_w;
reg [31:0] __main___bus_wishbone_dat_r = 32'd0;
wire [3:0] __main___bus_wishbone_sel;
wire __main___bus_wishbone_cyc;
wire __main___bus_wishbone_stb;
reg __main___bus_wishbone_ack = 1'd0;
wire __main___bus_wishbone_we;
wire [2:0] __main___bus_wishbone_cti;
wire [1:0] __main___bus_wishbone_bte;
reg __main___bus_wishbone_err = 1'd0;
reg [1:0] __main___counter = 2'd0;
reg [31:0] __main___uart_phy_storage_full = 32'd4947802;
wire [31:0] __main___uart_phy_storage;
reg __main___uart_phy_re = 1'd0;
wire __main___uart_phy_sink_valid;
reg __main___uart_phy_sink_ready = 1'd0;
wire __main___uart_phy_sink_first;
wire __main___uart_phy_sink_last;
wire [7:0] __main___uart_phy_sink_payload_data;
reg __main___uart_phy_uart_clk_txen = 1'd0;
reg [31:0] __main___uart_phy_phase_accumulator_tx = 32'd0;
reg [7:0] __main___uart_phy_tx_reg = 8'd0;
reg [3:0] __main___uart_phy_tx_bitcount = 4'd0;
reg __main___uart_phy_tx_busy = 1'd0;
reg __main___uart_phy_source_valid = 1'd0;
wire __main___uart_phy_source_ready;
reg __main___uart_phy_source_first = 1'd0;
reg __main___uart_phy_source_last = 1'd0;
reg [7:0] __main___uart_phy_source_payload_data = 8'd0;
reg __main___uart_phy_uart_clk_rxen = 1'd0;
reg [31:0] __main___uart_phy_phase_accumulator_rx = 32'd0;
wire __main___uart_phy_rx;
reg __main___uart_phy_rx_r = 1'd0;
reg [7:0] __main___uart_phy_rx_reg = 8'd0;
reg [3:0] __main___uart_phy_rx_bitcount = 4'd0;
reg __main___uart_phy_rx_busy = 1'd0;
wire __main___uart_rxtx_re;
wire [7:0] __main___uart_rxtx_r;
wire [7:0] __main___uart_rxtx_w;
wire __main___uart_txfull_status;
wire __main___uart_rxempty_status;
wire __main___uart_irq;
wire __main___uart_tx_status;
reg __main___uart_tx_pending = 1'd0;
wire __main___uart_tx_trigger;
reg __main___uart_tx_clear = 1'd0;
reg __main___uart_tx_old_trigger = 1'd0;
wire __main___uart_rx_status;
reg __main___uart_rx_pending = 1'd0;
wire __main___uart_rx_trigger;
reg __main___uart_rx_clear = 1'd0;
reg __main___uart_rx_old_trigger = 1'd0;
wire __main___uart_eventmanager_status_re;
wire [1:0] __main___uart_eventmanager_status_r;
reg [1:0] __main___uart_eventmanager_status_w = 2'd0;
wire __main___uart_eventmanager_pending_re;
wire [1:0] __main___uart_eventmanager_pending_r;
reg [1:0] __main___uart_eventmanager_pending_w = 2'd0;
reg [1:0] __main___uart_eventmanager_storage_full = 2'd0;
wire [1:0] __main___uart_eventmanager_storage;
reg __main___uart_eventmanager_re = 1'd0;
wire __main___uart_tx_fifo_sink_valid;
wire __main___uart_tx_fifo_sink_ready;
reg __main___uart_tx_fifo_sink_first = 1'd0;
reg __main___uart_tx_fifo_sink_last = 1'd0;
wire [7:0] __main___uart_tx_fifo_sink_payload_data;
wire __main___uart_tx_fifo_source_valid;
wire __main___uart_tx_fifo_source_ready;
wire __main___uart_tx_fifo_source_first;
wire __main___uart_tx_fifo_source_last;
wire [7:0] __main___uart_tx_fifo_source_payload_data;
wire __main___uart_tx_fifo_re;
reg __main___uart_tx_fifo_readable = 1'd0;
wire __main___uart_tx_fifo_syncfifo_we;
wire __main___uart_tx_fifo_syncfifo_writable;
wire __main___uart_tx_fifo_syncfifo_re;
wire __main___uart_tx_fifo_syncfifo_readable;
wire [9:0] __main___uart_tx_fifo_syncfifo_din;
wire [9:0] __main___uart_tx_fifo_syncfifo_dout;
reg [4:0] __main___uart_tx_fifo_level0 = 5'd0;
reg __main___uart_tx_fifo_replace = 1'd0;
reg [3:0] __main___uart_tx_fifo_produce = 4'd0;
reg [3:0] __main___uart_tx_fifo_consume = 4'd0;
reg [3:0] __main___uart_tx_fifo_wrport_adr = 4'd0;
wire [9:0] __main___uart_tx_fifo_wrport_dat_r;
wire __main___uart_tx_fifo_wrport_we;
wire [9:0] __main___uart_tx_fifo_wrport_dat_w;
wire __main___uart_tx_fifo_do_read;
wire [3:0] __main___uart_tx_fifo_rdport_adr;
wire [9:0] __main___uart_tx_fifo_rdport_dat_r;
wire __main___uart_tx_fifo_rdport_re;
wire [4:0] __main___uart_tx_fifo_level1;
wire [7:0] __main___uart_tx_fifo_fifo_in_payload_data;
wire __main___uart_tx_fifo_fifo_in_first;
wire __main___uart_tx_fifo_fifo_in_last;
wire [7:0] __main___uart_tx_fifo_fifo_out_payload_data;
wire __main___uart_tx_fifo_fifo_out_first;
wire __main___uart_tx_fifo_fifo_out_last;
wire __main___uart_rx_fifo_sink_valid;
wire __main___uart_rx_fifo_sink_ready;
wire __main___uart_rx_fifo_sink_first;
wire __main___uart_rx_fifo_sink_last;
wire [7:0] __main___uart_rx_fifo_sink_payload_data;
wire __main___uart_rx_fifo_source_valid;
wire __main___uart_rx_fifo_source_ready;
wire __main___uart_rx_fifo_source_first;
wire __main___uart_rx_fifo_source_last;
wire [7:0] __main___uart_rx_fifo_source_payload_data;
wire __main___uart_rx_fifo_re;
reg __main___uart_rx_fifo_readable = 1'd0;
wire __main___uart_rx_fifo_syncfifo_we;
wire __main___uart_rx_fifo_syncfifo_writable;
wire __main___uart_rx_fifo_syncfifo_re;
wire __main___uart_rx_fifo_syncfifo_readable;
wire [9:0] __main___uart_rx_fifo_syncfifo_din;
wire [9:0] __main___uart_rx_fifo_syncfifo_dout;
reg [4:0] __main___uart_rx_fifo_level0 = 5'd0;
reg __main___uart_rx_fifo_replace = 1'd0;
reg [3:0] __main___uart_rx_fifo_produce = 4'd0;
reg [3:0] __main___uart_rx_fifo_consume = 4'd0;
reg [3:0] __main___uart_rx_fifo_wrport_adr = 4'd0;
wire [9:0] __main___uart_rx_fifo_wrport_dat_r;
wire __main___uart_rx_fifo_wrport_we;
wire [9:0] __main___uart_rx_fifo_wrport_dat_w;
wire __main___uart_rx_fifo_do_read;
wire [3:0] __main___uart_rx_fifo_rdport_adr;
wire [9:0] __main___uart_rx_fifo_rdport_dat_r;
wire __main___uart_rx_fifo_rdport_re;
wire [4:0] __main___uart_rx_fifo_level1;
wire [7:0] __main___uart_rx_fifo_fifo_in_payload_data;
wire __main___uart_rx_fifo_fifo_in_first;
wire __main___uart_rx_fifo_fifo_in_last;
wire [7:0] __main___uart_rx_fifo_fifo_out_payload_data;
wire __main___uart_rx_fifo_fifo_out_first;
wire __main___uart_rx_fifo_fifo_out_last;
reg __main___uart_reset = 1'd0;
reg [31:0] __main___timer0_load_storage_full = 32'd0;
wire [31:0] __main___timer0_load_storage;
reg __main___timer0_load_re = 1'd0;
reg [31:0] __main___timer0_reload_storage_full = 32'd0;
wire [31:0] __main___timer0_reload_storage;
reg __main___timer0_reload_re = 1'd0;
reg __main___timer0_en_storage_full = 1'd0;
wire __main___timer0_en_storage;
reg __main___timer0_en_re = 1'd0;
wire __main___timer0_update_value_re;
wire __main___timer0_update_value_r;
reg __main___timer0_update_value_w = 1'd0;
reg [31:0] __main___timer0_value_status = 32'd0;
wire __main___timer0_irq;
wire __main___timer0_zero_status;
reg __main___timer0_zero_pending = 1'd0;
wire __main___timer0_zero_trigger;
reg __main___timer0_zero_clear = 1'd0;
reg __main___timer0_zero_old_trigger = 1'd0;
wire __main___timer0_eventmanager_status_re;
wire __main___timer0_eventmanager_status_r;
wire __main___timer0_eventmanager_status_w;
wire __main___timer0_eventmanager_pending_re;
wire __main___timer0_eventmanager_pending_r;
wire __main___timer0_eventmanager_pending_w;
reg __main___timer0_eventmanager_storage_full = 1'd0;
wire __main___timer0_eventmanager_storage;
reg __main___timer0_eventmanager_re = 1'd0;
reg [31:0] __main___timer0_value = 32'd0;
wire sys_clk;
wire sys_rst;
wire por_clk;
reg __main___int_rst = 1'd1;
reg [7:0] __main___storage_full = 8'd0;
wire [7:0] __main___storage;
reg __main___re = 1'd0;
wire [7:0] __main___in_status;
wire __main___irq;
wire __main___cero_status;
reg __main___cero_pending = 1'd0;
wire __main___cero_trigger;
reg __main___cero_clear = 1'd0;
reg __main___cero_old_trigger = 1'd0;
wire __main___uno_status;
reg __main___uno_pending = 1'd0;
wire __main___uno_trigger;
reg __main___uno_clear = 1'd0;
reg __main___uno_old_trigger = 1'd0;
wire __main___dos_status;
reg __main___dos_pending = 1'd0;
wire __main___dos_trigger;
reg __main___dos_clear = 1'd0;
reg __main___dos_old_trigger = 1'd0;
wire __main___tres_status;
reg __main___tres_pending = 1'd0;
wire __main___tres_trigger;
reg __main___tres_clear = 1'd0;
reg __main___tres_old_trigger = 1'd0;
wire __main___cuatro_status;
reg __main___cuatro_pending = 1'd0;
wire __main___cuatro_trigger;
reg __main___cuatro_clear = 1'd0;
reg __main___cuatro_old_trigger = 1'd0;
wire __main___cinco_status;
reg __main___cinco_pending = 1'd0;
wire __main___cinco_trigger;
reg __main___cinco_clear = 1'd0;
reg __main___cinco_old_trigger = 1'd0;
wire __main___seis_status;
reg __main___seis_pending = 1'd0;
wire __main___seis_trigger;
reg __main___seis_clear = 1'd0;
reg __main___seis_old_trigger = 1'd0;
wire __main___siete_status;
reg __main___siete_pending = 1'd0;
wire __main___siete_trigger;
reg __main___siete_clear = 1'd0;
reg __main___siete_old_trigger = 1'd0;
wire builder_status_re;
wire [7:0] builder_status_r;
reg [7:0] builder_status_w = 8'd0;
wire builder_pending_re;
wire [7:0] builder_pending_r;
reg [7:0] builder_pending_w = 8'd0;
reg [7:0] builder_storage_full = 8'd0;
wire [7:0] builder_storage;
reg builder_re = 1'd0;
wire [29:0] builder_shared_adr;
wire [31:0] builder_shared_dat_w;
reg [31:0] builder_shared_dat_r = 32'd0;
wire [3:0] builder_shared_sel;
wire builder_shared_cyc;
wire builder_shared_stb;
reg builder_shared_ack = 1'd0;
wire builder_shared_we;
wire [2:0] builder_shared_cti;
wire [1:0] builder_shared_bte;
wire builder_shared_err;
wire [1:0] builder_request;
reg builder_grant = 1'd0;
reg [3:0] builder_slave_sel = 4'd0;
reg [3:0] builder_slave_sel_r = 4'd0;
reg builder_error = 1'd0;
wire builder_wait;
wire builder_done;
reg [19:0] builder_count = 20'd1000000;
wire [13:0] builder_interface0_bank_bus_adr;
wire builder_interface0_bank_bus_we;
wire [7:0] builder_interface0_bank_bus_dat_w;
reg [7:0] builder_interface0_bank_bus_dat_r = 8'd0;
wire builder_csrbank0_in_re;
wire [7:0] builder_csrbank0_in_r;
wire [7:0] builder_csrbank0_in_w;
wire builder_csrbank0_ev_enable0_re;
wire [7:0] builder_csrbank0_ev_enable0_r;
wire [7:0] builder_csrbank0_ev_enable0_w;
wire builder_csrbank0_sel;
wire [13:0] builder_interface1_bank_bus_adr;
wire builder_interface1_bank_bus_we;
wire [7:0] builder_interface1_bank_bus_dat_w;
reg [7:0] builder_interface1_bank_bus_dat_r = 8'd0;
wire builder_csrbank1_scratch3_re;
wire [7:0] builder_csrbank1_scratch3_r;
wire [7:0] builder_csrbank1_scratch3_w;
wire builder_csrbank1_scratch2_re;
wire [7:0] builder_csrbank1_scratch2_r;
wire [7:0] builder_csrbank1_scratch2_w;
wire builder_csrbank1_scratch1_re;
wire [7:0] builder_csrbank1_scratch1_r;
wire [7:0] builder_csrbank1_scratch1_w;
wire builder_csrbank1_scratch0_re;
wire [7:0] builder_csrbank1_scratch0_r;
wire [7:0] builder_csrbank1_scratch0_w;
wire builder_csrbank1_bus_errors3_re;
wire [7:0] builder_csrbank1_bus_errors3_r;
wire [7:0] builder_csrbank1_bus_errors3_w;
wire builder_csrbank1_bus_errors2_re;
wire [7:0] builder_csrbank1_bus_errors2_r;
wire [7:0] builder_csrbank1_bus_errors2_w;
wire builder_csrbank1_bus_errors1_re;
wire [7:0] builder_csrbank1_bus_errors1_r;
wire [7:0] builder_csrbank1_bus_errors1_w;
wire builder_csrbank1_bus_errors0_re;
wire [7:0] builder_csrbank1_bus_errors0_r;
wire [7:0] builder_csrbank1_bus_errors0_w;
wire builder_csrbank1_sel;
wire [13:0] builder_sram_bus_adr;
wire builder_sram_bus_we;
wire [7:0] builder_sram_bus_dat_w;
reg [7:0] builder_sram_bus_dat_r = 8'd0;
wire [5:0] builder_adr;
wire [7:0] builder_dat_r;
wire builder_sel;
reg builder_sel_r = 1'd0;
wire [13:0] builder_interface2_bank_bus_adr;
wire builder_interface2_bank_bus_we;
wire [7:0] builder_interface2_bank_bus_dat_w;
reg [7:0] builder_interface2_bank_bus_dat_r = 8'd0;
wire builder_csrbank2_out0_re;
wire [7:0] builder_csrbank2_out0_r;
wire [7:0] builder_csrbank2_out0_w;
wire builder_csrbank2_sel;
wire [13:0] builder_interface3_bank_bus_adr;
wire builder_interface3_bank_bus_we;
wire [7:0] builder_interface3_bank_bus_dat_w;
reg [7:0] builder_interface3_bank_bus_dat_r = 8'd0;
wire builder_csrbank3_load3_re;
wire [7:0] builder_csrbank3_load3_r;
wire [7:0] builder_csrbank3_load3_w;
wire builder_csrbank3_load2_re;
wire [7:0] builder_csrbank3_load2_r;
wire [7:0] builder_csrbank3_load2_w;
wire builder_csrbank3_load1_re;
wire [7:0] builder_csrbank3_load1_r;
wire [7:0] builder_csrbank3_load1_w;
wire builder_csrbank3_load0_re;
wire [7:0] builder_csrbank3_load0_r;
wire [7:0] builder_csrbank3_load0_w;
wire builder_csrbank3_reload3_re;
wire [7:0] builder_csrbank3_reload3_r;
wire [7:0] builder_csrbank3_reload3_w;
wire builder_csrbank3_reload2_re;
wire [7:0] builder_csrbank3_reload2_r;
wire [7:0] builder_csrbank3_reload2_w;
wire builder_csrbank3_reload1_re;
wire [7:0] builder_csrbank3_reload1_r;
wire [7:0] builder_csrbank3_reload1_w;
wire builder_csrbank3_reload0_re;
wire [7:0] builder_csrbank3_reload0_r;
wire [7:0] builder_csrbank3_reload0_w;
wire builder_csrbank3_en0_re;
wire builder_csrbank3_en0_r;
wire builder_csrbank3_en0_w;
wire builder_csrbank3_value3_re;
wire [7:0] builder_csrbank3_value3_r;
wire [7:0] builder_csrbank3_value3_w;
wire builder_csrbank3_value2_re;
wire [7:0] builder_csrbank3_value2_r;
wire [7:0] builder_csrbank3_value2_w;
wire builder_csrbank3_value1_re;
wire [7:0] builder_csrbank3_value1_r;
wire [7:0] builder_csrbank3_value1_w;
wire builder_csrbank3_value0_re;
wire [7:0] builder_csrbank3_value0_r;
wire [7:0] builder_csrbank3_value0_w;
wire builder_csrbank3_ev_enable0_re;
wire builder_csrbank3_ev_enable0_r;
wire builder_csrbank3_ev_enable0_w;
wire builder_csrbank3_sel;
wire [13:0] builder_interface4_bank_bus_adr;
wire builder_interface4_bank_bus_we;
wire [7:0] builder_interface4_bank_bus_dat_w;
reg [7:0] builder_interface4_bank_bus_dat_r = 8'd0;
wire builder_csrbank4_txfull_re;
wire builder_csrbank4_txfull_r;
wire builder_csrbank4_txfull_w;
wire builder_csrbank4_rxempty_re;
wire builder_csrbank4_rxempty_r;
wire builder_csrbank4_rxempty_w;
wire builder_csrbank4_ev_enable0_re;
wire [1:0] builder_csrbank4_ev_enable0_r;
wire [1:0] builder_csrbank4_ev_enable0_w;
wire builder_csrbank4_sel;
wire [13:0] builder_interface5_bank_bus_adr;
wire builder_interface5_bank_bus_we;
wire [7:0] builder_interface5_bank_bus_dat_w;
reg [7:0] builder_interface5_bank_bus_dat_r = 8'd0;
wire builder_csrbank5_tuning_word3_re;
wire [7:0] builder_csrbank5_tuning_word3_r;
wire [7:0] builder_csrbank5_tuning_word3_w;
wire builder_csrbank5_tuning_word2_re;
wire [7:0] builder_csrbank5_tuning_word2_r;
wire [7:0] builder_csrbank5_tuning_word2_w;
wire builder_csrbank5_tuning_word1_re;
wire [7:0] builder_csrbank5_tuning_word1_r;
wire [7:0] builder_csrbank5_tuning_word1_w;
wire builder_csrbank5_tuning_word0_re;
wire [7:0] builder_csrbank5_tuning_word0_r;
wire [7:0] builder_csrbank5_tuning_word0_w;
wire builder_csrbank5_sel;
wire [7:0] builder_slice_proxy0;
wire [7:0] builder_slice_proxy1;
wire [7:0] builder_slice_proxy2;
wire [7:0] builder_slice_proxy3;
wire [7:0] builder_slice_proxy4;
wire [7:0] builder_slice_proxy5;
wire [7:0] builder_slice_proxy6;
wire [7:0] builder_slice_proxy7;
reg [29:0] builder_array_muxed0 = 30'd0;
reg [31:0] builder_array_muxed1 = 32'd0;
reg [3:0] builder_array_muxed2 = 4'd0;
reg builder_array_muxed3 = 1'd0;
reg builder_array_muxed4 = 1'd0;
reg builder_array_muxed5 = 1'd0;
reg [2:0] builder_array_muxed6 = 3'd0;
reg [1:0] builder_array_muxed7 = 2'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg builder_xilinxmultiregimpl0_regs0 = 1'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg builder_xilinxmultiregimpl0_regs1 = 1'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg [7:0] builder_xilinxmultiregimpl1_regs0 = 8'd0;
(* register_balancing = "no", shreg_extract = "no" *) reg [7:0] builder_xilinxmultiregimpl1_regs1 = 8'd0;
wire builder_xilinxmultiregimpl1;

assign __main___lm32_reset = __main___ctrl_reset;
assign __main___ctrl_bus_error = builder_error;
always @(*) begin
	__main___lm32_interrupt <= 32'd0;
	__main___lm32_interrupt[1] <= __main___timer0_irq;
	__main___lm32_interrupt[2] <= __main___uart_irq;
	__main___lm32_interrupt[4] <= __main___irq;
end
assign __main___ctrl_reset = __main___ctrl_reset_reset_re;
assign __main___ctrl_bus_errors_status = __main___ctrl_bus_errors;
assign __main___lm32_ibus_adr = __main___lm32_i_adr_o[31:2];
assign __main___lm32_dbus_adr = __main___lm32_d_adr_o[31:2];
assign __main___rom_adr = __main___rom_bus_adr[12:0];
assign __main___rom_bus_dat_r = __main___rom_dat_r;
always @(*) begin
	__main___sram_we <= 4'd0;
	__main___sram_we[0] <= (((__main___sram_bus_cyc & __main___sram_bus_stb) & __main___sram_bus_we) & __main___sram_bus_sel[0]);
	__main___sram_we[1] <= (((__main___sram_bus_cyc & __main___sram_bus_stb) & __main___sram_bus_we) & __main___sram_bus_sel[1]);
	__main___sram_we[2] <= (((__main___sram_bus_cyc & __main___sram_bus_stb) & __main___sram_bus_we) & __main___sram_bus_sel[2]);
	__main___sram_we[3] <= (((__main___sram_bus_cyc & __main___sram_bus_stb) & __main___sram_bus_we) & __main___sram_bus_sel[3]);
end
assign __main___sram_adr = __main___sram_bus_adr[9:0];
assign __main___sram_bus_dat_r = __main___sram_dat_r;
assign __main___sram_dat_w = __main___sram_bus_dat_w;
always @(*) begin
	__main___main_ram_we <= 4'd0;
	__main___main_ram_we[0] <= (((__main___main_ram_bus_cyc & __main___main_ram_bus_stb) & __main___main_ram_bus_we) & __main___main_ram_bus_sel[0]);
	__main___main_ram_we[1] <= (((__main___main_ram_bus_cyc & __main___main_ram_bus_stb) & __main___main_ram_bus_we) & __main___main_ram_bus_sel[1]);
	__main___main_ram_we[2] <= (((__main___main_ram_bus_cyc & __main___main_ram_bus_stb) & __main___main_ram_bus_we) & __main___main_ram_bus_sel[2]);
	__main___main_ram_we[3] <= (((__main___main_ram_bus_cyc & __main___main_ram_bus_stb) & __main___main_ram_bus_we) & __main___main_ram_bus_sel[3]);
end
assign __main___main_ram_adr = __main___main_ram_bus_adr[11:0];
assign __main___main_ram_bus_dat_r = __main___main_ram_dat_r;
assign __main___main_ram_dat_w = __main___main_ram_bus_dat_w;
assign __main___uart_tx_fifo_sink_valid = __main___uart_rxtx_re;
assign __main___uart_tx_fifo_sink_payload_data = __main___uart_rxtx_r;
assign __main___uart_txfull_status = (~__main___uart_tx_fifo_sink_ready);
assign __main___uart_phy_sink_valid = __main___uart_tx_fifo_source_valid;
assign __main___uart_tx_fifo_source_ready = __main___uart_phy_sink_ready;
assign __main___uart_phy_sink_first = __main___uart_tx_fifo_source_first;
assign __main___uart_phy_sink_last = __main___uart_tx_fifo_source_last;
assign __main___uart_phy_sink_payload_data = __main___uart_tx_fifo_source_payload_data;
assign __main___uart_tx_trigger = (~__main___uart_tx_fifo_sink_ready);
assign __main___uart_rx_fifo_sink_valid = __main___uart_phy_source_valid;
assign __main___uart_phy_source_ready = __main___uart_rx_fifo_sink_ready;
assign __main___uart_rx_fifo_sink_first = __main___uart_phy_source_first;
assign __main___uart_rx_fifo_sink_last = __main___uart_phy_source_last;
assign __main___uart_rx_fifo_sink_payload_data = __main___uart_phy_source_payload_data;
assign __main___uart_rxempty_status = (~__main___uart_rx_fifo_source_valid);
assign __main___uart_rxtx_w = __main___uart_rx_fifo_source_payload_data;
assign __main___uart_rx_fifo_source_ready = __main___uart_rx_clear;
assign __main___uart_rx_trigger = (~__main___uart_rx_fifo_source_valid);
always @(*) begin
	__main___uart_tx_clear <= 1'd0;
	if ((__main___uart_eventmanager_pending_re & __main___uart_eventmanager_pending_r[0])) begin
		__main___uart_tx_clear <= 1'd1;
	end
end
always @(*) begin
	__main___uart_eventmanager_status_w <= 2'd0;
	__main___uart_eventmanager_status_w[0] <= __main___uart_tx_status;
	__main___uart_eventmanager_status_w[1] <= __main___uart_rx_status;
end
always @(*) begin
	__main___uart_rx_clear <= 1'd0;
	if ((__main___uart_eventmanager_pending_re & __main___uart_eventmanager_pending_r[1])) begin
		__main___uart_rx_clear <= 1'd1;
	end
end
always @(*) begin
	__main___uart_eventmanager_pending_w <= 2'd0;
	__main___uart_eventmanager_pending_w[0] <= __main___uart_tx_pending;
	__main___uart_eventmanager_pending_w[1] <= __main___uart_rx_pending;
end
assign __main___uart_irq = ((__main___uart_eventmanager_pending_w[0] & __main___uart_eventmanager_storage[0]) | (__main___uart_eventmanager_pending_w[1] & __main___uart_eventmanager_storage[1]));
assign __main___uart_tx_status = __main___uart_tx_trigger;
assign __main___uart_rx_status = __main___uart_rx_trigger;
assign __main___uart_tx_fifo_syncfifo_din = {__main___uart_tx_fifo_fifo_in_last, __main___uart_tx_fifo_fifo_in_first, __main___uart_tx_fifo_fifo_in_payload_data};
assign {__main___uart_tx_fifo_fifo_out_last, __main___uart_tx_fifo_fifo_out_first, __main___uart_tx_fifo_fifo_out_payload_data} = __main___uart_tx_fifo_syncfifo_dout;
assign __main___uart_tx_fifo_sink_ready = __main___uart_tx_fifo_syncfifo_writable;
assign __main___uart_tx_fifo_syncfifo_we = __main___uart_tx_fifo_sink_valid;
assign __main___uart_tx_fifo_fifo_in_first = __main___uart_tx_fifo_sink_first;
assign __main___uart_tx_fifo_fifo_in_last = __main___uart_tx_fifo_sink_last;
assign __main___uart_tx_fifo_fifo_in_payload_data = __main___uart_tx_fifo_sink_payload_data;
assign __main___uart_tx_fifo_source_valid = __main___uart_tx_fifo_readable;
assign __main___uart_tx_fifo_source_first = __main___uart_tx_fifo_fifo_out_first;
assign __main___uart_tx_fifo_source_last = __main___uart_tx_fifo_fifo_out_last;
assign __main___uart_tx_fifo_source_payload_data = __main___uart_tx_fifo_fifo_out_payload_data;
assign __main___uart_tx_fifo_re = __main___uart_tx_fifo_source_ready;
assign __main___uart_tx_fifo_syncfifo_re = (__main___uart_tx_fifo_syncfifo_readable & ((~__main___uart_tx_fifo_readable) | __main___uart_tx_fifo_re));
assign __main___uart_tx_fifo_level1 = (__main___uart_tx_fifo_level0 + __main___uart_tx_fifo_readable);
always @(*) begin
	__main___uart_tx_fifo_wrport_adr <= 4'd0;
	if (__main___uart_tx_fifo_replace) begin
		__main___uart_tx_fifo_wrport_adr <= (__main___uart_tx_fifo_produce - 1'd1);
	end else begin
		__main___uart_tx_fifo_wrport_adr <= __main___uart_tx_fifo_produce;
	end
end
assign __main___uart_tx_fifo_wrport_dat_w = __main___uart_tx_fifo_syncfifo_din;
assign __main___uart_tx_fifo_wrport_we = (__main___uart_tx_fifo_syncfifo_we & (__main___uart_tx_fifo_syncfifo_writable | __main___uart_tx_fifo_replace));
assign __main___uart_tx_fifo_do_read = (__main___uart_tx_fifo_syncfifo_readable & __main___uart_tx_fifo_syncfifo_re);
assign __main___uart_tx_fifo_rdport_adr = __main___uart_tx_fifo_consume;
assign __main___uart_tx_fifo_syncfifo_dout = __main___uart_tx_fifo_rdport_dat_r;
assign __main___uart_tx_fifo_rdport_re = __main___uart_tx_fifo_do_read;
assign __main___uart_tx_fifo_syncfifo_writable = (__main___uart_tx_fifo_level0 != 5'd16);
assign __main___uart_tx_fifo_syncfifo_readable = (__main___uart_tx_fifo_level0 != 1'd0);
assign __main___uart_rx_fifo_syncfifo_din = {__main___uart_rx_fifo_fifo_in_last, __main___uart_rx_fifo_fifo_in_first, __main___uart_rx_fifo_fifo_in_payload_data};
assign {__main___uart_rx_fifo_fifo_out_last, __main___uart_rx_fifo_fifo_out_first, __main___uart_rx_fifo_fifo_out_payload_data} = __main___uart_rx_fifo_syncfifo_dout;
assign __main___uart_rx_fifo_sink_ready = __main___uart_rx_fifo_syncfifo_writable;
assign __main___uart_rx_fifo_syncfifo_we = __main___uart_rx_fifo_sink_valid;
assign __main___uart_rx_fifo_fifo_in_first = __main___uart_rx_fifo_sink_first;
assign __main___uart_rx_fifo_fifo_in_last = __main___uart_rx_fifo_sink_last;
assign __main___uart_rx_fifo_fifo_in_payload_data = __main___uart_rx_fifo_sink_payload_data;
assign __main___uart_rx_fifo_source_valid = __main___uart_rx_fifo_readable;
assign __main___uart_rx_fifo_source_first = __main___uart_rx_fifo_fifo_out_first;
assign __main___uart_rx_fifo_source_last = __main___uart_rx_fifo_fifo_out_last;
assign __main___uart_rx_fifo_source_payload_data = __main___uart_rx_fifo_fifo_out_payload_data;
assign __main___uart_rx_fifo_re = __main___uart_rx_fifo_source_ready;
assign __main___uart_rx_fifo_syncfifo_re = (__main___uart_rx_fifo_syncfifo_readable & ((~__main___uart_rx_fifo_readable) | __main___uart_rx_fifo_re));
assign __main___uart_rx_fifo_level1 = (__main___uart_rx_fifo_level0 + __main___uart_rx_fifo_readable);
always @(*) begin
	__main___uart_rx_fifo_wrport_adr <= 4'd0;
	if (__main___uart_rx_fifo_replace) begin
		__main___uart_rx_fifo_wrport_adr <= (__main___uart_rx_fifo_produce - 1'd1);
	end else begin
		__main___uart_rx_fifo_wrport_adr <= __main___uart_rx_fifo_produce;
	end
end
assign __main___uart_rx_fifo_wrport_dat_w = __main___uart_rx_fifo_syncfifo_din;
assign __main___uart_rx_fifo_wrport_we = (__main___uart_rx_fifo_syncfifo_we & (__main___uart_rx_fifo_syncfifo_writable | __main___uart_rx_fifo_replace));
assign __main___uart_rx_fifo_do_read = (__main___uart_rx_fifo_syncfifo_readable & __main___uart_rx_fifo_syncfifo_re);
assign __main___uart_rx_fifo_rdport_adr = __main___uart_rx_fifo_consume;
assign __main___uart_rx_fifo_syncfifo_dout = __main___uart_rx_fifo_rdport_dat_r;
assign __main___uart_rx_fifo_rdport_re = __main___uart_rx_fifo_do_read;
assign __main___uart_rx_fifo_syncfifo_writable = (__main___uart_rx_fifo_level0 != 5'd16);
assign __main___uart_rx_fifo_syncfifo_readable = (__main___uart_rx_fifo_level0 != 1'd0);
assign __main___timer0_zero_trigger = (__main___timer0_value != 1'd0);
assign __main___timer0_eventmanager_status_w = __main___timer0_zero_status;
always @(*) begin
	__main___timer0_zero_clear <= 1'd0;
	if ((__main___timer0_eventmanager_pending_re & __main___timer0_eventmanager_pending_r)) begin
		__main___timer0_zero_clear <= 1'd1;
	end
end
assign __main___timer0_eventmanager_pending_w = __main___timer0_zero_pending;
assign __main___timer0_irq = (__main___timer0_eventmanager_pending_w & __main___timer0_eventmanager_storage);
assign __main___timer0_zero_status = __main___timer0_zero_trigger;
assign sys_clk = clk100;
assign por_clk = clk100;
assign sys_rst = __main___int_rst;
assign {user_led7, user_led6, user_led5, user_led4, user_led3, user_led2, user_led1, user_led0} = __main___storage;
assign __main___cero_trigger = builder_slice_proxy0[1];
assign __main___uno_trigger = builder_slice_proxy1[0];
assign __main___dos_trigger = builder_slice_proxy2[2];
assign __main___tres_trigger = builder_slice_proxy3[3];
assign __main___cuatro_trigger = builder_slice_proxy4[4];
assign __main___cinco_trigger = builder_slice_proxy5[5];
assign __main___seis_trigger = builder_slice_proxy6[6];
assign __main___siete_trigger = builder_slice_proxy7[7];
always @(*) begin
	__main___cero_clear <= 1'd0;
	if ((builder_pending_re & builder_pending_r[0])) begin
		__main___cero_clear <= 1'd1;
	end
end
always @(*) begin
	__main___uno_clear <= 1'd0;
	if ((builder_pending_re & builder_pending_r[1])) begin
		__main___uno_clear <= 1'd1;
	end
end
always @(*) begin
	__main___dos_clear <= 1'd0;
	if ((builder_pending_re & builder_pending_r[2])) begin
		__main___dos_clear <= 1'd1;
	end
end
always @(*) begin
	__main___tres_clear <= 1'd0;
	if ((builder_pending_re & builder_pending_r[3])) begin
		__main___tres_clear <= 1'd1;
	end
end
always @(*) begin
	__main___cuatro_clear <= 1'd0;
	if ((builder_pending_re & builder_pending_r[4])) begin
		__main___cuatro_clear <= 1'd1;
	end
end
always @(*) begin
	__main___cinco_clear <= 1'd0;
	if ((builder_pending_re & builder_pending_r[5])) begin
		__main___cinco_clear <= 1'd1;
	end
end
always @(*) begin
	__main___seis_clear <= 1'd0;
	if ((builder_pending_re & builder_pending_r[6])) begin
		__main___seis_clear <= 1'd1;
	end
end
always @(*) begin
	builder_status_w <= 8'd0;
	builder_status_w[0] <= __main___cero_status;
	builder_status_w[1] <= __main___uno_status;
	builder_status_w[2] <= __main___dos_status;
	builder_status_w[3] <= __main___tres_status;
	builder_status_w[4] <= __main___cuatro_status;
	builder_status_w[5] <= __main___cinco_status;
	builder_status_w[6] <= __main___seis_status;
	builder_status_w[7] <= __main___siete_status;
end
always @(*) begin
	__main___siete_clear <= 1'd0;
	if ((builder_pending_re & builder_pending_r[7])) begin
		__main___siete_clear <= 1'd1;
	end
end
always @(*) begin
	builder_pending_w <= 8'd0;
	builder_pending_w[0] <= __main___cero_pending;
	builder_pending_w[1] <= __main___uno_pending;
	builder_pending_w[2] <= __main___dos_pending;
	builder_pending_w[3] <= __main___tres_pending;
	builder_pending_w[4] <= __main___cuatro_pending;
	builder_pending_w[5] <= __main___cinco_pending;
	builder_pending_w[6] <= __main___seis_pending;
	builder_pending_w[7] <= __main___siete_pending;
end
assign __main___irq = ((((((((builder_pending_w[0] & builder_storage[0]) | (builder_pending_w[1] & builder_storage[1])) | (builder_pending_w[2] & builder_storage[2])) | (builder_pending_w[3] & builder_storage[3])) | (builder_pending_w[4] & builder_storage[4])) | (builder_pending_w[5] & builder_storage[5])) | (builder_pending_w[6] & builder_storage[6])) | (builder_pending_w[7] & builder_storage[7]));
assign __main___cero_status = __main___cero_trigger;
assign __main___uno_status = __main___uno_trigger;
assign __main___dos_status = __main___dos_trigger;
assign __main___tres_status = __main___tres_trigger;
assign __main___cuatro_status = __main___cuatro_trigger;
assign __main___cinco_status = __main___cinco_trigger;
assign __main___seis_status = __main___seis_trigger;
assign __main___siete_status = __main___siete_trigger;
assign builder_shared_adr = builder_array_muxed0;
assign builder_shared_dat_w = builder_array_muxed1;
assign builder_shared_sel = builder_array_muxed2;
assign builder_shared_cyc = builder_array_muxed3;
assign builder_shared_stb = builder_array_muxed4;
assign builder_shared_we = builder_array_muxed5;
assign builder_shared_cti = builder_array_muxed6;
assign builder_shared_bte = builder_array_muxed7;
assign __main___lm32_ibus_dat_r = builder_shared_dat_r;
assign __main___lm32_dbus_dat_r = builder_shared_dat_r;
assign __main___lm32_ibus_ack = (builder_shared_ack & (builder_grant == 1'd0));
assign __main___lm32_dbus_ack = (builder_shared_ack & (builder_grant == 1'd1));
assign __main___lm32_ibus_err = (builder_shared_err & (builder_grant == 1'd0));
assign __main___lm32_dbus_err = (builder_shared_err & (builder_grant == 1'd1));
assign builder_request = {__main___lm32_dbus_cyc, __main___lm32_ibus_cyc};
always @(*) begin
	builder_slave_sel <= 4'd0;
	builder_slave_sel[0] <= (builder_shared_adr[28:26] == 1'd0);
	builder_slave_sel[1] <= (builder_shared_adr[28:26] == 1'd1);
	builder_slave_sel[2] <= (builder_shared_adr[28:26] == 3'd4);
	builder_slave_sel[3] <= (builder_shared_adr[28:26] == 3'd6);
end
assign __main___rom_bus_adr = builder_shared_adr;
assign __main___rom_bus_dat_w = builder_shared_dat_w;
assign __main___rom_bus_sel = builder_shared_sel;
assign __main___rom_bus_stb = builder_shared_stb;
assign __main___rom_bus_we = builder_shared_we;
assign __main___rom_bus_cti = builder_shared_cti;
assign __main___rom_bus_bte = builder_shared_bte;
assign __main___sram_bus_adr = builder_shared_adr;
assign __main___sram_bus_dat_w = builder_shared_dat_w;
assign __main___sram_bus_sel = builder_shared_sel;
assign __main___sram_bus_stb = builder_shared_stb;
assign __main___sram_bus_we = builder_shared_we;
assign __main___sram_bus_cti = builder_shared_cti;
assign __main___sram_bus_bte = builder_shared_bte;
assign __main___main_ram_bus_adr = builder_shared_adr;
assign __main___main_ram_bus_dat_w = builder_shared_dat_w;
assign __main___main_ram_bus_sel = builder_shared_sel;
assign __main___main_ram_bus_stb = builder_shared_stb;
assign __main___main_ram_bus_we = builder_shared_we;
assign __main___main_ram_bus_cti = builder_shared_cti;
assign __main___main_ram_bus_bte = builder_shared_bte;
assign __main___bus_wishbone_adr = builder_shared_adr;
assign __main___bus_wishbone_dat_w = builder_shared_dat_w;
assign __main___bus_wishbone_sel = builder_shared_sel;
assign __main___bus_wishbone_stb = builder_shared_stb;
assign __main___bus_wishbone_we = builder_shared_we;
assign __main___bus_wishbone_cti = builder_shared_cti;
assign __main___bus_wishbone_bte = builder_shared_bte;
assign __main___rom_bus_cyc = (builder_shared_cyc & builder_slave_sel[0]);
assign __main___sram_bus_cyc = (builder_shared_cyc & builder_slave_sel[1]);
assign __main___main_ram_bus_cyc = (builder_shared_cyc & builder_slave_sel[2]);
assign __main___bus_wishbone_cyc = (builder_shared_cyc & builder_slave_sel[3]);
assign builder_shared_err = (((__main___rom_bus_err | __main___sram_bus_err) | __main___main_ram_bus_err) | __main___bus_wishbone_err);
assign builder_wait = ((builder_shared_stb & builder_shared_cyc) & (~builder_shared_ack));
always @(*) begin
	builder_error <= 1'd0;
	builder_shared_dat_r <= 32'd0;
	builder_shared_ack <= 1'd0;
	builder_shared_ack <= (((__main___rom_bus_ack | __main___sram_bus_ack) | __main___main_ram_bus_ack) | __main___bus_wishbone_ack);
	builder_shared_dat_r <= (((({32{builder_slave_sel_r[0]}} & __main___rom_bus_dat_r) | ({32{builder_slave_sel_r[1]}} & __main___sram_bus_dat_r)) | ({32{builder_slave_sel_r[2]}} & __main___main_ram_bus_dat_r)) | ({32{builder_slave_sel_r[3]}} & __main___bus_wishbone_dat_r));
	if (builder_done) begin
		builder_shared_dat_r <= 32'd4294967295;
		builder_shared_ack <= 1'd1;
		builder_error <= 1'd1;
	end
end
assign builder_done = (builder_count == 1'd0);
assign builder_csrbank0_sel = (builder_interface0_bank_bus_adr[13:9] == 4'd9);
assign builder_csrbank0_in_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_csrbank0_in_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[1:0] == 1'd0));
assign builder_status_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_status_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[1:0] == 1'd1));
assign builder_pending_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_pending_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[1:0] == 2'd2));
assign builder_csrbank0_ev_enable0_r = builder_interface0_bank_bus_dat_w[7:0];
assign builder_csrbank0_ev_enable0_re = ((builder_csrbank0_sel & builder_interface0_bank_bus_we) & (builder_interface0_bank_bus_adr[1:0] == 2'd3));
assign builder_csrbank0_in_w = __main___in_status[7:0];
assign builder_storage = builder_storage_full[7:0];
assign builder_csrbank0_ev_enable0_w = builder_storage_full[7:0];
assign builder_csrbank1_sel = (builder_interface1_bank_bus_adr[13:9] == 1'd0);
assign __main___ctrl_reset_reset_r = builder_interface1_bank_bus_dat_w[0];
assign __main___ctrl_reset_reset_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 1'd0));
assign builder_csrbank1_scratch3_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_scratch3_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 1'd1));
assign builder_csrbank1_scratch2_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_scratch2_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 2'd2));
assign builder_csrbank1_scratch1_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_scratch1_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 2'd3));
assign builder_csrbank1_scratch0_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_scratch0_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 3'd4));
assign builder_csrbank1_bus_errors3_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_bus_errors3_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 3'd5));
assign builder_csrbank1_bus_errors2_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_bus_errors2_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 3'd6));
assign builder_csrbank1_bus_errors1_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_bus_errors1_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 3'd7));
assign builder_csrbank1_bus_errors0_r = builder_interface1_bank_bus_dat_w[7:0];
assign builder_csrbank1_bus_errors0_re = ((builder_csrbank1_sel & builder_interface1_bank_bus_we) & (builder_interface1_bank_bus_adr[3:0] == 4'd8));
assign __main___ctrl_storage = __main___ctrl_storage_full[31:0];
assign builder_csrbank1_scratch3_w = __main___ctrl_storage_full[31:24];
assign builder_csrbank1_scratch2_w = __main___ctrl_storage_full[23:16];
assign builder_csrbank1_scratch1_w = __main___ctrl_storage_full[15:8];
assign builder_csrbank1_scratch0_w = __main___ctrl_storage_full[7:0];
assign builder_csrbank1_bus_errors3_w = __main___ctrl_bus_errors_status[31:24];
assign builder_csrbank1_bus_errors2_w = __main___ctrl_bus_errors_status[23:16];
assign builder_csrbank1_bus_errors1_w = __main___ctrl_bus_errors_status[15:8];
assign builder_csrbank1_bus_errors0_w = __main___ctrl_bus_errors_status[7:0];
assign builder_sel = (builder_sram_bus_adr[13:9] == 3'd4);
always @(*) begin
	builder_sram_bus_dat_r <= 8'd0;
	if (builder_sel_r) begin
		builder_sram_bus_dat_r <= builder_dat_r;
	end
end
assign builder_adr = builder_sram_bus_adr[5:0];
assign builder_csrbank2_sel = (builder_interface2_bank_bus_adr[13:9] == 4'd8);
assign builder_csrbank2_out0_r = builder_interface2_bank_bus_dat_w[7:0];
assign builder_csrbank2_out0_re = ((builder_csrbank2_sel & builder_interface2_bank_bus_we) & (builder_interface2_bank_bus_adr[0] == 1'd0));
assign __main___storage = __main___storage_full[7:0];
assign builder_csrbank2_out0_w = __main___storage_full[7:0];
assign builder_csrbank3_sel = (builder_interface3_bank_bus_adr[13:9] == 3'd5);
assign builder_csrbank3_load3_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_load3_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 1'd0));
assign builder_csrbank3_load2_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_load2_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 1'd1));
assign builder_csrbank3_load1_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_load1_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 2'd2));
assign builder_csrbank3_load0_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_load0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 2'd3));
assign builder_csrbank3_reload3_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_reload3_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 3'd4));
assign builder_csrbank3_reload2_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_reload2_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 3'd5));
assign builder_csrbank3_reload1_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_reload1_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 3'd6));
assign builder_csrbank3_reload0_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_reload0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 3'd7));
assign builder_csrbank3_en0_r = builder_interface3_bank_bus_dat_w[0];
assign builder_csrbank3_en0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd8));
assign __main___timer0_update_value_r = builder_interface3_bank_bus_dat_w[0];
assign __main___timer0_update_value_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd9));
assign builder_csrbank3_value3_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_value3_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd10));
assign builder_csrbank3_value2_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_value2_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd11));
assign builder_csrbank3_value1_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_value1_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd12));
assign builder_csrbank3_value0_r = builder_interface3_bank_bus_dat_w[7:0];
assign builder_csrbank3_value0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd13));
assign __main___timer0_eventmanager_status_r = builder_interface3_bank_bus_dat_w[0];
assign __main___timer0_eventmanager_status_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd14));
assign __main___timer0_eventmanager_pending_r = builder_interface3_bank_bus_dat_w[0];
assign __main___timer0_eventmanager_pending_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 4'd15));
assign builder_csrbank3_ev_enable0_r = builder_interface3_bank_bus_dat_w[0];
assign builder_csrbank3_ev_enable0_re = ((builder_csrbank3_sel & builder_interface3_bank_bus_we) & (builder_interface3_bank_bus_adr[4:0] == 5'd16));
assign __main___timer0_load_storage = __main___timer0_load_storage_full[31:0];
assign builder_csrbank3_load3_w = __main___timer0_load_storage_full[31:24];
assign builder_csrbank3_load2_w = __main___timer0_load_storage_full[23:16];
assign builder_csrbank3_load1_w = __main___timer0_load_storage_full[15:8];
assign builder_csrbank3_load0_w = __main___timer0_load_storage_full[7:0];
assign __main___timer0_reload_storage = __main___timer0_reload_storage_full[31:0];
assign builder_csrbank3_reload3_w = __main___timer0_reload_storage_full[31:24];
assign builder_csrbank3_reload2_w = __main___timer0_reload_storage_full[23:16];
assign builder_csrbank3_reload1_w = __main___timer0_reload_storage_full[15:8];
assign builder_csrbank3_reload0_w = __main___timer0_reload_storage_full[7:0];
assign __main___timer0_en_storage = __main___timer0_en_storage_full;
assign builder_csrbank3_en0_w = __main___timer0_en_storage_full;
assign builder_csrbank3_value3_w = __main___timer0_value_status[31:24];
assign builder_csrbank3_value2_w = __main___timer0_value_status[23:16];
assign builder_csrbank3_value1_w = __main___timer0_value_status[15:8];
assign builder_csrbank3_value0_w = __main___timer0_value_status[7:0];
assign __main___timer0_eventmanager_storage = __main___timer0_eventmanager_storage_full;
assign builder_csrbank3_ev_enable0_w = __main___timer0_eventmanager_storage_full;
assign builder_csrbank4_sel = (builder_interface4_bank_bus_adr[13:9] == 2'd3);
assign __main___uart_rxtx_r = builder_interface4_bank_bus_dat_w[7:0];
assign __main___uart_rxtx_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 1'd0));
assign builder_csrbank4_txfull_r = builder_interface4_bank_bus_dat_w[0];
assign builder_csrbank4_txfull_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 1'd1));
assign builder_csrbank4_rxempty_r = builder_interface4_bank_bus_dat_w[0];
assign builder_csrbank4_rxempty_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 2'd2));
assign __main___uart_eventmanager_status_r = builder_interface4_bank_bus_dat_w[1:0];
assign __main___uart_eventmanager_status_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 2'd3));
assign __main___uart_eventmanager_pending_r = builder_interface4_bank_bus_dat_w[1:0];
assign __main___uart_eventmanager_pending_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 3'd4));
assign builder_csrbank4_ev_enable0_r = builder_interface4_bank_bus_dat_w[1:0];
assign builder_csrbank4_ev_enable0_re = ((builder_csrbank4_sel & builder_interface4_bank_bus_we) & (builder_interface4_bank_bus_adr[2:0] == 3'd5));
assign builder_csrbank4_txfull_w = __main___uart_txfull_status;
assign builder_csrbank4_rxempty_w = __main___uart_rxempty_status;
assign __main___uart_eventmanager_storage = __main___uart_eventmanager_storage_full[1:0];
assign builder_csrbank4_ev_enable0_w = __main___uart_eventmanager_storage_full[1:0];
assign builder_csrbank5_sel = (builder_interface5_bank_bus_adr[13:9] == 2'd2);
assign builder_csrbank5_tuning_word3_r = builder_interface5_bank_bus_dat_w[7:0];
assign builder_csrbank5_tuning_word3_re = ((builder_csrbank5_sel & builder_interface5_bank_bus_we) & (builder_interface5_bank_bus_adr[1:0] == 1'd0));
assign builder_csrbank5_tuning_word2_r = builder_interface5_bank_bus_dat_w[7:0];
assign builder_csrbank5_tuning_word2_re = ((builder_csrbank5_sel & builder_interface5_bank_bus_we) & (builder_interface5_bank_bus_adr[1:0] == 1'd1));
assign builder_csrbank5_tuning_word1_r = builder_interface5_bank_bus_dat_w[7:0];
assign builder_csrbank5_tuning_word1_re = ((builder_csrbank5_sel & builder_interface5_bank_bus_we) & (builder_interface5_bank_bus_adr[1:0] == 2'd2));
assign builder_csrbank5_tuning_word0_r = builder_interface5_bank_bus_dat_w[7:0];
assign builder_csrbank5_tuning_word0_re = ((builder_csrbank5_sel & builder_interface5_bank_bus_we) & (builder_interface5_bank_bus_adr[1:0] == 2'd3));
assign __main___uart_phy_storage = __main___uart_phy_storage_full[31:0];
assign builder_csrbank5_tuning_word3_w = __main___uart_phy_storage_full[31:24];
assign builder_csrbank5_tuning_word2_w = __main___uart_phy_storage_full[23:16];
assign builder_csrbank5_tuning_word1_w = __main___uart_phy_storage_full[15:8];
assign builder_csrbank5_tuning_word0_w = __main___uart_phy_storage_full[7:0];
assign builder_interface0_bank_bus_adr = __main___interface_adr;
assign builder_interface1_bank_bus_adr = __main___interface_adr;
assign builder_interface2_bank_bus_adr = __main___interface_adr;
assign builder_interface3_bank_bus_adr = __main___interface_adr;
assign builder_interface4_bank_bus_adr = __main___interface_adr;
assign builder_interface5_bank_bus_adr = __main___interface_adr;
assign builder_sram_bus_adr = __main___interface_adr;
assign builder_interface0_bank_bus_we = __main___interface_we;
assign builder_interface1_bank_bus_we = __main___interface_we;
assign builder_interface2_bank_bus_we = __main___interface_we;
assign builder_interface3_bank_bus_we = __main___interface_we;
assign builder_interface4_bank_bus_we = __main___interface_we;
assign builder_interface5_bank_bus_we = __main___interface_we;
assign builder_sram_bus_we = __main___interface_we;
assign builder_interface0_bank_bus_dat_w = __main___interface_dat_w;
assign builder_interface1_bank_bus_dat_w = __main___interface_dat_w;
assign builder_interface2_bank_bus_dat_w = __main___interface_dat_w;
assign builder_interface3_bank_bus_dat_w = __main___interface_dat_w;
assign builder_interface4_bank_bus_dat_w = __main___interface_dat_w;
assign builder_interface5_bank_bus_dat_w = __main___interface_dat_w;
assign builder_sram_bus_dat_w = __main___interface_dat_w;
assign __main___interface_dat_r = ((((((builder_interface0_bank_bus_dat_r | builder_interface1_bank_bus_dat_r) | builder_interface2_bank_bus_dat_r) | builder_interface3_bank_bus_dat_r) | builder_interface4_bank_bus_dat_r) | builder_interface5_bank_bus_dat_r) | builder_sram_bus_dat_r);
assign builder_slice_proxy0 = {user_btn7, user_btn6, user_btn5, user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
assign builder_slice_proxy1 = {user_btn7, user_btn6, user_btn5, user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
assign builder_slice_proxy2 = {user_btn7, user_btn6, user_btn5, user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
assign builder_slice_proxy3 = {user_btn7, user_btn6, user_btn5, user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
assign builder_slice_proxy4 = {user_btn7, user_btn6, user_btn5, user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
assign builder_slice_proxy5 = {user_btn7, user_btn6, user_btn5, user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
assign builder_slice_proxy6 = {user_btn7, user_btn6, user_btn5, user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
assign builder_slice_proxy7 = {user_btn7, user_btn6, user_btn5, user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
always @(*) begin
	builder_array_muxed0 <= 30'd0;
	case (builder_grant)
		1'd0: begin
			builder_array_muxed0 <= __main___lm32_ibus_adr;
		end
		default: begin
			builder_array_muxed0 <= __main___lm32_dbus_adr;
		end
	endcase
end
always @(*) begin
	builder_array_muxed1 <= 32'd0;
	case (builder_grant)
		1'd0: begin
			builder_array_muxed1 <= __main___lm32_ibus_dat_w;
		end
		default: begin
			builder_array_muxed1 <= __main___lm32_dbus_dat_w;
		end
	endcase
end
always @(*) begin
	builder_array_muxed2 <= 4'd0;
	case (builder_grant)
		1'd0: begin
			builder_array_muxed2 <= __main___lm32_ibus_sel;
		end
		default: begin
			builder_array_muxed2 <= __main___lm32_dbus_sel;
		end
	endcase
end
always @(*) begin
	builder_array_muxed3 <= 1'd0;
	case (builder_grant)
		1'd0: begin
			builder_array_muxed3 <= __main___lm32_ibus_cyc;
		end
		default: begin
			builder_array_muxed3 <= __main___lm32_dbus_cyc;
		end
	endcase
end
always @(*) begin
	builder_array_muxed4 <= 1'd0;
	case (builder_grant)
		1'd0: begin
			builder_array_muxed4 <= __main___lm32_ibus_stb;
		end
		default: begin
			builder_array_muxed4 <= __main___lm32_dbus_stb;
		end
	endcase
end
always @(*) begin
	builder_array_muxed5 <= 1'd0;
	case (builder_grant)
		1'd0: begin
			builder_array_muxed5 <= __main___lm32_ibus_we;
		end
		default: begin
			builder_array_muxed5 <= __main___lm32_dbus_we;
		end
	endcase
end
always @(*) begin
	builder_array_muxed6 <= 3'd0;
	case (builder_grant)
		1'd0: begin
			builder_array_muxed6 <= __main___lm32_ibus_cti;
		end
		default: begin
			builder_array_muxed6 <= __main___lm32_dbus_cti;
		end
	endcase
end
always @(*) begin
	builder_array_muxed7 <= 2'd0;
	case (builder_grant)
		1'd0: begin
			builder_array_muxed7 <= __main___lm32_ibus_bte;
		end
		default: begin
			builder_array_muxed7 <= __main___lm32_dbus_bte;
		end
	endcase
end
assign __main___uart_phy_rx = builder_xilinxmultiregimpl0_regs1;
assign __main___in_status = builder_xilinxmultiregimpl1_regs1;
assign builder_xilinxmultiregimpl1 = {user_btn7, user_btn6, user_btn5, user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};

always @(posedge por_clk) begin
	__main___int_rst <= (~cpu_reset);
end

always @(posedge sys_clk) begin
	if ((__main___ctrl_bus_errors != 32'd4294967295)) begin
		if (__main___ctrl_bus_error) begin
			__main___ctrl_bus_errors <= (__main___ctrl_bus_errors + 1'd1);
		end
	end
	__main___rom_bus_ack <= 1'd0;
	if (((__main___rom_bus_cyc & __main___rom_bus_stb) & (~__main___rom_bus_ack))) begin
		__main___rom_bus_ack <= 1'd1;
	end
	__main___sram_bus_ack <= 1'd0;
	if (((__main___sram_bus_cyc & __main___sram_bus_stb) & (~__main___sram_bus_ack))) begin
		__main___sram_bus_ack <= 1'd1;
	end
	__main___main_ram_bus_ack <= 1'd0;
	if (((__main___main_ram_bus_cyc & __main___main_ram_bus_stb) & (~__main___main_ram_bus_ack))) begin
		__main___main_ram_bus_ack <= 1'd1;
	end
	__main___interface_we <= 1'd0;
	__main___interface_dat_w <= __main___bus_wishbone_dat_w;
	__main___interface_adr <= __main___bus_wishbone_adr;
	__main___bus_wishbone_dat_r <= __main___interface_dat_r;
	if ((__main___counter == 1'd1)) begin
		__main___interface_we <= __main___bus_wishbone_we;
	end
	if ((__main___counter == 2'd2)) begin
		__main___bus_wishbone_ack <= 1'd1;
	end
	if ((__main___counter == 2'd3)) begin
		__main___bus_wishbone_ack <= 1'd0;
	end
	if ((__main___counter != 1'd0)) begin
		__main___counter <= (__main___counter + 1'd1);
	end else begin
		if ((__main___bus_wishbone_cyc & __main___bus_wishbone_stb)) begin
			__main___counter <= 1'd1;
		end
	end
	__main___uart_phy_sink_ready <= 1'd0;
	if (((__main___uart_phy_sink_valid & (~__main___uart_phy_tx_busy)) & (~__main___uart_phy_sink_ready))) begin
		__main___uart_phy_tx_reg <= __main___uart_phy_sink_payload_data;
		__main___uart_phy_tx_bitcount <= 1'd0;
		__main___uart_phy_tx_busy <= 1'd1;
		serial_tx <= 1'd0;
	end else begin
		if ((__main___uart_phy_uart_clk_txen & __main___uart_phy_tx_busy)) begin
			__main___uart_phy_tx_bitcount <= (__main___uart_phy_tx_bitcount + 1'd1);
			if ((__main___uart_phy_tx_bitcount == 4'd8)) begin
				serial_tx <= 1'd1;
			end else begin
				if ((__main___uart_phy_tx_bitcount == 4'd9)) begin
					serial_tx <= 1'd1;
					__main___uart_phy_tx_busy <= 1'd0;
					__main___uart_phy_sink_ready <= 1'd1;
				end else begin
					serial_tx <= __main___uart_phy_tx_reg[0];
					__main___uart_phy_tx_reg <= {1'd0, __main___uart_phy_tx_reg[7:1]};
				end
			end
		end
	end
	if (__main___uart_phy_tx_busy) begin
		{__main___uart_phy_uart_clk_txen, __main___uart_phy_phase_accumulator_tx} <= (__main___uart_phy_phase_accumulator_tx + __main___uart_phy_storage);
	end else begin
		{__main___uart_phy_uart_clk_txen, __main___uart_phy_phase_accumulator_tx} <= 1'd0;
	end
	__main___uart_phy_source_valid <= 1'd0;
	__main___uart_phy_rx_r <= __main___uart_phy_rx;
	if ((~__main___uart_phy_rx_busy)) begin
		if (((~__main___uart_phy_rx) & __main___uart_phy_rx_r)) begin
			__main___uart_phy_rx_busy <= 1'd1;
			__main___uart_phy_rx_bitcount <= 1'd0;
		end
	end else begin
		if (__main___uart_phy_uart_clk_rxen) begin
			__main___uart_phy_rx_bitcount <= (__main___uart_phy_rx_bitcount + 1'd1);
			if ((__main___uart_phy_rx_bitcount == 1'd0)) begin
				if (__main___uart_phy_rx) begin
					__main___uart_phy_rx_busy <= 1'd0;
				end
			end else begin
				if ((__main___uart_phy_rx_bitcount == 4'd9)) begin
					__main___uart_phy_rx_busy <= 1'd0;
					if (__main___uart_phy_rx) begin
						__main___uart_phy_source_payload_data <= __main___uart_phy_rx_reg;
						__main___uart_phy_source_valid <= 1'd1;
					end
				end else begin
					__main___uart_phy_rx_reg <= {__main___uart_phy_rx, __main___uart_phy_rx_reg[7:1]};
				end
			end
		end
	end
	if (__main___uart_phy_rx_busy) begin
		{__main___uart_phy_uart_clk_rxen, __main___uart_phy_phase_accumulator_rx} <= (__main___uart_phy_phase_accumulator_rx + __main___uart_phy_storage);
	end else begin
		{__main___uart_phy_uart_clk_rxen, __main___uart_phy_phase_accumulator_rx} <= 32'd2147483648;
	end
	if (__main___uart_tx_clear) begin
		__main___uart_tx_pending <= 1'd0;
	end
	__main___uart_tx_old_trigger <= __main___uart_tx_trigger;
	if (((~__main___uart_tx_trigger) & __main___uart_tx_old_trigger)) begin
		__main___uart_tx_pending <= 1'd1;
	end
	if (__main___uart_rx_clear) begin
		__main___uart_rx_pending <= 1'd0;
	end
	__main___uart_rx_old_trigger <= __main___uart_rx_trigger;
	if (((~__main___uart_rx_trigger) & __main___uart_rx_old_trigger)) begin
		__main___uart_rx_pending <= 1'd1;
	end
	if (__main___uart_tx_fifo_syncfifo_re) begin
		__main___uart_tx_fifo_readable <= 1'd1;
	end else begin
		if (__main___uart_tx_fifo_re) begin
			__main___uart_tx_fifo_readable <= 1'd0;
		end
	end
	if (((__main___uart_tx_fifo_syncfifo_we & __main___uart_tx_fifo_syncfifo_writable) & (~__main___uart_tx_fifo_replace))) begin
		__main___uart_tx_fifo_produce <= (__main___uart_tx_fifo_produce + 1'd1);
	end
	if (__main___uart_tx_fifo_do_read) begin
		__main___uart_tx_fifo_consume <= (__main___uart_tx_fifo_consume + 1'd1);
	end
	if (((__main___uart_tx_fifo_syncfifo_we & __main___uart_tx_fifo_syncfifo_writable) & (~__main___uart_tx_fifo_replace))) begin
		if ((~__main___uart_tx_fifo_do_read)) begin
			__main___uart_tx_fifo_level0 <= (__main___uart_tx_fifo_level0 + 1'd1);
		end
	end else begin
		if (__main___uart_tx_fifo_do_read) begin
			__main___uart_tx_fifo_level0 <= (__main___uart_tx_fifo_level0 - 1'd1);
		end
	end
	if (__main___uart_rx_fifo_syncfifo_re) begin
		__main___uart_rx_fifo_readable <= 1'd1;
	end else begin
		if (__main___uart_rx_fifo_re) begin
			__main___uart_rx_fifo_readable <= 1'd0;
		end
	end
	if (((__main___uart_rx_fifo_syncfifo_we & __main___uart_rx_fifo_syncfifo_writable) & (~__main___uart_rx_fifo_replace))) begin
		__main___uart_rx_fifo_produce <= (__main___uart_rx_fifo_produce + 1'd1);
	end
	if (__main___uart_rx_fifo_do_read) begin
		__main___uart_rx_fifo_consume <= (__main___uart_rx_fifo_consume + 1'd1);
	end
	if (((__main___uart_rx_fifo_syncfifo_we & __main___uart_rx_fifo_syncfifo_writable) & (~__main___uart_rx_fifo_replace))) begin
		if ((~__main___uart_rx_fifo_do_read)) begin
			__main___uart_rx_fifo_level0 <= (__main___uart_rx_fifo_level0 + 1'd1);
		end
	end else begin
		if (__main___uart_rx_fifo_do_read) begin
			__main___uart_rx_fifo_level0 <= (__main___uart_rx_fifo_level0 - 1'd1);
		end
	end
	if (__main___uart_reset) begin
		__main___uart_tx_pending <= 1'd0;
		__main___uart_tx_old_trigger <= 1'd0;
		__main___uart_rx_pending <= 1'd0;
		__main___uart_rx_old_trigger <= 1'd0;
		__main___uart_tx_fifo_readable <= 1'd0;
		__main___uart_tx_fifo_level0 <= 5'd0;
		__main___uart_tx_fifo_produce <= 4'd0;
		__main___uart_tx_fifo_consume <= 4'd0;
		__main___uart_rx_fifo_readable <= 1'd0;
		__main___uart_rx_fifo_level0 <= 5'd0;
		__main___uart_rx_fifo_produce <= 4'd0;
		__main___uart_rx_fifo_consume <= 4'd0;
	end
	if (__main___timer0_en_storage) begin
		if ((__main___timer0_value == 1'd0)) begin
			__main___timer0_value <= __main___timer0_reload_storage;
		end else begin
			__main___timer0_value <= (__main___timer0_value - 1'd1);
		end
	end else begin
		__main___timer0_value <= __main___timer0_load_storage;
	end
	if (__main___timer0_update_value_re) begin
		__main___timer0_value_status <= __main___timer0_value;
	end
	if (__main___timer0_zero_clear) begin
		__main___timer0_zero_pending <= 1'd0;
	end
	__main___timer0_zero_old_trigger <= __main___timer0_zero_trigger;
	if (((~__main___timer0_zero_trigger) & __main___timer0_zero_old_trigger)) begin
		__main___timer0_zero_pending <= 1'd1;
	end
	if (__main___cero_clear) begin
		__main___cero_pending <= 1'd0;
	end
	__main___cero_old_trigger <= __main___cero_trigger;
	if (((~__main___cero_trigger) & __main___cero_old_trigger)) begin
		__main___cero_pending <= 1'd1;
	end
	if (__main___uno_clear) begin
		__main___uno_pending <= 1'd0;
	end
	__main___uno_old_trigger <= __main___uno_trigger;
	if (((~__main___uno_trigger) & __main___uno_old_trigger)) begin
		__main___uno_pending <= 1'd1;
	end
	if (__main___dos_clear) begin
		__main___dos_pending <= 1'd0;
	end
	__main___dos_old_trigger <= __main___dos_trigger;
	if (((~__main___dos_trigger) & __main___dos_old_trigger)) begin
		__main___dos_pending <= 1'd1;
	end
	if (__main___tres_clear) begin
		__main___tres_pending <= 1'd0;
	end
	__main___tres_old_trigger <= __main___tres_trigger;
	if (((~__main___tres_trigger) & __main___tres_old_trigger)) begin
		__main___tres_pending <= 1'd1;
	end
	if (__main___cuatro_clear) begin
		__main___cuatro_pending <= 1'd0;
	end
	__main___cuatro_old_trigger <= __main___cuatro_trigger;
	if (((~__main___cuatro_trigger) & __main___cuatro_old_trigger)) begin
		__main___cuatro_pending <= 1'd1;
	end
	if (__main___cinco_clear) begin
		__main___cinco_pending <= 1'd0;
	end
	__main___cinco_old_trigger <= __main___cinco_trigger;
	if (((~__main___cinco_trigger) & __main___cinco_old_trigger)) begin
		__main___cinco_pending <= 1'd1;
	end
	if (__main___seis_clear) begin
		__main___seis_pending <= 1'd0;
	end
	__main___seis_old_trigger <= __main___seis_trigger;
	if (((~__main___seis_trigger) & __main___seis_old_trigger)) begin
		__main___seis_pending <= 1'd1;
	end
	if (__main___siete_clear) begin
		__main___siete_pending <= 1'd0;
	end
	__main___siete_old_trigger <= __main___siete_trigger;
	if (((~__main___siete_trigger) & __main___siete_old_trigger)) begin
		__main___siete_pending <= 1'd1;
	end
	case (builder_grant)
		1'd0: begin
			if ((~builder_request[0])) begin
				if (builder_request[1]) begin
					builder_grant <= 1'd1;
				end
			end
		end
		1'd1: begin
			if ((~builder_request[1])) begin
				if (builder_request[0]) begin
					builder_grant <= 1'd0;
				end
			end
		end
	endcase
	builder_slave_sel_r <= builder_slave_sel;
	if (builder_wait) begin
		if ((~builder_done)) begin
			builder_count <= (builder_count - 1'd1);
		end
	end else begin
		builder_count <= 20'd1000000;
	end
	builder_interface0_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank0_sel) begin
		case (builder_interface0_bank_bus_adr[1:0])
			1'd0: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_in_w;
			end
			1'd1: begin
				builder_interface0_bank_bus_dat_r <= builder_status_w;
			end
			2'd2: begin
				builder_interface0_bank_bus_dat_r <= builder_pending_w;
			end
			2'd3: begin
				builder_interface0_bank_bus_dat_r <= builder_csrbank0_ev_enable0_w;
			end
		endcase
	end
	if (builder_csrbank0_ev_enable0_re) begin
		builder_storage_full[7:0] <= builder_csrbank0_ev_enable0_r;
	end
	builder_re <= builder_csrbank0_ev_enable0_re;
	builder_interface1_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank1_sel) begin
		case (builder_interface1_bank_bus_adr[3:0])
			1'd0: begin
				builder_interface1_bank_bus_dat_r <= __main___ctrl_reset_reset_w;
			end
			1'd1: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_scratch3_w;
			end
			2'd2: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_scratch2_w;
			end
			2'd3: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_scratch1_w;
			end
			3'd4: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_scratch0_w;
			end
			3'd5: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_bus_errors3_w;
			end
			3'd6: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_bus_errors2_w;
			end
			3'd7: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_bus_errors1_w;
			end
			4'd8: begin
				builder_interface1_bank_bus_dat_r <= builder_csrbank1_bus_errors0_w;
			end
		endcase
	end
	if (builder_csrbank1_scratch3_re) begin
		__main___ctrl_storage_full[31:24] <= builder_csrbank1_scratch3_r;
	end
	if (builder_csrbank1_scratch2_re) begin
		__main___ctrl_storage_full[23:16] <= builder_csrbank1_scratch2_r;
	end
	if (builder_csrbank1_scratch1_re) begin
		__main___ctrl_storage_full[15:8] <= builder_csrbank1_scratch1_r;
	end
	if (builder_csrbank1_scratch0_re) begin
		__main___ctrl_storage_full[7:0] <= builder_csrbank1_scratch0_r;
	end
	__main___ctrl_re <= builder_csrbank1_scratch0_re;
	builder_sel_r <= builder_sel;
	builder_interface2_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank2_sel) begin
		case (builder_interface2_bank_bus_adr[0])
			1'd0: begin
				builder_interface2_bank_bus_dat_r <= builder_csrbank2_out0_w;
			end
		endcase
	end
	if (builder_csrbank2_out0_re) begin
		__main___storage_full[7:0] <= builder_csrbank2_out0_r;
	end
	__main___re <= builder_csrbank2_out0_re;
	builder_interface3_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank3_sel) begin
		case (builder_interface3_bank_bus_adr[4:0])
			1'd0: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_load3_w;
			end
			1'd1: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_load2_w;
			end
			2'd2: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_load1_w;
			end
			2'd3: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_load0_w;
			end
			3'd4: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_reload3_w;
			end
			3'd5: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_reload2_w;
			end
			3'd6: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_reload1_w;
			end
			3'd7: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_reload0_w;
			end
			4'd8: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_en0_w;
			end
			4'd9: begin
				builder_interface3_bank_bus_dat_r <= __main___timer0_update_value_w;
			end
			4'd10: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_value3_w;
			end
			4'd11: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_value2_w;
			end
			4'd12: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_value1_w;
			end
			4'd13: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_value0_w;
			end
			4'd14: begin
				builder_interface3_bank_bus_dat_r <= __main___timer0_eventmanager_status_w;
			end
			4'd15: begin
				builder_interface3_bank_bus_dat_r <= __main___timer0_eventmanager_pending_w;
			end
			5'd16: begin
				builder_interface3_bank_bus_dat_r <= builder_csrbank3_ev_enable0_w;
			end
		endcase
	end
	if (builder_csrbank3_load3_re) begin
		__main___timer0_load_storage_full[31:24] <= builder_csrbank3_load3_r;
	end
	if (builder_csrbank3_load2_re) begin
		__main___timer0_load_storage_full[23:16] <= builder_csrbank3_load2_r;
	end
	if (builder_csrbank3_load1_re) begin
		__main___timer0_load_storage_full[15:8] <= builder_csrbank3_load1_r;
	end
	if (builder_csrbank3_load0_re) begin
		__main___timer0_load_storage_full[7:0] <= builder_csrbank3_load0_r;
	end
	__main___timer0_load_re <= builder_csrbank3_load0_re;
	if (builder_csrbank3_reload3_re) begin
		__main___timer0_reload_storage_full[31:24] <= builder_csrbank3_reload3_r;
	end
	if (builder_csrbank3_reload2_re) begin
		__main___timer0_reload_storage_full[23:16] <= builder_csrbank3_reload2_r;
	end
	if (builder_csrbank3_reload1_re) begin
		__main___timer0_reload_storage_full[15:8] <= builder_csrbank3_reload1_r;
	end
	if (builder_csrbank3_reload0_re) begin
		__main___timer0_reload_storage_full[7:0] <= builder_csrbank3_reload0_r;
	end
	__main___timer0_reload_re <= builder_csrbank3_reload0_re;
	if (builder_csrbank3_en0_re) begin
		__main___timer0_en_storage_full <= builder_csrbank3_en0_r;
	end
	__main___timer0_en_re <= builder_csrbank3_en0_re;
	if (builder_csrbank3_ev_enable0_re) begin
		__main___timer0_eventmanager_storage_full <= builder_csrbank3_ev_enable0_r;
	end
	__main___timer0_eventmanager_re <= builder_csrbank3_ev_enable0_re;
	builder_interface4_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank4_sel) begin
		case (builder_interface4_bank_bus_adr[2:0])
			1'd0: begin
				builder_interface4_bank_bus_dat_r <= __main___uart_rxtx_w;
			end
			1'd1: begin
				builder_interface4_bank_bus_dat_r <= builder_csrbank4_txfull_w;
			end
			2'd2: begin
				builder_interface4_bank_bus_dat_r <= builder_csrbank4_rxempty_w;
			end
			2'd3: begin
				builder_interface4_bank_bus_dat_r <= __main___uart_eventmanager_status_w;
			end
			3'd4: begin
				builder_interface4_bank_bus_dat_r <= __main___uart_eventmanager_pending_w;
			end
			3'd5: begin
				builder_interface4_bank_bus_dat_r <= builder_csrbank4_ev_enable0_w;
			end
		endcase
	end
	if (builder_csrbank4_ev_enable0_re) begin
		__main___uart_eventmanager_storage_full[1:0] <= builder_csrbank4_ev_enable0_r;
	end
	__main___uart_eventmanager_re <= builder_csrbank4_ev_enable0_re;
	builder_interface5_bank_bus_dat_r <= 1'd0;
	if (builder_csrbank5_sel) begin
		case (builder_interface5_bank_bus_adr[1:0])
			1'd0: begin
				builder_interface5_bank_bus_dat_r <= builder_csrbank5_tuning_word3_w;
			end
			1'd1: begin
				builder_interface5_bank_bus_dat_r <= builder_csrbank5_tuning_word2_w;
			end
			2'd2: begin
				builder_interface5_bank_bus_dat_r <= builder_csrbank5_tuning_word1_w;
			end
			2'd3: begin
				builder_interface5_bank_bus_dat_r <= builder_csrbank5_tuning_word0_w;
			end
		endcase
	end
	if (builder_csrbank5_tuning_word3_re) begin
		__main___uart_phy_storage_full[31:24] <= builder_csrbank5_tuning_word3_r;
	end
	if (builder_csrbank5_tuning_word2_re) begin
		__main___uart_phy_storage_full[23:16] <= builder_csrbank5_tuning_word2_r;
	end
	if (builder_csrbank5_tuning_word1_re) begin
		__main___uart_phy_storage_full[15:8] <= builder_csrbank5_tuning_word1_r;
	end
	if (builder_csrbank5_tuning_word0_re) begin
		__main___uart_phy_storage_full[7:0] <= builder_csrbank5_tuning_word0_r;
	end
	__main___uart_phy_re <= builder_csrbank5_tuning_word0_re;
	if (sys_rst) begin
		__main___ctrl_storage_full <= 32'd305419896;
		__main___ctrl_re <= 1'd0;
		__main___ctrl_bus_errors <= 32'd0;
		__main___rom_bus_ack <= 1'd0;
		__main___sram_bus_ack <= 1'd0;
		__main___main_ram_bus_ack <= 1'd0;
		__main___interface_adr <= 14'd0;
		__main___interface_we <= 1'd0;
		__main___interface_dat_w <= 8'd0;
		__main___bus_wishbone_dat_r <= 32'd0;
		__main___bus_wishbone_ack <= 1'd0;
		__main___counter <= 2'd0;
		serial_tx <= 1'd1;
		__main___uart_phy_storage_full <= 32'd4947802;
		__main___uart_phy_re <= 1'd0;
		__main___uart_phy_sink_ready <= 1'd0;
		__main___uart_phy_uart_clk_txen <= 1'd0;
		__main___uart_phy_phase_accumulator_tx <= 32'd0;
		__main___uart_phy_tx_reg <= 8'd0;
		__main___uart_phy_tx_bitcount <= 4'd0;
		__main___uart_phy_tx_busy <= 1'd0;
		__main___uart_phy_source_valid <= 1'd0;
		__main___uart_phy_source_payload_data <= 8'd0;
		__main___uart_phy_uart_clk_rxen <= 1'd0;
		__main___uart_phy_phase_accumulator_rx <= 32'd0;
		__main___uart_phy_rx_r <= 1'd0;
		__main___uart_phy_rx_reg <= 8'd0;
		__main___uart_phy_rx_bitcount <= 4'd0;
		__main___uart_phy_rx_busy <= 1'd0;
		__main___uart_tx_pending <= 1'd0;
		__main___uart_tx_old_trigger <= 1'd0;
		__main___uart_rx_pending <= 1'd0;
		__main___uart_rx_old_trigger <= 1'd0;
		__main___uart_eventmanager_storage_full <= 2'd0;
		__main___uart_eventmanager_re <= 1'd0;
		__main___uart_tx_fifo_readable <= 1'd0;
		__main___uart_tx_fifo_level0 <= 5'd0;
		__main___uart_tx_fifo_produce <= 4'd0;
		__main___uart_tx_fifo_consume <= 4'd0;
		__main___uart_rx_fifo_readable <= 1'd0;
		__main___uart_rx_fifo_level0 <= 5'd0;
		__main___uart_rx_fifo_produce <= 4'd0;
		__main___uart_rx_fifo_consume <= 4'd0;
		__main___timer0_load_storage_full <= 32'd0;
		__main___timer0_load_re <= 1'd0;
		__main___timer0_reload_storage_full <= 32'd0;
		__main___timer0_reload_re <= 1'd0;
		__main___timer0_en_storage_full <= 1'd0;
		__main___timer0_en_re <= 1'd0;
		__main___timer0_value_status <= 32'd0;
		__main___timer0_zero_pending <= 1'd0;
		__main___timer0_zero_old_trigger <= 1'd0;
		__main___timer0_eventmanager_storage_full <= 1'd0;
		__main___timer0_eventmanager_re <= 1'd0;
		__main___timer0_value <= 32'd0;
		__main___storage_full <= 8'd0;
		__main___re <= 1'd0;
		__main___cero_pending <= 1'd0;
		__main___cero_old_trigger <= 1'd0;
		__main___uno_pending <= 1'd0;
		__main___uno_old_trigger <= 1'd0;
		__main___dos_pending <= 1'd0;
		__main___dos_old_trigger <= 1'd0;
		__main___tres_pending <= 1'd0;
		__main___tres_old_trigger <= 1'd0;
		__main___cuatro_pending <= 1'd0;
		__main___cuatro_old_trigger <= 1'd0;
		__main___cinco_pending <= 1'd0;
		__main___cinco_old_trigger <= 1'd0;
		__main___seis_pending <= 1'd0;
		__main___seis_old_trigger <= 1'd0;
		__main___siete_pending <= 1'd0;
		__main___siete_old_trigger <= 1'd0;
		builder_storage_full <= 8'd0;
		builder_re <= 1'd0;
		builder_grant <= 1'd0;
		builder_slave_sel_r <= 4'd0;
		builder_count <= 20'd1000000;
		builder_interface0_bank_bus_dat_r <= 8'd0;
		builder_interface1_bank_bus_dat_r <= 8'd0;
		builder_sel_r <= 1'd0;
		builder_interface2_bank_bus_dat_r <= 8'd0;
		builder_interface3_bank_bus_dat_r <= 8'd0;
		builder_interface4_bank_bus_dat_r <= 8'd0;
		builder_interface5_bank_bus_dat_r <= 8'd0;
	end
	builder_xilinxmultiregimpl0_regs0 <= serial_rx;
	builder_xilinxmultiregimpl0_regs1 <= builder_xilinxmultiregimpl0_regs0;
	builder_xilinxmultiregimpl1_regs0 <= {user_btn7, user_btn6, user_btn5, user_btn4, user_btn3, user_btn2, user_btn1, user_btn0};
	builder_xilinxmultiregimpl1_regs1 <= builder_xilinxmultiregimpl1_regs0;
end

lm32_cpu #(
	.eba_reset(32'h00000000)
) lm32_cpu (
	.D_ACK_I(__main___lm32_dbus_ack),
	.D_DAT_I(__main___lm32_dbus_dat_r),
	.D_ERR_I(__main___lm32_dbus_err),
	.D_RTY_I(1'd0),
	.I_ACK_I(__main___lm32_ibus_ack),
	.I_DAT_I(__main___lm32_ibus_dat_r),
	.I_ERR_I(__main___lm32_ibus_err),
	.I_RTY_I(1'd0),
	.clk_i(sys_clk),
	.interrupt(__main___lm32_interrupt),
	.rst_i((sys_rst | __main___lm32_reset)),
	.D_ADR_O(__main___lm32_d_adr_o),
	.D_BTE_O(__main___lm32_dbus_bte),
	.D_CTI_O(__main___lm32_dbus_cti),
	.D_CYC_O(__main___lm32_dbus_cyc),
	.D_DAT_O(__main___lm32_dbus_dat_w),
	.D_SEL_O(__main___lm32_dbus_sel),
	.D_STB_O(__main___lm32_dbus_stb),
	.D_WE_O(__main___lm32_dbus_we),
	.I_ADR_O(__main___lm32_i_adr_o),
	.I_BTE_O(__main___lm32_ibus_bte),
	.I_CTI_O(__main___lm32_ibus_cti),
	.I_CYC_O(__main___lm32_ibus_cyc),
	.I_DAT_O(__main___lm32_ibus_dat_w),
	.I_SEL_O(__main___lm32_ibus_sel),
	.I_STB_O(__main___lm32_ibus_stb),
	.I_WE_O(__main___lm32_ibus_we)
);

reg [31:0] mem[0:8191];
reg [12:0] memadr;
always @(posedge sys_clk) begin
	memadr <= __main___rom_adr;
end

assign __main___rom_dat_r = mem[memadr];

initial begin
	$readmemh("mem.init", mem);
end

reg [31:0] mem_1[0:1023];
reg [9:0] memadr_1;
always @(posedge sys_clk) begin
	if (__main___sram_we[0])
		mem_1[__main___sram_adr][7:0] <= __main___sram_dat_w[7:0];
	if (__main___sram_we[1])
		mem_1[__main___sram_adr][15:8] <= __main___sram_dat_w[15:8];
	if (__main___sram_we[2])
		mem_1[__main___sram_adr][23:16] <= __main___sram_dat_w[23:16];
	if (__main___sram_we[3])
		mem_1[__main___sram_adr][31:24] <= __main___sram_dat_w[31:24];
	memadr_1 <= __main___sram_adr;
end

assign __main___sram_dat_r = mem_1[memadr_1];

reg [31:0] mem_2[0:4095];
reg [11:0] memadr_2;
always @(posedge sys_clk) begin
	if (__main___main_ram_we[0])
		mem_2[__main___main_ram_adr][7:0] <= __main___main_ram_dat_w[7:0];
	if (__main___main_ram_we[1])
		mem_2[__main___main_ram_adr][15:8] <= __main___main_ram_dat_w[15:8];
	if (__main___main_ram_we[2])
		mem_2[__main___main_ram_adr][23:16] <= __main___main_ram_dat_w[23:16];
	if (__main___main_ram_we[3])
		mem_2[__main___main_ram_adr][31:24] <= __main___main_ram_dat_w[31:24];
	memadr_2 <= __main___main_ram_adr;
end

assign __main___main_ram_dat_r = mem_2[memadr_2];

initial begin
	$readmemh("mem_2.init", mem_2);
end

reg [9:0] storage[0:15];
reg [9:0] memdat;
reg [9:0] memdat_1;
always @(posedge sys_clk) begin
	if (__main___uart_tx_fifo_wrport_we)
		storage[__main___uart_tx_fifo_wrport_adr] <= __main___uart_tx_fifo_wrport_dat_w;
	memdat <= storage[__main___uart_tx_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
	if (__main___uart_tx_fifo_rdport_re)
		memdat_1 <= storage[__main___uart_tx_fifo_rdport_adr];
end

assign __main___uart_tx_fifo_wrport_dat_r = memdat;
assign __main___uart_tx_fifo_rdport_dat_r = memdat_1;

reg [9:0] storage_1[0:15];
reg [9:0] memdat_2;
reg [9:0] memdat_3;
always @(posedge sys_clk) begin
	if (__main___uart_rx_fifo_wrport_we)
		storage_1[__main___uart_rx_fifo_wrport_adr] <= __main___uart_rx_fifo_wrport_dat_w;
	memdat_2 <= storage_1[__main___uart_rx_fifo_wrport_adr];
end

always @(posedge sys_clk) begin
	if (__main___uart_rx_fifo_rdport_re)
		memdat_3 <= storage_1[__main___uart_rx_fifo_rdport_adr];
end

assign __main___uart_rx_fifo_wrport_dat_r = memdat_2;
assign __main___uart_rx_fifo_rdport_dat_r = memdat_3;

reg [7:0] mem_3[0:32];
reg [5:0] memadr_3;
always @(posedge sys_clk) begin
	memadr_3 <= builder_adr;
end

assign builder_dat_r = mem_3[memadr_3];

initial begin
	$readmemh("mem_3.init", mem_3);
end

endmodule
