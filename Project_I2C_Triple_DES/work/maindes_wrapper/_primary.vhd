library verilog;
use verilog.vl_types.all;
entity maindes_wrapper is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        i2c_stop        : in     vl_logic;
        i2c_rw          : in     vl_logic;
        data_ready      : in     vl_logic;
        ag_enable       : out    vl_logic;
        key_activate_key1: out    vl_logic;
        key_activate_key2: out    vl_logic;
        key1            : in     vl_logic_vector(63 downto 0);
        key2            : in     vl_logic_vector(63 downto 0);
        address         : out    vl_logic_vector(15 downto 0);
        read_en         : out    vl_logic;
        write_en        : out    vl_logic;
        des_out         : out    vl_logic_vector(63 downto 0);
        des_in          : in     vl_logic_vector(63 downto 0)
    );
end maindes_wrapper;
