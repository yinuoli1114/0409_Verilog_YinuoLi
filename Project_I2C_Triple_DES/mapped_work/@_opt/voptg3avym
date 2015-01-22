library verilog;
use verilog.vl_types.all;
entity encryptor_sram is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        sda_in          : in     vl_logic;
        scl             : in     vl_logic;
        sda_out         : out    vl_logic;
        w_en            : out    vl_logic;
        r_en            : out    vl_logic;
        addr            : out    vl_logic_vector(15 downto 0);
        sram_input      : in     vl_logic_vector(7 downto 0);
        sram_output     : out    vl_logic_vector(7 downto 0)
    );
end encryptor_sram;
