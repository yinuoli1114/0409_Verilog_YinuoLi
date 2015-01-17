library verilog;
use verilog.vl_types.all;
entity counter is
    port(
        clk             : in     vl_logic;
        n_reset         : in     vl_logic;
        cnt_up          : in     vl_logic;
        one_k_samples   : out    vl_logic
    );
end counter;
