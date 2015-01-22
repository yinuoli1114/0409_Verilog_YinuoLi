// $Id: $
// File name:   scl_generator.sv
// Created:     10/19/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb for timer
`timescale 1ns / 10ps

module scl_generator(input wire count_enable, clear, clk, [6:0]no_pulses,
  input wire line_override, scl_val, sda_value,
  output reg scl, done, sda,
  output reg [6:0]pulse_number);
  
localparam	CLK_PERIOD				= 1;
parameter SCL_PERIOD	= (30 * CLK_PERIOD);
localparam	FF_SETUP_TIME	= 0.190;
localparam	FF_HOLD_TIME	= 0.100;
localparam	CHECK_DELAY 	= (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts

reg [27:0]sda_data;

always @ (posedge clk)
	begin
		if(clear) begin pulse_number=0; done=0; end
		else if (line_override) begin scl=scl_val; sda=sda_value; end
		else if (count_enable)
		begin
		  
		  if (!done) begin
		  sda_data=28'b1000101110010110000010001111;
		  $display("SCL pulse generator enabled, will generate %d pulses", (no_pulses));
			while (pulse_number!=no_pulses) begin  
       scl = 1'b0;
      	#(SCL_PERIOD*(1.0/3.0));
      	/*if (pulse_number<=8)*/	sda=sda_data[pulse_number]; /*else sda=1'bz;*/
      	$display("Sda data= %d",sda);   	
      	#(SCL_PERIOD*(1.0/3.0));
      	pulse_number=pulse_number+7'd1;
      	scl = 1'b1;
      	#(SCL_PERIOD*(1.0/3.0)); 
      scl = 1'b0; 
      //  $display("Entered Here, counter=%d, no_pulses=%d, done=%d",counter,no_pulses,done);
        //if (counter==no_pulses) $display("Strange");
      end
      done=1;
      //$display("done=%d",done);
    end
		end 
end

  
  
  
endmodule
