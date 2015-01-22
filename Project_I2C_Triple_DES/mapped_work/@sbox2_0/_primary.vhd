library verilog;
use verilog.vl_types.all;
entity Sbox2_0 is
    port(
        data_in         : in     vl_logic_vector(5 downto 0);
        data_out        : out    vl_logic_vector(3 downto 0)
    );
end Sbox2_0;
