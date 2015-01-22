library verilog;
use verilog.vl_types.all;
entity permutation_1 is
    port(
        data_in         : in     vl_logic_vector(31 downto 0);
        data_left       : in     vl_logic_vector(31 downto 0);
        data_right      : in     vl_logic_vector(31 downto 0);
        data_out        : out    vl_logic_vector(63 downto 0)
    );
end permutation_1;
