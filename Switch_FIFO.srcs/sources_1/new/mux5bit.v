`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2022 16:02:08
// Design Name: 
// Module Name: mux5bit
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


module mux5bit #(parameter width=5)(
input [width-1:0]  in0,
input [width-1:0]  in1,
input   ctrl,
output [width-1:0] muxOut
);


assign muxOut = ctrl ? in1 : in0; 


endmodule
