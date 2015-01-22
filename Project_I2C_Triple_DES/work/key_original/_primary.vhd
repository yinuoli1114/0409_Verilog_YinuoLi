library verilog;
use verilog.vl_types.all;
entity key_original is
    port(
        k_o             : out    vl_logic_vector(0 to 63)
    );
end key_original;
