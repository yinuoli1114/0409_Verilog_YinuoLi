library verilog;
use verilog.vl_types.all;
entity sda_sel is
    port(
        tx_out          : in     vl_logic;
        sda_mode        : in     vl_logic_vector(1 downto 0);
        sda_out         : out    vl_logic
    );
end sda_sel;
