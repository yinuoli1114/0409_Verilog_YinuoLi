library verilog;
use verilog.vl_types.all;
entity sram is
    port(
        read_enable     : in     vl_logic;
        write_enable    : in     vl_logic;
        address         : in     vl_logic_vector(15 downto 0);
        write_data      : in     vl_logic_vector(7 downto 0);
        read_data       : out    vl_logic_vector(7 downto 0)
    );
end sram;
