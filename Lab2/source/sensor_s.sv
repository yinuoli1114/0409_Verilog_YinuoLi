// $Id: $
// File name:   sensor_s.sv
// Created:     9/3/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: Structural Coding of Sensor Error Detector

module sensor_s
  (
  input wire [3:0] sensors,
  
  output wire error
  );
  and A0(int_and0,sensors[3],sensors[1]);
  and A1(int_and1,sensors[2],sensors[1]);
  
  or R0(int_or0,int_and0,int_and1);
  or R1(error,int_or0,sensors[0]);
  
endmodule
  