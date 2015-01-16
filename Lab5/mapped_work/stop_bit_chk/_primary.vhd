library verilog;
use verilog.vl_types.all;
entity stop_bit_chk is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        sbc_clear       : in     vl_logic;
        sbc_enable      : in     vl_logic;
        stop_bit        : in     vl_logic;
        framing_error   : out    vl_logic
    );
end stop_bit_chk;
