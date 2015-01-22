library verilog;
use verilog.vl_types.all;
entity i2c_slave is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        scl             : in     vl_logic;
        sda_in          : in     vl_logic;
        sda_out         : out    vl_logic;
        write_enable    : in     vl_logic;
        write_data      : in     vl_logic_vector(7 downto 0);
        fifo_empty      : out    vl_logic;
        fifo_full       : out    vl_logic
    );
end i2c_slave;
