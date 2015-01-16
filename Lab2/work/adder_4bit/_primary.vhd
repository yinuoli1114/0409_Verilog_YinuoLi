library verilog;
use verilog.vl_types.all;
entity adder_4bit is
    generic(
        BIT_WIDTH       : integer := 4
    );
    port(
        a               : in     vl_logic_vector;
        b               : in     vl_logic_vector;
        carry_in        : in     vl_logic;
        sum             : out    vl_logic_vector;
        overflow        : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BIT_WIDTH : constant is 1;
end adder_4bit;
