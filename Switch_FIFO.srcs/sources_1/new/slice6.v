`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2022 16:20:20
// Design Name: 
// Module Name: slice6
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


module slice6 (

input [31:0] Din,
output [5:0] Dout
    );
    
    
 assign Dout =  Din[31:26];  
    
endmodule
