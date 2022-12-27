`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2022 16:17:57
// Design Name: 
// Module Name: slice3
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


module slice3 (

input [31:0] Din,
output [15:0] Dout
    );
    
    
 assign Dout =  Din[15:0];  
    
endmodule
