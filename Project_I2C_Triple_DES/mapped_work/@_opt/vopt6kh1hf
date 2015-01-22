library verilog;
use verilog.vl_types.all;
entity i2c_controller is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        stop_found      : in     vl_logic;
        start_found     : in     vl_logic;
        byte_received   : in     vl_logic;
        ack_prep        : in     vl_logic;
        check_ack       : in     vl_logic;
        ack_done        : in     vl_logic;
        rw_mode         : in     vl_logic;
        address_match   : in     vl_logic;
        sda_in          : in     vl_logic;
        data_ready      : in     vl_logic;
        rx_enable       : out    vl_logic;
        tx_enable       : out    vl_logic;
        read_enable     : out    vl_logic;
        write_enable    : out    vl_logic;
        sda_mode        : out    vl_logic_vector(1 downto 0);
        load_data       : out    vl_logic;
        i2c_rw          : out    vl_logic
    );
end i2c_controller;
