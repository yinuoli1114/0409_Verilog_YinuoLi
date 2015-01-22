library verilog;
use verilog.vl_types.all;
entity key_shift_0 is
    port(
        kin             : in     vl_logic_vector(55 downto 0);
        k_out           : out    vl_logic_vector(55 downto 0);
        roundSel        : in     vl_logic_vector(4 downto 0)
    );
end key_shift_0;
