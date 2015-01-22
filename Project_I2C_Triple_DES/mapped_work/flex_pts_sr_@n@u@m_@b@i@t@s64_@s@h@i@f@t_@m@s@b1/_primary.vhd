library verilog;
use verilog.vl_types.all;
entity flex_pts_sr_NUM_BITS64_SHIFT_MSB1 is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        shift_enable    : in     vl_logic;
        load_enable     : in     vl_logic;
        parallel_in     : in     vl_logic_vector(63 downto 0);
        serial_out      : out    vl_logic
    );
end flex_pts_sr_NUM_BITS64_SHIFT_MSB1;
