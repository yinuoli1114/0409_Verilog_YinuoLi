// $Id: $
// File name:   tb_scl_edge.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for scl edge detector
`timescale 1 ns/1 ps
module tb_scl_edge
();

  wire test_rst;
  wire test_clk;
  wire test_scl;
  wire test_rising;
  wire test_falling;


	
	reg [3:0] test_number;
	reg temp_scl;
  reg tmp_rst;
  reg tmp_clk;
  reg expected_rise;
  reg expected_fall;
  reg no_match;
 

	scl_edge DUT(.clk(test_clk), .n_rst(test_rst), .scl(test_scl), .rising_edge_found(test_rising), .falling_edge_found(test_falling));
	
	assign test_scl = temp_scl;
  assign test_clk = tmp_clk;
  assign test_rst = tmp_rst;
 

always begin
 	tmp_clk <= 0;
 	#5ns;
 	tmp_clk <= 1;
  #5ns;
  end
  


initial begin
		tmp_rst = 0;
    #150ns;
    tmp_rst = 1;
 
   temp_scl <= 1;
   #300ns;
   expected_rise = 0;
   expected_fall = 0;
  temp_scl <=0;
  #5ns
  expected_rise = 0;
   expected_fall = 1;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;   
    end
   #10ns
    expected_rise = 0;
   expected_fall = 0;
  #100ns;

  temp_scl <=1;
    #20ns
   expected_rise = 1;
   expected_fall = 0;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;  
  end 
   #10ns
    expected_rise = 0;
   expected_fall = 0;
  #100ns; 
 
  temp_scl <=0;
  #20ns
  expected_rise = 0;
   expected_fall =1;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1; 
    end  
     #10ns
    expected_rise = 0;
   expected_fall = 0;
  #200ns;

  temp_scl <=1;
   #20ns
   expected_rise = 1;
   expected_fall = 0;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;   
  end
   #10ns
    expected_rise = 0;
   expected_fall = 0;
  #100ns;   

  temp_scl <=0;
  #20ns
  expected_rise = 0;
   expected_fall = 1;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;   
  end
   #10ns
    expected_rise = 0;
   expected_fall = 0;
  #200ns;

  temp_scl <=1;
   #20ns
   expected_rise = 1;
   expected_fall = 0;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;   
  end
   #10ns
    expected_rise = 0;
   expected_fall = 0;
  #100ns;   

  temp_scl <=0;
  #20ns
  expected_rise = 0;
   expected_fall = 1;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;   
  end
   #10ns
    expected_rise = 0;
   expected_fall = 0;
  #200ns;

  temp_scl <=1;
  #20ns
   expected_rise = 1;
   expected_fall = 0;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;   
  end 
   #10ns
    expected_rise = 0;
   expected_fall = 0;
  #40ns;
   tmp_rst = 0;
   #50ns;
    tmp_rst = 1;
    
temp_scl <= 1;
   #300ns;
   expected_rise = 0;
   expected_fall = 0;
   
  temp_scl <=0;
  expected_rise = 0;
   expected_fall = 1;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;   
    end
   #10ns
    expected_rise = 0;
   expected_fall = 0;
  #100ns;

  temp_scl <=1;
  #20ns
   expected_rise = 1;
   expected_fall = 0;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;  
  end 
   #10ns
    expected_rise = 0;
   expected_fall = 0;
  #100ns; 
 
  temp_scl <=0;
  #20ns
  expected_rise = 0;
   expected_fall =1;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1; 
    end  
     #10ns
    expected_rise = 0;
   expected_fall = 0;
  #500ns;

  temp_scl <=1;
   #20ns
   expected_rise = 1;
   expected_fall = 0;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;   
  end
   #10ns
    expected_rise = 0;
   expected_fall = 0;
   #40ns
   
  temp_scl <=0;
  #20ns
  expected_rise = 0;
   expected_fall =1;
    assert((expected_rise == test_rising) & (expected_fall == test_falling))begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1; 
    end  
     #10ns
    expected_rise = 0;
   expected_fall = 0;
	end
endmodule
