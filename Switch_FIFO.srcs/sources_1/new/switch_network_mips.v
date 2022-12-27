`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.11.2022 13:13:06
// Design Name: 
// Module Name: switch_network_mips
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


module switch_network_mips #(parameter x_coord = 3'b100, y_coord = 3'b100, X = 2, Y = 2, data_width = 32, x_size = 8, y_size = 8, total_width = 50)
(
input clk,
input [55:0]i_data_r,
input [55:0]i_data_t,
input [55:0]i_data_l,
input [55:0]i_data_pe,
input [55:0]i_data_b,
input i_valid_r,
input i_valid_t,
input i_valid_l,
input i_valid_pe,
input i_valid_b,
output o_ready_r,
output o_ready_t,
output o_ready_l,
output o_ready_pe,
output o_ready_b,
input rstn,
output o_valid_r,
output o_valid_t,
output o_valid_b,
output o_valid_pe,
output o_valid_l,
input i_ready_r,
input i_ready_t,
input i_ready_l,
input i_ready_b,
input i_ready_pe,
output [55:0] o_data_r,    
output [55:0] o_data_l,
output [55:0] o_data_t,
output [55:0] o_data_b,
output [55:0] o_data_pe
);

wire [31:0] inst;
wire in_clock;
wire i_wr_en;
wire [31:0]wr_address;
wire [31:0]rd_address;
wire reset;
wire [31:0] final_data;
wire final_valid;
wire [55:0] op_data;
wire rd_addr_valid;

//assign op_data = ({8'b11111111,final_data,16'b0000000000000000});

switch #(.x_coord(x_coord),.y_coord(y_coord),.X(X),.Y(Y),.data_width(data_width), .x_size(x_size), .y_size(y_size),.total_width(total_width))
switch_block(
 .clk(clk),
 .i_data_r(i_data_r),
 .i_data_t(i_data_t),
 .i_data_l(i_data_l),
 .i_data_pe({y_coord,x_coord,2'b11,final_data,16'b0000000000000000}), //to understand which mips executed the code
 .i_data_b(i_data_b),
 .i_valid_r(i_valid_r),
 .i_valid_t(i_valid_t),
 .i_valid_l(i_valid_l),
 .i_valid_pe(final_valid),
 .i_valid_b(i_valid_b),
 .o_ready_r(o_ready_r),
 .o_ready_t(o_ready_t),
 .o_ready_l(o_ready_l),
 .o_ready_pe(o_ready_pe),
 .o_ready_b(o_ready_b),
 .rstn(rstn),
 .o_valid_r(o_valid_r),
 .o_valid_t(o_valid_t),
 .o_valid_b(o_valid_b),
 .o_valid_pe(o_valid_pe),
 .o_valid_l(o_valid_l),
 .i_ready_r(i_ready_r),
 .i_ready_t(i_ready_t),
 .i_ready_l(i_ready_l),
 .i_ready_b(i_ready_b),
 .i_ready_pe(i_ready_pe),
 .o_data_r(o_data_r),    
 .o_data_l(o_data_l),
 .o_data_t(o_data_t),
 .o_data_b(o_data_b),
 .o_data_pe(o_data_pe)
); 

networkctrl networkctrl_block(
 .clk(clk),
 .dat(o_data_pe),
 .reset(reset),
 .inst(inst),
 .valid(o_valid_pe),
 .i_wr_en(i_wr_en),
 .wr_address(wr_address),
 .rd_address(rd_address),
 .rd_addr_valid(rd_addr_valid)
 );
 
mips mips_block(
   .in_clock(clk),
   .reset(reset),
   .inst(inst),
   .i_wr_en(i_wr_en),
   .wr_address(wr_address),
   .rd_address(rd_address),
   .rd_addr_valid(rd_addr_valid),
   .final_data(final_data),
   .final_valid(final_valid)
   );
 

 

endmodule
