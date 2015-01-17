library verilog;
use verilog.vl_types.all;
entity moore is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        i               : in     vl_logic;
        o               : out    vl_logic
    );
end moore;
