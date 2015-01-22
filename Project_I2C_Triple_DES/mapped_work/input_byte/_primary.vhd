library verilog;
use verilog.vl_types.all;
entity input_byte is
    port(
        clk             : in     vl_logic;
        nrst            : in     vl_logic;
        dir_sel         : in     vl_logic;
        from_sram       : in     vl_logic_vector(7 downto 0);
        from_i2c        : in     vl_logic_vector(7 downto 0);
        read_enable     : in     vl_logic;
        output_data     : out    vl_logic_vector(63 downto 0);
        data_ready      : out    vl_logic
    );
end input_byte;
