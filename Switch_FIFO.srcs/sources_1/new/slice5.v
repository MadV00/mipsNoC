`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2022 16:20:05
// Design Name: 
// Module Name: slice5
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


module slice5 (

input [31:0] Din,
output [25:0] Dout
    );
    
    
 assign Dout =  Din[25:0];  
    
endmodule
