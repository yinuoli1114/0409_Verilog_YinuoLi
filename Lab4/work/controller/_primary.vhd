library verilog;
use verilog.vl_types.all;
entity controller is
    port(
        clk             : in     vl_logic;
        n_reset         : in     vl_logic;
        dr              : in     vl_logic;
        overflow        : in     vl_logic;
        cnt_up          : out    vl_logic;
        modwait         : out    vl_logic;
        op              : out    vl_logic_vector(1 downto 0);
        src1            : out    vl_logic_vector(3 downto 0);
        src2            : out    vl_logic_vector(3 downto 0);
        dest            : out    vl_logic_vector(3 downto 0);
        err             : out    vl_logic
    );
end controller;
