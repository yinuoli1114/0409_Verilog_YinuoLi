library verilog;
use verilog.vl_types.all;
entity flex_stp_sr_NUM_BITS9_SHIFT_MSB0 is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        shift_enable    : in     vl_logic;
        serial_in       : in     vl_logic;
        parallel_out    : out    vl_logic_vector(8 downto 0)
    );
end flex_stp_sr_NUM_BITS9_SHIFT_MSB0;
