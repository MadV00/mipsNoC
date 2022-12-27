`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.09.2022 15:09:55
// Design Name: 
// Module Name: switch
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


module switch #(parameter x_coord = 8'b00000100, y_coord = 8'b00000100, X = 2, Y = 2, data_width = 32, x_size = 8, y_size = 8, total_width = 50)
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
input i_ready_r,
input i_ready_t,
input i_ready_l,
input i_ready_pe,
input i_ready_b,
input rstn,
output o_valid_r,
output o_valid_t,
output o_valid_b,
output o_valid_pe,
output o_valid_l,
output o_ready_r,
output o_ready_t,
output o_ready_l,
output o_ready_b,
output o_ready_pe,
output [55:0] o_data_r,    
output [55:0] o_data_l,
output [55:0] o_data_t,
output [55:0] o_data_b,
output [55:0] o_data_pe
);

wire ii_valid_r;
wire ii_valid_t;
wire ii_valid_l;
wire ii_valid_pe;
wire ii_valid_b;
wire oo_ready_r;
wire oo_ready_t;
wire oo_ready_l;
wire oo_ready_pe;
wire oo_ready_b;
reg oo_valid_r;
reg oo_valid_t;
reg oo_valid_b;
reg oo_valid_pe;
reg oo_valid_l;
reg ii_ready_r;
reg ii_ready_t;
reg ii_ready_l;
reg ii_ready_b;
reg ii_ready_pe;
wire [55:0] ii_data_r;
wire [55:0] ii_data_l;
wire [55:0] ii_data_t;
wire [55:0] ii_data_b;
wire [55:0] ii_data_pe;
reg [55:0] oo_data_r;     
reg [55:0] oo_data_l;
reg [55:0] oo_data_t;
reg [55:0] oo_data_b;
reg [55:0] oo_data_pe;
reg [1:0] state; 
reg [2:0] fifocount;
wire [4:0] ii_valid;
wire [4:0] ii_ready;  
wire [279:0] ii_data;
reg [2:0] i;
reg [2:0] j;
integer pos=0;

initial
begin
i = 3'b000;
j = 3'b000;

end

//assign ii_valid_r = 0;
//assign ii_valid_l = 0;
//assign ii_valid_b = 0;
//assign ii_valid_t = 0;
//assign ii_valid_pe = 0;
//assign oo_ready_r = 0;
//assign oo_ready_t = 0;
//assign oo_ready_b = 0;
//assign oo_ready_l = 0;
//assign oo_ready_pe = 0;

 

assign ii_valid = {ii_valid_r,ii_valid_t,ii_valid_l,ii_valid_pe,ii_valid_b};
assign ii_data = {ii_data_r,ii_data_t,ii_data_l,ii_data_pe,ii_data_b};
assign ii_ready = {ii_ready_r,ii_ready_t,ii_ready_l,ii_ready_pe,ii_ready_b};


localparam IDLE =2'b00,
           ASSIGN=2'b01,
           SEND =2'b10;
           
initial 
state <= IDLE;  


axis_data_fifo_0 i_fifo_r (
  .s_axis_aresetn(rstn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(i_valid_r),    // input wire s_axis_tvalid
  .s_axis_tready(o_ready_r),    // output wire s_axis_tready
  .s_axis_tdata(i_data_r),      // input wire [55 : 0] s_axis_tdata
  .m_axis_tvalid(ii_valid_r),    // output wire m_axis_tvalid
  .m_axis_tready(ii_ready_r),    // input wire m_axis_tready
  .m_axis_tdata(ii_data_r)      // output wire [55 : 0] m_axis_tdata
);

axis_data_fifo_0 i_fifo_l (
  .s_axis_aresetn(rstn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(i_valid_l),    // input wire s_axis_tvalid
  .s_axis_tready(o_ready_l),    // output wire s_axis_tready
  .s_axis_tdata(i_data_l),      // input wire [55 : 0] s_axis_tdata
  .m_axis_tvalid(ii_valid_l),    // output wire m_axis_tvalid
  .m_axis_tready(ii_ready_l),    // input wire m_axis_tready
  .m_axis_tdata(ii_data_l)      // output wire [55 : 0] m_axis_tdata
);

axis_data_fifo_0 i_fifo_t (
  .s_axis_aresetn(rstn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(i_valid_t),    // input wire s_axis_tvalid
  .s_axis_tready(o_ready_t),    // output wire s_axis_tready
  .s_axis_tdata(i_data_t),      // input wire [55 : 0] s_axis_tdata
  .m_axis_tvalid(ii_valid_t),    // output wire m_axis_tvalid
  .m_axis_tready(ii_ready_t),    // input wire m_axis_tready
  .m_axis_tdata(ii_data_t)      // output wire [55 : 0] m_axis_tdata
);

axis_data_fifo_0 i_fifo_b (
  .s_axis_aresetn(rstn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(i_valid_b),    // input wire s_axis_tvalid
  .s_axis_tready(o_ready_b),    // output wire s_axis_tready
  .s_axis_tdata(i_data_b),      // input wire [55 : 0] s_axis_tdata
  .m_axis_tvalid(ii_valid_b),    // output wire m_axis_tvalid
  .m_axis_tready(ii_ready_b),    // input wire m_axis_tready
  .m_axis_tdata(ii_data_b)      // output wire [55 : 0] m_axis_tdata
);

axis_data_fifo_0 i_fifo_pe (
  .s_axis_aresetn(rstn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(i_valid_pe),    // input wire s_axis_tvalid
  .s_axis_tready(o_ready_pe),    // output wire s_axis_tready
  .s_axis_tdata(i_data_pe),      // input wire [55 : 0] s_axis_tdata
  .m_axis_tvalid(ii_valid_pe),    // output wire m_axis_tvalid
  .m_axis_tready(ii_ready_pe),    // input wire m_axis_tready
  .m_axis_tdata(ii_data_pe)      // output wire [55 : 0] m_axis_tdata
);

axis_data_fifo_0 o_fifo_r (
  .s_axis_aresetn(rstn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(oo_valid_r),    // input wire s_axis_tvalid
  .s_axis_tready(oo_ready_r),    // output wire s_axis_tready
  .s_axis_tdata(oo_data_r),      // input wire [55 : 0] s_axis_tdata
  .m_axis_tvalid(o_valid_r),    // output wire m_axis_tvalid
  .m_axis_tready(i_ready_r),    // input wire m_axis_tready
  .m_axis_tdata(o_data_r)      // output wire [55 : 0] m_axis_tdata
);

axis_data_fifo_0 o_fifo_l (
  .s_axis_aresetn(rstn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(oo_valid_l),    // input wire s_axis_tvalid
  .s_axis_tready(oo_ready_l),    // output wire s_axis_tready
  .s_axis_tdata(oo_data_l),      // input wire [55 : 0] s_axis_tdata
  .m_axis_tvalid(o_valid_l),    // output wire m_axis_tvalid
  .m_axis_tready(i_ready_l),    // input wire m_axis_tready
  .m_axis_tdata(o_data_l)      // output wire [55 : 0] m_axis_tdata
);

axis_data_fifo_0 o_fifo_t (
  .s_axis_aresetn(rstn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(oo_valid_t),    // input wire s_axis_tvalid
  .s_axis_tready(oo_ready_t),    // output wire s_axis_tready
  .s_axis_tdata(oo_data_t),      // input wire [55 : 0] s_axis_tdata
  .m_axis_tvalid(o_valid_t),    // output wire m_axis_tvalid
  .m_axis_tready(i_ready_t),    // input wire m_axis_tready
  .m_axis_tdata(o_data_t)      // output wire [55 : 0] m_axis_tdata
);

axis_data_fifo_0 o_fifo_b (
  .s_axis_aresetn(rstn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(oo_valid_b),    // input wire s_axis_tvalid
  .s_axis_tready(oo_ready_b),    // output wire s_axis_tready
  .s_axis_tdata(oo_data_b),      // input wire [55 : 0] s_axis_tdata
  .m_axis_tvalid(o_valid_b),    // output wire m_axis_tvalid
  .m_axis_tready(i_ready_b),    // input wire m_axis_tready
  .m_axis_tdata(o_data_b)      // output wire [55 : 0] m_axis_tdata
);

axis_data_fifo_0 o_fifo_pe (
  .s_axis_aresetn(rstn),  // input wire s_axis_aresetn
  .s_axis_aclk(clk),        // input wire s_axis_aclk
  .s_axis_tvalid(oo_valid_pe),    // input wire s_axis_tvalid
  .s_axis_tready(oo_ready_pe),    // output wire s_axis_tready
  .s_axis_tdata(oo_data_pe),      // input wire [55 : 0] s_axis_tdata
  .m_axis_tvalid(o_valid_pe),    // output wire m_axis_tvalid
  .m_axis_tready(1'b1),   // input wire m_axis_tready
  .m_axis_tdata(o_data_pe)      // output wire [55 : 0] m_axis_tdata
);  
  
initial
begin
ii_ready_r <= 1'b0;
ii_ready_t <= 1'b0;
ii_ready_l <= 1'b0;
ii_ready_b <= 1'b0;
ii_ready_pe <= 1'b0;
oo_valid_t <= 1'b0;
oo_valid_l <= 1'b0;
oo_valid_r <= 1'b0;
oo_valid_b <= 1'b0;
oo_valid_pe <= 1'b0;
end     

         
always@(posedge clk)
begin
case(state)
 IDLE:
       begin
       begin
       if(ii_valid[4-i])
       begin
       case(i)
       3'd0: ii_ready_r <= 1'b1;
       3'd1: ii_ready_t <= 1'b1;
       3'd2: ii_ready_l <= 1'b1;
       3'd3: ii_ready_pe <= 1'b1;
       3'd4: ii_ready_b <= 1'b1;
       endcase
       fifocount <= 4-i;
       state <= ASSIGN;
       end
       i <= i+1;
       if(i == 3'b101)
       i <= 0;
       
       
       
      
      
  end
  end
 ASSIGN:
  begin
      ii_ready_r <= 1'b0;
      ii_ready_t <= 1'b0;
      ii_ready_l <= 1'b0;
      ii_ready_pe <= 1'b0;
      ii_ready_b <= 1'b0;
   begin
       if(ii_data[56*fifocount +: 8]==x_coord && ii_data[56*fifocount+8 +: 8]==y_coord)
            begin
            
            if (ii_data[56*fifocount+48 +: 2]==2'b11)
            begin
            oo_data_l <= ii_data[56*fifocount +: 56];
            pos=1;
            j = 3'b011;
            oo_valid_l <= 1'b1;
            
            state <= SEND;
                    /* @(posedge clk);
                     
                     
                   oo_valid_l <= 1'b0;
                    state <= IDLE;
                    j =0; */          
            end
            else
            begin
            pos=2;
            oo_data_pe <= ii_data[56*fifocount +: 56];
//           oo_data_pe <= 56'b11111111000000000000000000000000000000000000000000000000;
            oo_valid_pe <= 1'b1;
            j= 3'b001;
            state <= SEND;
            end
            end
       else if(ii_data[56*fifocount +: 8]>x_coord)
            begin
            state <= SEND;
            oo_data_r <= ii_data[56*fifocount +: 56];
            oo_valid_r <= 1'b1;
            j = 3'b010;
            end
       else if(ii_data[56*fifocount +: 8]<x_coord)
            begin
            state <= SEND;
            oo_data_l <= ii_data[56*fifocount +: 56];
            oo_valid_l <= 1'b1;
            j = 3'b011;
            end
       else if(ii_data[56*fifocount +: 8]==x_coord && ii_data[56*fifocount+8 +: 8]>y_coord)
            begin
            state <= SEND;
            oo_data_t <= ii_data[56*fifocount +: 56];
            oo_valid_t <= 1'b1;
            j = 3'b100;
            end
       else if(ii_data[56*fifocount +: 8]==x_coord && ii_data[56*fifocount+8 +: 8]<y_coord)
            begin
            state <= SEND;
            oo_data_b <= ii_data[56*fifocount +: 56];
            oo_valid_b <= 1'b1;
            j = 3'b101;
            end
   end
  state <= SEND;  
  end
  SEND:  
    begin
       case(j)
       1'b1: 
       begin
       if(oo_ready_pe)
       oo_valid_pe <= 1'b0;
       state <= IDLE;
       j = 0;
       end
       2'b10: 
       begin
       if(oo_ready_r)
       oo_valid_r <= 1'b0;
       state <= IDLE;
       j =0;
       end
       2'b11: 
       begin
       if(oo_ready_l)
       oo_valid_l <= 1'b0;
       state <= IDLE;
       j =0;
       end
       3'b100: 
       begin
       if(oo_ready_t)
       oo_valid_t <= 1'b0;
       state <= IDLE;
       j = 0;
       end
       3'b101: 
       begin
       if(oo_ready_b)
       oo_valid_b <= 1'b0;
       state <= IDLE;
       j = 0;
       end
       endcase 
    end     

endcase 

end



endmodule
