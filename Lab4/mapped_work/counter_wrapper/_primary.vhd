library verilog;
use verilog.vl_types.all;
entity counter_wrapper is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        clear           : in     vl_logic;
        count_enable    : in     vl_logic;
        rollover_val    : in     vl_logic_vector(3 downto 0);
        count_out       : out    vl_logic_vector(3 downto 0);
        rollover_flag   : out    vl_logic
    );
end counter_wrapper;
