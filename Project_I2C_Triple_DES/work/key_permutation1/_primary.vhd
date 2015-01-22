library verilog;
use verilog.vl_types.all;
entity key_permutation1 is
    port(
        k_o             : in     vl_logic_vector(0 to 63);
        kout            : out    vl_logic_vector(0 to 55)
    );
end key_permutation1;
