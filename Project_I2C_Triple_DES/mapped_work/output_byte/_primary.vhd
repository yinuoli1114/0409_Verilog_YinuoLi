library verilog;
use verilog.vl_types.all;
entity output_byte is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        load_enable     : in     vl_logic;
        rw              : in     vl_logic;
        des_out         : in     vl_logic_vector(63 downto 0);
        to_sram         : out    vl_logic_vector(7 downto 0);
        to_i2c          : out    vl_logic_vector(63 downto 0)
    );
end output_byte;
