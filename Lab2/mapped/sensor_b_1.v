
module sensor_b ( sensors, error );
  input [3:0] sensors;
  output error;
  wire   n7, n8;

  AOI21X1 U7 ( .A(sensors[3]), .B(sensors[1]), .C(sensors[0]), .Y(n8) );
  NAND2X1 U8 ( .A(sensors[1]), .B(sensors[2]), .Y(n7) );
  NAND2X1 U9 ( .A(n8), .B(n7), .Y(error) );
endmodule

