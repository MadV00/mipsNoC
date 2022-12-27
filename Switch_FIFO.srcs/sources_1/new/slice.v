`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.11.2022 16:09:08
// Design Name: 
// Module Name: slice
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


module slice #(parameter inputWidth=5,sliceFrom=5,sliceWidth=2)(

input [inputWidth-1:0] Din,
output [sliceFrom-1:sliceFrom-1-sliceWidth] Dout
    );
    
    
 assign Dout =  Din[sliceFrom-1-:sliceWidth];  
    
endmodule
