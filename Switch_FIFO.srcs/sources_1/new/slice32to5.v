`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2022 16:05:56
// Design Name: 
// Module Name: slice32to5
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


module slice0 (

input [31:0] Din,
output [4:0] Dout
    );
    
    
 assign Dout =  Din[25:21];  
    
endmodule
