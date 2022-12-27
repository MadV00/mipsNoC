`timescale 1ns/1ns

module wrapper_tb ();

  reg [23:0]i_data_b;
  reg [23:0]i_data_l;
  reg [23:0]i_data_pe;
  reg [23:0]i_data_r;
  reg [23:0]i_data_t;
  reg i_ready_b;
  reg i_ready_l;
  reg i_ready_pe;
  reg i_ready_r;
  reg i_ready_t;
  reg rstn;
  reg i_valid_b;
  reg i_valid_l;
  reg i_valid_pe;
  reg i_valid_r;
  reg i_valid_t;
  reg clk;
  wire [23:0]o_data_b;
  wire [23:0]o_data_l;
  wire [23:0]o_data_pe;
  wire [23:0]o_data_r;
  wire [23:0]o_data_t;
  wire o_ready_b;
  wire o_ready_l;
  wire o_ready_pe;
  wire o_ready_r;
  wire o_ready_t;
  wire o_valid_b;
  wire o_valid_l;
  wire o_valid_pe;
  wire o_valid_r;
  wire o_valid_t;


    initial begin
        clk=0;
    end

    always #50 clk = ~ clk;

    switch dut(
  i_data_b,
  i_data_l,
  i_data_pe,
  i_data_r,
  i_data_t,
  i_ready_b,
  i_ready_l,
  i_ready_pe,
  i_ready_r,
  i_ready_t,
  rstn,
  i_valid_b,
  i_valid_l,
  i_valid_pe,
  i_valid_r,
  i_valid_t,
  clk,
  o_data_b,
  o_data_l,
  o_data_pe,
  o_data_r,
  o_data_t,
  o_ready_b,
  o_ready_l,
  o_ready_pe,
  o_ready_r,
  o_ready_t,
  o_valid_b,
  o_valid_l,
  o_valid_pe,
  o_valid_r,
  o_valid_t
    );

  initial begin

    //ALL RESET
//    i_reset_b = 1'b0;
//    i_reset_l = 1'b0;
//    i_reset_pe = 1'b0;
//    i_reset_r = 1'b0;
//    i_reset_t = 1'b0;
//    o_reset = 1'b0;
      rstn = 1'b0;

    #500;
    // REMOVING RESET
//    i_reset_b = 1'b1;
//    i_reset_l = 1'b1;
//    i_reset_pe = 1'b1;
//    i_reset_r = 1'b1;
//    i_reset_t = 1'b1;
//    o_reset = 1'b1;
      rstn = 1'b1;

    #500;
//    //ALL RESET
//    i_reset_b = 1'b0;
//    i_reset_l = 1'b0;
//    i_reset_pe = 1'b0;
//    i_reset_r = 1'b0;
//    i_reset_t = 1'b0;
//    o_reset = 1'b0;
//    #50



//    //i_valid_b = 1'b1;
//    //i_valid_l = 1'b1;
//    //i_valid_pe = 1'b1;
//    //i_valid_r = 1'b1;

//    i_reset_t = 1'b1;
//    o_reset = 1'b1;
    i_valid_t = 1'b1;
    //$monitor ("%0t %0b %0b %0b %0b %0b %0b %0b %0b %0b %0b %0b %0b", $time,i_data_b, i_data_l, i_data_pe, i_data_r, i_data_t, o_data_b, o_data_l, o_data_pe, o_data_r, o_data_t);

    #100
    $display ("top to left"); 
    i_data_t = 24'h030403; //3,4 
    i_valid_t = 1'b1;
    #30
    $display ("%0t %0h %0h", $time,i_data_t,o_data_l);
/*
    #70

    $display ("top to left"); 
    i_data_t = 24'haa0304; //3,4
    #30
    $display ("%0t %0h %0h", $time,i_data_t,o_data_l);
    
    #70
      

    $display ("top to pe");
    i_data_t = 24'haa0404; // 4,4
    #30
    $display ("%0t %0h %0h", $time,i_data_t,o_data_pe);
    
    #70
        

    $display ("top to bottom");
    i_data_t = 24'haa0403; //4,3
    #30
    $display ("%0t %0h %0h", $time,i_data_t,o_data_b);
    
    #70
        

    $display ("top to sw");  
    i_data_t = 24'haa0503; //5,3
    #30
    $display ("%0t %0h %0h %0h", $time,i_data_t,o_data_r,o_data_b);
*/
//#200
  i_ready_l = 1'b1;
#1800
  $finish;
  end

endmodule