`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.11.2022 17:01:50
// Design Name: 
// Module Name: networkctrl
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


module networkctrl(
input [55:0]dat,
output reg reset,
input clk,
input valid,
output reg [31:0]inst,
output reg i_wr_en,
output reg [31:0] wr_address,
output reg [31:0] rd_address,
output reg rd_addr_valid
);
reg reset_pulse1;
reg reset_d;
reg reset_d1;
integer j=0;

always@(posedge clk)
begin
rd_addr_valid = 1'b0;
if(valid)
begin
case(dat[55:54])
 2'b00:
   begin
   reset = 1'b0;
   end
 2'b10:
   begin
   rd_address = dat[47:16];
   rd_addr_valid = 1'b1;
   end
 2'b01:
  begin
  i_wr_en = 1'b1;
  inst = dat[47:16];
  end
 2'b11:
  reset = 1'b1;
 
endcase 
end
end

always@(posedge clk)
begin
reset_d <= reset;
reset_d1 <= reset_d;
reset_pulse1 <= reset_d &! reset_d1;
end

always@(posedge clk)
begin

if(valid & (dat[55:54] == 2'b01))
    if(j==0)
    begin
        wr_address=0;
        j=1;
    end
    else
        begin
            wr_address = wr_address + 1'b1;
        end
else if(dat[55:54]==2'b00)
begin
    wr_address = 0;
end

end




endmodule
