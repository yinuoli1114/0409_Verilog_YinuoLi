library verilog;
use verilog.vl_types.all;
entity sync is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        async_in        : in     vl_logic_vector(3 downto 0);
        sync_out        : out    vl_logic_vector(3 downto 0)
    );
end sync;
