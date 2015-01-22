library verilog;
use verilog.vl_types.all;
entity triple_des is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        key1            : in     vl_logic_vector(63 downto 0);
        key2            : in     vl_logic_vector(63 downto 0);
        input_triple    : in     vl_logic_vector(63 downto 0);
        output_triple   : out    vl_logic_vector(63 downto 0);
        ed_sel          : in     vl_logic;
        ready           : in     vl_logic;
        \next\          : out    vl_logic
    );
end triple_des;
