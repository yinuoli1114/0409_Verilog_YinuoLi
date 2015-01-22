library verilog;
use verilog.vl_types.all;
entity tb_maindes_wrapper is
    generic(
        CLK_PERIOD      : integer := 7
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_PERIOD : constant is 1;
end tb_maindes_wrapper;
