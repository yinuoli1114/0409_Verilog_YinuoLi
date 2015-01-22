library verilog;
use verilog.vl_types.all;
entity rx_sr is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        sda_in          : in     vl_logic;
        rising_edge_found: in     vl_logic;
        rx_enable       : in     vl_logic;
        rx_data         : out    vl_logic_vector(7 downto 0)
    );
end rx_sr;
