library verilog;
use verilog.vl_types.all;
entity i2c is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        scl             : in     vl_logic;
        sda_in          : in     vl_logic;
        data_ready      : in     vl_logic;
        output_ready    : in     vl_logic;
        i2c_out         : out    vl_logic_vector(7 downto 0);
        start           : out    vl_logic;
        stop            : out    vl_logic;
        write_data      : in     vl_logic_vector(63 downto 0);
        sda_out         : out    vl_logic;
        en_write_r      : out    vl_logic;
        i2c_rw          : out    vl_logic;
        en_load         : out    vl_logic
    );
end i2c;
