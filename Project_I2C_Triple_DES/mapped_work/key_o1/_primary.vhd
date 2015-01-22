library verilog;
use verilog.vl_types.all;
entity key_o1 is
    port(
        key_in          : in     vl_logic_vector(63 downto 0);
        enable          : in     vl_logic;
        key_out         : out    vl_logic_vector(63 downto 0)
    );
end key_o1;
