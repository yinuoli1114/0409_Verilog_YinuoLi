
module sensor_b ( sensors, error );
  input [3:0] sensors;
  output error;
  wire   n3, n4;

  AOI21X1 U4 ( .A(sensors[3]), .B(sensors[1]), .C(sensors[0]), .Y(n4) );
  NAND2X1 U5 ( .A(sensors[1]), .B(sensors[2]), .Y(n3) );
  NAND2X1 U6 ( .A(n4), .B(n3), .Y(error) );
endmodule

