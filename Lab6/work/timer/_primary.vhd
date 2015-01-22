library verilog;
use verilog.vl_types.all;
entity timer is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        rising_edge_found: in     vl_logic;
        falling_edge_found: in     vl_logic;
        stop_found      : in     vl_logic;
        start_found     : in     vl_logic;
        byte_received   : out    vl_logic;
        ack_prep        : out    vl_logic;
        check_ack       : out    vl_logic;
        ack_done        : out    vl_logic
    );
end timer;
