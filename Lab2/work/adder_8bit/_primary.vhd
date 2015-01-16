library verilog;
use verilog.vl_types.all;
entity adder_8bit is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        carry_in        : in     vl_logic;
        sum             : out    vl_logic_vector(7 downto 0);
        overflow        : out    vl_logic
    );
end adder_8bit;
