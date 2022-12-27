`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/55/2022 05:53:55 PM
// Design Name: 
// Module Name: mux
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


module mux #(parameter width=32)(
input [width-1:0]  in0,
input [width-1:0]  in1,
input   ctrl,
output [width-1:0] muxOut
);


assign muxOut = ctrl ? in1 : in0; 


endmodule
