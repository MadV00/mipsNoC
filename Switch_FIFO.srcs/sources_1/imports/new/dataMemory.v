`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/55/2022 05:11:42 PM
// Design Name: 
// Module Name: dataMemory
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


module dataMemory(
input          i_clk,
input   [31:0] readAddress,
input   [31:0] writeAddress,
input   [31:0] writeData,
output  [31:0] readData,
input          memWrite,
input   [31:0] rd_address,
input           rd_addr_valid,
output  [31:0] final_data,
output  final_valid,
input halt
);

reg [2:0] halt_count;


reg [31:0] mem [1055:0];

initial 
begin
halt_count = 3'b000;
end




assign readData =  mem[readAddress[31:2]];

assign final_data = mem[rd_address[31:2]];
assign final_valid = rd_addr_valid;
//assign final_valid = (halt_count == 2'b11 && final_data !== 32'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx)? 1:0;

//always@(i_clk) begin

//    if(final_valid)
//        final_valid = 1'b0;
//    else if(halt_count==2'b11)
//        begin
//            final_valid = 1'b1;
//            end
//    else
//        final_valid = 1'b0;
//end        


always @(posedge i_clk)
begin
    if(memWrite)
         mem[writeAddress[31:2]] <= writeData;
    if(halt & (halt_count!=3'b111))
         halt_count <= halt_count + 1;
end


endmodule
