library verilog;
use verilog.vl_types.all;
entity key_wrapper is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        clear           : in     vl_logic;
        done            : in     vl_logic;
        ed_sel          : in     vl_logic;
        kout            : out    vl_logic_vector(47 downto 0);
        rollover_flag   : out    vl_logic
    );
end key_wrapper;
