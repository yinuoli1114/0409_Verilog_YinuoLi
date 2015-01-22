// $Id: $
// File name:   tb_timer.sv
// Created:     10/19/2014
// Author:      Yinuo Li
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: tb for tttttimer
`timescale 1ns / 10ps

module tb_timer();
  
  
localparam	CLK_PERIOD				= 1;
parameter SCL_PERIOD	= (30 * CLK_PERIOD);
localparam	FF_SETUP_TIME	= 0.190;
localparam	FF_HOLD_TIME	= 0.100;
localparam	CHECK_DELAY 	= (CLK_PERIOD - FF_SETUP_TIME); // Check right before the setup time starts
 
 
//Setupping DECODER------------------------------------------------------------------------------------------------------------------
reg clk;
	reg n_rst;
	reg scl;
	reg sda_in;
	reg [7:0] starting_byte;
	
	wire rw_mode;
	wire address_match, stop_found, start_found; 
 
  decode DUT(.clk(clk),.n_rst(n_rst),.scl(scl),.sda_in(sda_in),.starting_byte(starting_byte),.rw_mode(rw_mode),.address_match(address_match),.stop_found(stop_found),.start_found(start_found));
  
	always
	begin
		clk = 1'b0;
		#(CLK_PERIOD/2.0);
		clk = 1'b1;
		#(CLK_PERIOD/2.0);
	end
//Done Setup-----------------------------------------------------------------------------------------------------------------------------------
// Setupping SCL EDGE DETECTOR---------------------------------------------------------------------------------------------------------------


	// Declare DUT portmap signals
//	reg clk;
//	reg n_rst;
wire rising_edge_found;
wire falling_edge_found;  


	
	// SCL generation block
 // always
//	begin
//	  n_rst=1;	
//		scl = 1'b0;
//		#(SCL_PERIOD*(2.0/3.0));
//		scl = 1'b1;
//		#(SCL_PERIOD*(1.0/3.0)); 
//	end
	
	
scl_edge DUT1(.clk(clk),.n_rst(n_rst),.scl(scl),.rising_edge_found(rising_edge_found),.falling_edge_found(falling_edge_found));  
  
//Done SETUP--------------------------------------------------------------------------------------------------------------------------
// Setupping input Serial to Parallel Shift register
reg rx_enable;

rx_sr ShiftReg(.clk(clk),.n_rst(n_rst),.sda_in(sda_in),.rising_edge_found(rising_edge_found),.rx_enable(rx_enable),.rx_data(starting_byte));

  
  
  
// Done


//Setupping Timer----------------------------------------------------------------

reg byte_received;
reg ack_prep;
reg check_ack;
reg ack_done;

timer timerDUT(.clk(clk),.n_rst(n_rst),.rising_edge_found(rising_edge_found),.falling_edge_found(falling_edge_found),.stop_found(stop_found),.start_found(start_found),
                .byte_received(byte_received),.ack_prep(ack_prep),.check_ack(check_ack),.ack_done(ack_done));
     


//Done-----------------------------------------------------------
// Initilizing SCL generator----------------------------------
reg done;
reg enable;
reg [6:0]no_pulses;
reg clear;
reg line_override;
reg scl_val;
reg [6:0]pulse_number;
reg sda_val;
scl_generator DUT2(.clk(clk),.clear(clear),
.count_enable(enable),.no_pulses(no_pulses),.scl(scl),.done(done),.line_override(line_override),.scl_val(scl_val),.pulse_number(pulse_number),.sda_value(sda_val),.sda(sda_in));  

//Done SCL generator-------------------------------------


  
initial begin
  //Initialize SCL and SDA values and rx_enable
  rx_enable=0;
  line_override=1;
  #(2);
  scl_val=1;
  sda_val=1;
  #(2);
  line_override=0;
  
  // Resetting
  n_rst=1;
  #(2);
  n_rst=0;
  #(2);
  n_rst=1;
  #(2);

  
  // Creating Start Condition
  line_override=1;
  #(2);
  scl_val=1;
  #(20); // let it propogate
  sda_val=1;
  #(20);
  sda_val=0;
  @(posedge clk);
  #(CHECK_DELAY);
line_override=0;
    
  rx_enable=1; //Enabling Shift Register
  // SCL Enabler Code
  clear=1;
  #(2);
  clear=0;
  no_pulses=7'd18;
  enable=1;
  @(posedge done);
  enable=0;
  clear=1;
  $display("SCL pulse generator disabled now");
  #(2);
  clear=0;
  // SCL enabler Code End
  
   #(80);
  // Creating Stop Condition
  line_override=1;
  #(20); /// waiting to make it look clear
  scl_val=1;
  #(20); // let it propogate
  sda_val=1;
  @(posedge clk);
  #(CHECK_DELAY);
   
  line_override=0;
  
 // Creating Start Condition
  line_override=1;
  #(2);
  scl_val=1;
  #(20); // let it propogate
  sda_val=1;
  #(20);
  sda_val=0;
  @(posedge clk);
  #(CHECK_DELAY);
line_override=0;

 // SCL Enabler Code
  clear=1;
  #(2);
  clear=0;
  no_pulses=7'd9;
  enable=1;
  @(posedge done);
  enable=0;
  clear=1;
  $display("SCL pulse generator disabled now");
  #(2);
  clear=0;
  // SCL enabler Code End
  

 // Creating Start Condition
  line_override=1;
  #(2);
  scl_val=1;
  #(20); // let it propogate
  sda_val=1;
  #(20);
  sda_val=0;
  @(posedge clk);
  #(CHECK_DELAY);
line_override=0;


 // SCL Enabler Code
  clear=1;
  #(2);
  clear=0;
  no_pulses=7'd9;
  enable=1;
  @(posedge done);
  enable=0;
  clear=1;
  $display("SCL pulse generator disabled now");
  #(2);
  clear=0;
  // SCL enabler Code End


   #(80);
  // Creating Stop Condition
  line_override=1;
  #(20); /// waiting to make it look clear
  scl_val=1;
  #(20); // let it propogate
  sda_val=1;
  @(posedge clk);
  #(CHECK_DELAY);
  line_override=0;
  
  
end
	
  
  
endmodule
