`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/55/2022 05:19:58 PM
// Design Name: 
// Module Name: programCounter
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module programCounter(
    input   i_clk,
    input [31:0] pcIn,
    input en,
    input reset,
    output reg [31:0] pcOut,
    input halt
);

reg [2:0]halt_count;

initial
begin
   halt_count = 2'b0;
   pcOut <= 32'h00000000; 
end
    
always @(posedge i_clk)
begin
    if(!reset)
        pcOut <= 32'h00000000;
    else if(halt)
     begin
      if(halt_count == 3'b100)
        pcOut <= 32'h00000000;
      else
        begin
        halt_count <= halt_count + 1;
        pcOut <= pcIn;
        end
     end
    else if (en)
        pcOut <= pcIn;
   
    
end
    
endmodule
