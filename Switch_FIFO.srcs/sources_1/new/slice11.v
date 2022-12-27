`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2022 16:22:28
// Design Name: 
// Module Name: slice11
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


module slice1 (

input [31:0] Din,
output [4:0] Dout
    );
    
    
 assign Dout =  Din[20:16];  
    
endmodule
