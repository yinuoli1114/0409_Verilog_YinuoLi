library verilog;
use verilog.vl_types.all;
entity des_controller_0 is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        data_ready      : in     vl_logic;
        rw_mode         : in     vl_logic;
        io_select       : out    vl_logic_vector(1 downto 0);
        next_data       : out    vl_logic;
        round_number    : out    vl_logic_vector(4 downto 0)
    );
end des_controller_0;
