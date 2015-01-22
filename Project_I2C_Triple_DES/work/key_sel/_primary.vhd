library verilog;
use verilog.vl_types.all;
entity key_sel is
    port(
        K_sub           : out    vl_logic_vector(1 to 48);
        K               : in     vl_logic_vector(55 downto 0);
        roundSel        : in     vl_logic_vector(3 downto 0)
    );
end key_sel;
