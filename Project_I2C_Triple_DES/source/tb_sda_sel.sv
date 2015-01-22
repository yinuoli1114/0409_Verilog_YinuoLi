// $Id: $
// File name:   tb_sda_sel.sv
// Created:     10/8/2014
// Author:      Ikeme Osi-Ogbu
// Lab Section: 337-04
// Version:     1.0  Initial Design Entry
// Description: test bench for sda sel block 
`timescale 1 ns/1 ps
module tb_sda_sel
();

  wire test_tx_out;
  wire [1:0] test_sda_mode;
  wire test_sda_out;
 

	reg tmp_out;
  reg [1:0] tmp_mode;
  reg expected;
  reg no_match;
 

	sda_sel DUT(.tx_out(test_tx_out), .sda_mode(test_sda_mode), .sda_out(test_sda_out));
	
	assign test_tx_out = tmp_out;
	assign test_sda_mode = tmp_mode;
  

initial begin
    tmp_out <= 1; tmp_mode <=2'b00;
    #10ns;
     expected  = (tmp_mode == 2'b00)? 1 : ((tmp_mode == 2'b01)? 0 :(tmp_mode == 2'b10)? 1:tmp_out);
    assert(expected == test_sda_out)begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;
    end
    
    tmp_out <= 1; tmp_mode <=2'b01;
    #10ns;
     expected  = (tmp_mode == 2'b00)? 1 : ((tmp_mode == 2'b01)? 0 :(tmp_mode == 2'b10)? 1:tmp_out);
    assert(expected == test_sda_out)begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;
    end
    
    tmp_out <= 1; tmp_mode <=2'b10;
    #10ns;
     expected  = (tmp_mode == 2'b00)? 1 : ((tmp_mode == 2'b01)? 0 :(tmp_mode == 2'b10)? 1:tmp_out);
    assert(expected == test_sda_out)begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;
    end
    

   tmp_out <= 1; tmp_mode <=2'b11;
    #10ns;
     expected  = (tmp_mode == 2'b00)? 1 : ((tmp_mode == 2'b01)? 0 :(tmp_mode == 2'b10)? 1:tmp_out);
    assert(expected == test_sda_out)begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;
    end
    

  tmp_out <= 0; tmp_mode <=2'b11;
    #10ns;
     expected  = (tmp_mode == 2'b00)? 1 : ((tmp_mode == 2'b01)? 0 :(tmp_mode == 2'b10)? 1:tmp_out);
    assert(expected == test_sda_out)begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;
    end
    
 
   tmp_out <= 0; tmp_mode <=2'b00;
    #10ns;
     expected  = (tmp_mode == 2'b00)? 1 : ((tmp_mode == 2'b01)? 0 :(tmp_mode == 2'b10)? 1:tmp_out);
    assert(expected == test_sda_out)begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;
    end
    

   tmp_out <= 0; tmp_mode <=2'b01;
    #10ns;
     expected  = (tmp_mode == 2'b00)? 1 : ((tmp_mode == 2'b01)? 0 :(tmp_mode == 2'b10)? 1:tmp_out);
    assert(expected == test_sda_out)begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;
    end
    

   tmp_out <= 00; tmp_mode <=2'b00;
    #10ns;
     expected  = (tmp_mode == 2'b00)? 1 : ((tmp_mode == 2'b01)? 0 :(tmp_mode == 2'b10)? 1:tmp_out);
    assert(expected == test_sda_out)begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;
    end
    

   tmp_out <= 1; tmp_mode <=2'b10;
    #10ns;
     expected  = (tmp_mode == 2'b00)? 1 : ((tmp_mode == 2'b01)? 0 :(tmp_mode == 2'b10)? 1:tmp_out);
    assert(expected == test_sda_out)begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;
    end
    

   tmp_out <= 1; tmp_mode <=2'b00;
    #10ns;
     expected  = (tmp_mode == 2'b00)? 1 : ((tmp_mode == 2'b01)? 0 :(tmp_mode == 2'b10)? 1:tmp_out);
    assert(expected == test_sda_out)begin
       $display("Correct Answer");
       no_match = 0;
    end else begin $error("Wrong Answer");
         no_match = 1;
    end
    
	  end
endmodule
