library verilog;
use verilog.vl_types.all;
entity key_permutation1_2 is
    port(
        k_o             : in     vl_logic_vector(63 downto 0);
        kout            : out    vl_logic_vector(55 downto 0)
    );
end key_permutation1_2;
