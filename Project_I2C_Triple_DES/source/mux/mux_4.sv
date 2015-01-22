// $Id: $
module mux_4
(
   input wire [3:0] data_out,
   input wire [3:0] input_data,
   input wire dir_sel,
   output wire [3:0] output_data
);


  assign output_data = (dir_sel == 1'b0)? data_out : input_data;  

endmodule
