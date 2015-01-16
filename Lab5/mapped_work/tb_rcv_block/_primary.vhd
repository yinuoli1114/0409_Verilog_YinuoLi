library verilog;
use verilog.vl_types.all;
entity tb_rcv_block is
    generic(
        CLK_PERIOD      : real    := 2.500000;
        NORM_DATA_PERIOD: vl_notype
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_PERIOD : constant is 1;
    attribute mti_svvh_generic_type of NORM_DATA_PERIOD : constant is 3;
end tb_rcv_block;
