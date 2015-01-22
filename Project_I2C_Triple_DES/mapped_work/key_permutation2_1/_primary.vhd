library verilog;
use verilog.vl_types.all;
entity key_permutation2_1 is
    port(
        kin             : in     vl_logic_vector(55 downto 0);
        kout            : out    vl_logic_vector(47 downto 0)
    );
end key_permutation2_1;
