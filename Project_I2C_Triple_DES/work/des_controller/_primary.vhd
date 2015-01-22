library verilog;
use verilog.vl_types.all;
entity des_controller is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        data_in         : in     vl_logic_vector(63 downto 0);
        round_cnt       : in     vl_logic;
        data_ready      : in     vl_logic;
        io_select       : out    vl_logic_vector(1 downto 0);
        clear_data      : out    vl_logic;
        permutation_enable: out    vl_logic;
        data_right      : out    vl_logic_vector(31 downto 0);
        data_left       : out    vl_logic_vector(31 downto 0);
        next_data       : out    vl_logic;
        round_start     : out    vl_logic
    );
end des_controller;
