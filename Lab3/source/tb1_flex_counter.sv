// $Id: $
// File name:   tb_flex_counter.sv
//jjjjjjjjjjjjjjjj
// Version:     1.0  Initial Design Entry
// Description: test bench for flexible counter

`timescale 1ns / 10ps

module tb_flex_counter();
  
  localparam NUM_CNT_BITS = 4;
  localparam CLK_PERIOD = 2.5;
  localparam CHECK_DELAY = 1;//check 1ns after rising edge
 // input wire clk,n_rst,clear,count_enable,
 // input wire [NUM_CNT_BITS - 1:0] rollover_val,
  
  reg [NUM_CNT_BITS - 1:0] tb_rollover_val;
  reg tb_clk;
  reg tb_rst;
  reg tb_clear;
  reg tb_count_enable;
  reg tb_flag;
  reg [NUM_CNT_BITS - 1:0] test_case;
  reg [NUM_CNT_BITS + 1:0] test_num;
  reg [NUM_CNT_BITS - 1:0] tb_count_out;
  reg [NUM_CNT_BITS - 1:0] tb_expt_count_out;
  
  //DUT portmap
  flex_counter COUNTER
  (
  .clk(tb_clk),
  .n_rst(tb_rst),
  .clear(tb_clear),
  .count_enable(tb_count_enable),
  .rollover_val(tb_rollover_val),
  .count_out(tb_count_out),
  .rollover_flag(tb_flag)
  );
  
  always begin
    tb_clk = 1'b0;
    #(CLK_PERIOD / 2);
    tb_clk = 1'b1;
    #(CLK_PERIOD / 2);
  end
  
  initial
  begin
    
    tb_rst = 1'b1;
    tb_clear = 1'b0;
    tb_count_enable = 1'b0;
    test_num = 0;
    test_case = 1;
    tb_rollover_val = 2**3;
    tb_expt_count_out = 0;
    
    #(0.1);
    tb_rst = 1'b0;
    #(CLK_PERIOD * 2.25);
    tb_rst = 1'b1;
    #(CLK_PERIOD);
    @(negedge tb_clk);
    //test_num = test_num + 1;
    tb_rst = 1'b0;
    #(CHECK_DELAY)
    if(tb_count_out == 0) 
      $info("Reset PASSED!");
    else
      $error("Reset FAILED!");
      
    
    @(negedge tb_clk);
    tb_rst = 1'b1;
    tb_count_enable = 1'b0;
    tb_clear = 1'b1;
    @(posedge tb_clk);
    #(CHECK_DELAY);
    tb_expt_count_out = 0;
    if(tb_expt_count_out == tb_count_out)
      $info("Testcase 0%d:: clear PASSED! tb_counter: %d",test_num,tb_count_out);
    else
      $error("Testcase 0%d:: clear FAILED! tb_counter: %d",test_num,tb_count_out);
    @(negedge tb_clk);
    tb_count_enable = 1'b1;
    tb_clear = 1'b0;
    #(CHECK_DELAY);
    for(test_num = 0; test_num < 2 * tb_rollover_val; test_num++) begin
      @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_expt_count_out = tb_expt_count_out + 1;
      @(negedge tb_clk);
      if(tb_expt_count_out == tb_rollover_val) begin
         if (tb_flag == 1)
          $info("Testcase FLAG %d:: PASSED! tb_counter: %d",test_num,tb_count_out);
        else
          $error("Testcase FLAG %d:: FAILED! tb_counter: %d",test_num,tb_count_out);
      end
      if(tb_expt_count_out - 1 == tb_rollover_val) begin
        tb_expt_count_out = 1;
      end
      if(tb_expt_count_out == tb_count_out)
        $info("Testcase initial %d:: PASSED! tb_counter: %d",test_num,tb_count_out);
      else
        $error("Testcase initial %d:: FAILED! tb_counter: %d",test_num,tb_count_out);
    end
    
    for( test_case = 1; test_case <= 2**NUM_CNT_BITS - 1; test_case++) begin
    //#(CHECK_DELAY);
    tb_rollover_val = test_case;
    tb_rst = 1'b1;
    tb_count_enable = 1'b0;
    tb_clear = 1'b1;
    @(posedge tb_clk);
    #(CHECK_DELAY);
    tb_expt_count_out = 0;     
    if(tb_expt_count_out == tb_count_out)
      $info("Testcase %d %d:: clear PASSED! tb_counter: %d",test_case,test_num,tb_count_out);
    else
      $error("Testcase %d %d:: clear FAILED! tb_counter: %d",test_case, test_num,tb_count_out);
    @(negedge tb_clk);     
    tb_count_enable = 1'b1;
    tb_clear = 1'b0;
    
    for(test_num = 0; test_num < 2 * tb_rollover_val; test_num++) begin
      @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_expt_count_out = tb_expt_count_out + 1;
      @(negedge tb_clk);
      if(tb_expt_count_out == tb_rollover_val) begin
        if (tb_flag == 1)
          $info("Testcase FLAG %d %d:: PASSED! tb_counter: %d",test_case, test_num,tb_count_out);
        else
          $error("Testcase FLAG %d %d:: FAILED! tb_counter: %d",test_case, test_num,tb_count_out);
      end
      
      if(tb_expt_count_out == tb_rollover_val  + 1) begin
        tb_expt_count_out = 1;
      end
       
      if(tb_expt_count_out == tb_count_out)
        $info("Testcase %d %d:: PASSED! tb_counter: %d",test_case, test_num, tb_count_out);
      else
        $error("Testcase %d %d:: FAILED! expected: %d tb_counter: %d",test_case,test_num,tb_expt_count_out,tb_count_out);
     
    end
    
    end
    
    
    tb_rst = 1'b1;
    tb_count_enable = 1'b0;
    tb_clear = 1'b1;
    @(posedge tb_clk);
    #(CHECK_DELAY);
     tb_expt_count_out = 0;
    if(tb_expt_count_out == tb_count_out)
      $info("Testcase %d:: clear PASSED! tb_counter: %d",test_num,tb_count_out);
    else
      $error("Testcase %d:: clear FAILED! tb_counter: %d",test_num,tb_count_out);
    @(negedge tb_clk);
    tb_clear = 1'b0;
    tb_count_enable = 1'b1;
    tb_rollover_val = 4;
    for(test_num = 0; test_num < 2 * tb_rollover_val; test_num++) begin
      @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_expt_count_out = tb_expt_count_out + 1;
      @(negedge tb_clk);
      if(tb_expt_count_out == tb_rollover_val) begin
         if (tb_flag == 1)
          $info("Testcase FLAG %d:: PASSED! tb_counter: %d",test_num,tb_count_out);
        else
          $error("Testcase FLAG %d:: FAILED! tb_counter: %d",test_num,tb_count_out);
      end
      if(tb_expt_count_out - 1 == tb_rollover_val)
        tb_expt_count_out = 1;
      if(tb_expt_count_out == tb_count_out)
        $info("Testcase 3 %d:: PASSED! tb_counter: %d",test_num,tb_count_out);
      else
        $error("Testcase 3 %d:: FAILED! tb_counter: %d",test_num,tb_count_out);
    end 
    
    tb_rst = 1'b1;
    //tb_count_enable = 1'b0;
    tb_clear = 1'b1;
    @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_clear = 1'b0;
      tb_expt_count_out = 0;
      if(tb_expt_count_out == tb_count_out)
        $info("Testcase %d:: clear PASSED! tb_counter: %d",test_num,tb_count_out);
      else
        $error("Testcase %d:: clear FAILED! tb_counter: %d",test_num,tb_count_out);
      @(negedge tb_clk);
    tb_count_enable = 1'b1;
     tb_rollover_val = 8;
     for(test_num = 0; test_num < 4 * tb_rollover_val; test_num++) begin
      @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_expt_count_out = tb_expt_count_out + 1;
      if(tb_expt_count_out == tb_rollover_val) begin
         if (tb_flag == 1)
          $info("Testcase FLAG %d:: PASSED! tb_counter: %d",test_num,tb_count_out);
        else
          $error("Testcase FLAG %d:: FAILED! tb_counter: %d",test_num,tb_count_out);
      end
      if(tb_expt_count_out - 1 == tb_rollover_val) begin
        tb_expt_count_out = 1;
        //tb_rollover_val = 10;
      end
      if(tb_expt_count_out == tb_count_out)
        $info("Testcase 4 %d:: PASSED! tb_counter: %d",test_num,tb_count_out);
      else
        $error("Testcase 4 %d:: FAILED! tb_counter: %d",test_num,tb_count_out);
      @(negedge tb_clk);
    end 
    #(CHECK_DELAY);
    @(negedge tb_clk);


    tb_rst = 1'b0;
    //tb_count_enable = 1'b0;
    tb_clear = 1'b1;
    @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_clear = 1'b0;
      tb_expt_count_out = 0;
      if(tb_expt_count_out == tb_count_out)
        $info("Testcase %d:: clear PASSED! tb_counter: %d",test_num,tb_count_out);
      else
        $error("Testcase %d:: clear FAILED! tb_counter: %d",test_num,tb_count_out);
      @(negedge tb_clk);
    tb_count_enable = 1'b1;
     tb_rollover_val = 8;
     for(test_num = 0; test_num < 4 * tb_rollover_val; test_num++) begin
      @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_expt_count_out = 0;
      if(tb_expt_count_out == tb_rollover_val) begin
         if (tb_flag == 1)
          $info("Testcase FLAG %d:: PASSED! tb_counter: %d",test_num,tb_count_out);
        else
          $error("Testcase FLAG %d:: FAILED! tb_counter: %d",test_num,tb_count_out);
      end
      if(tb_expt_count_out == tb_rollover_val + 1) begin
        tb_expt_count_out = 1;
        //tb_rollover_val = 10;
      end
      if(tb_expt_count_out == tb_count_out)
        $info("Testcase 4 %d:: PASSED! tb_counter: %d",test_num,tb_count_out);
      else
        $error("Testcase 4 %d:: FAILED! tb_counter: %d",test_num,tb_count_out);
      @(negedge tb_clk);
    end 
    #(CHECK_DELAY);
    @(negedge tb_clk);

    tb_rst = 1'b1;
    tb_count_enable = 1'b0;
    tb_clear = 1'b1;
    @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_clear = 1'b0;
      tb_expt_count_out = 0;
      if(tb_expt_count_out == tb_count_out)
        $info("Testcase %d:: clear PASSED! tb_counter: %d",test_num,tb_count_out);
      else
        $error("Testcase %d:: clear FAILED! tb_counter: %d",test_num,tb_count_out);
      @(negedge tb_clk);
    //tb_count_enable = 1'b1;
     tb_rollover_val = 8;
     for(test_num = 0; test_num < 4 * tb_rollover_val; test_num++) begin
      @(posedge tb_clk);
      #(CHECK_DELAY);
      tb_expt_count_out = 0;
      if(tb_expt_count_out == tb_rollover_val) begin
         if (tb_flag == 1)
          $info("Testcase FLAG %d:: PASSED! tb_counter: %d",test_num,tb_count_out);
        else
          $error("Testcase FLAG %d:: FAILED! tb_counter: %d",test_num,tb_count_out);
      end
      if(tb_expt_count_out == tb_rollover_val + 1) begin
        tb_expt_count_out = 1;
        //tb_rollover_val = 10;
      end
      if(tb_expt_count_out == tb_count_out)
        $info("Testcase 4 %d:: PASSED! tb_counter: %d",test_num,tb_count_out);
      else
        $error("Testcase 4 %d:: FAILED! tb_counter: %d",test_num,tb_count_out);
      @(negedge tb_clk);
    end 
    #(CHECK_DELAY);
    @(negedge tb_clk);


  end
  
  
  
  
endmodule;