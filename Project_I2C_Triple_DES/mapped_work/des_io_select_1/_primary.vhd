library verilog;
use verilog.vl_types.all;
entity des_io_select_1 is
    port(
        clk             : in     vl_logic;
        io_sel          : in     vl_logic_vector(1 downto 0);
        ext_in          : in     vl_logic_vector(63 downto 0);
        int_in          : in     vl_logic_vector(63 downto 0);
        data_out_right  : out    vl_logic_vector(31 downto 0);
        data_out_left   : out    vl_logic_vector(31 downto 0);
        ext_out         : out    vl_logic_vector(63 downto 0)
    );
end des_io_select_1;
