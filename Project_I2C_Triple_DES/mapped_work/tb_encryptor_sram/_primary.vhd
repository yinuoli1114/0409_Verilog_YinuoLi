library verilog;
use verilog.vl_types.all;
entity tb_encryptor_sram is
    generic(
        CLK_PERIOD      : integer := 6;
        SCL_PERIOD      : integer := 300
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of CLK_PERIOD : constant is 1;
    attribute mti_svvh_generic_type of SCL_PERIOD : constant is 1;
end tb_encryptor_sram;
