library verilog;
use verilog.vl_types.all;
entity decode is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        scl             : in     vl_logic;
        sda_in          : in     vl_logic;
        starting_byte   : in     vl_logic_vector(7 downto 0);
        rw_mode         : out    vl_logic;
        address_match   : out    vl_logic;
        stop_found      : out    vl_logic;
        start_found     : out    vl_logic
    );
end decode;
