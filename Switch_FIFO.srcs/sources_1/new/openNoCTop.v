`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2022 14:52:55
// Design Name: 
// Module Name: openNoCTop
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


module openNocTop #(parameter X=2,Y=2,data_width=32,pkt_no_field_size=8,x_size=8,y_size=8,total_width=(x_size+y_size+data_width+pkt_no_field_size),if_width=total_width*X*Y)
(
input wire clk,
input wire rstn,
input [total_width-1:0] i_packet_data,
input i_packet_ready,
input i_packet_valid,
output o_packet_ready,
output o_packet_valid,
output [total_width-1:0] o_packet_data

);


wire [(X*Y)-1:0] r_valid_pe;
wire [if_width-1:0] r_data_pe;
wire [(X*Y)-1:0] r_ready_pe;
wire [(X*Y)-1:0] w_valid_pe;
wire [(X*Y)-1:0] w_ready_pe;
wire [if_width-1:0] w_data_pe;
wire  r_ready_r[X*Y-1:0];//reqd
wire  r_ready_t[X*Y-1:0];//reqd
wire  r_ready_l[X*Y-1:0];//needed
wire  r_ready_b[X*Y-1:0];//needed
wire  r_valid_l[X*Y-1:0];
wire  r_valid_b[X*Y-1:0];
wire  r_valid_t[X*Y-1:0];
wire  r_valid_r[X*Y-1:0];
wire  w_ready_r[X*Y-1:0];
wire  w_ready_t[X*Y-1:0];
wire  w_ready_l[X*Y-1:0];
wire  w_ready_b[X*Y-1:0];
wire  w_valid_r[X*Y-1:0];//reqd
wire  w_valid_t[X*Y-1:0];//reqd
wire  w_valid_l[X*Y-1:0];//needed
wire  w_valid_b[X*Y-1:0];//needed


wire [total_width-1:0]  w_data_r[X*Y-1:0]; //reqd
wire [total_width-1:0]  w_data_t[X*Y-1:0]; //reqd
wire [total_width-1:0]  w_data_l[X*Y-1:0]; //needed
wire [total_width-1:0]  w_data_b[X*Y-1:0]; //needed
wire [total_width-1:0]  r_data_r[X*Y-1:0];
wire [total_width-1:0]  r_data_t[X*Y-1:0];
wire [total_width-1:0]  r_data_l[X*Y-1:0];
wire [total_width-1:0]  r_data_b[X*Y-1:0];



generate
genvar x, y; 
for (x=0;x<X;x=x+1) begin:xs
    for (y=0; y<Y; y=y+1) begin:ys
        if(x==0 & y==0)
        begin: instnce
              switch_network_mips #(.x_coord(x),.y_coord(y),.X(X),.Y(Y),.data_width(data_width), .x_size(x_size), .y_size(y_size),.total_width(total_width))
                nbyn_instance(
                    .clk(clk), 
                    .rstn(rstn),     
                    .i_ready_r(r_ready_r[(y*X)+x]),   ////  
                    .i_ready_t(r_ready_t[(y*X)+x]),//
					.i_ready_l(i_packet_ready),
					.i_ready_b(),
					.i_ready_pe(w_ready_pe[x+X*y:x+X*y]),
                    .i_valid_l(i_packet_valid),//                          
                    .i_valid_b(1'b0),///
					.i_valid_t(w_valid_b[((y+1)*X)+x]), //Valid from Above
					.i_valid_r(w_valid_l[(y*X)+x+1]),  //Valid from Right
                    .i_valid_pe(),
                    .o_ready_l(o_packet_ready),    ////                      
                    .o_ready_b(),////
					.o_ready_t(r_ready_b[((y+1)*X)+x]),  //Ready from Above
					.o_ready_r(r_ready_l[(y*X)+x+1]),  //Ready from Right
                    .o_ready_pe(r_ready_pe[x+X*y:x+X*y]),                     
                    .o_valid_r(w_valid_r[y*X+x]),//                          
                    .o_valid_t(w_valid_t[y*X+x]),//
					.o_valid_b(),
					.o_valid_l(o_packet_valid),
                    .o_valid_pe(w_valid_pe[x+X*y:x+X*y]),
                    .i_data_l(i_packet_data),    //Data from packetizer         
                    .i_data_b(24'b0),//
					.i_data_r(w_data_l[(y*X)+x+1]),    //Data from Right
					.i_data_t(w_data_b[(y+1)*X+x]), //Data from Above
					.i_data_pe(),
                    .o_data_r(w_data_r[y*X+x]),   //
                    .o_data_t(w_data_t[y*X+x]),   //
					.o_data_l(o_packet_data),
					.o_data_b(),
                    .o_data_pe(w_data_pe[(total_width*x)+(total_width*X*y)+:total_width])
                    );
         end

        else if(y == 0 & x != X-1)
        begin: instnce
            switch_network_mips #(.x_coord(x),.y_coord(y),.X(X),.Y(Y),.data_width(data_width), .x_size(x_size), .y_size(y_size),.total_width(total_width))
                nbyn_instance(         
                    .clk(clk), 
                    .rstn(rstn),     
                    .i_ready_r(r_ready_r[(y*X)+x]),         //
                    .i_ready_t(r_ready_t[(y*X)+x]),         //
					.i_ready_l(r_ready_l[(y*X)+x]),
					.i_ready_b(),
					.i_ready_pe(w_ready_pe[x+X*y:x+X*y]),
                    .i_valid_l(w_valid_r[(y*X)+x-1]),       //                  
                    .i_valid_b(1'b0),
					.i_valid_t(w_valid_b[((y+1)*X)+x]),     //Valid from Above
					.i_valid_r(w_valid_l[(y*X)+x+1]),       //Valid from Right
                    .i_valid_pe(),
                    .o_ready_l(r_ready_r[(y*X)+x-1]),       //                  
                    .o_ready_b(),
					.o_ready_t(r_ready_b[((y+1)*X)+x]),     //Ready from Above
					.o_ready_r(r_ready_l[(y*X)+x+1]),       //Ready from Right
                    .o_ready_pe(r_ready_pe[x+X*y:x+X*y]),
                    .o_valid_r(w_valid_r[(y*X)+x]),                      
                    .o_valid_t(w_valid_t[(y*X)+x]),
					.o_valid_b(),
					.o_valid_l(w_valid_l[(y*X)+x])  ,    
                    .o_valid_pe(w_valid_pe[x+X*y:x+X*y]),  
                    .i_data_l(w_data_r[(y*X)+x-1]),        //Data from Left        
                    .i_data_b(24'b0),                //
					.i_data_r(w_data_l[(y*X)+x+1]),        //Data from Right
					.i_data_t(w_data_b[(y+1)*X+x]),        //Data from Above					
                    .i_data_pe(),
                    .o_data_r(w_data_r[(y*X)+x]),
                    .o_data_t(w_data_t[(y*X)+x]),
					.o_data_l(w_data_l[(y*X)+x]),
					.o_data_b(),
                    .o_data_pe(w_data_pe[(total_width*x)+(total_width*X*y)+:total_width]));
        end

        else if(x == 0 & y != Y-1)
        begin: instnce
            switch_network_mips #(.x_coord(x),.y_coord(y),.X(X),.Y(Y),.data_width(data_width), .x_size(x_size), .y_size(y_size),.total_width(total_width))
                nbyn_instance(
				    .clk(clk), 
                    .rstn(rstn),     
                    .i_ready_r(r_ready_r[(y*X)+x]),         //
                    .i_ready_t(r_ready_t[(y*X)+x]),         //
					.i_ready_l(),
					.i_ready_b(r_ready_b[(y*X)+x]),
					.i_ready_pe(w_ready_pe[x+X*y:x+X*y]),
                    .i_valid_l(1'b0),               //                  
                    .i_valid_b(w_valid_t[((y-1)*X)+x]),     //Valid from below
					.i_valid_t(w_valid_b[((y+1)*X)+x]),      //Valid from Above
					.i_valid_r(w_valid_l[(y*X)+x+1]),        //Valid from Right
                    .i_valid_pe(),
                    .o_ready_l(),               //                  
                    .o_ready_b(r_ready_t[((y-1)*X)+x]),     //Ready from below
					.o_ready_t(r_ready_b[((y+1)*X)+x]),      //Ready from Above
					.o_ready_r(r_ready_l[(y*X)+x+1]),      //Ready from Right
                    .o_ready_pe(r_ready_pe[x+X*y:x+X*y]),
                    .o_valid_r(w_valid_r[(y*X)+x]),                      
                    .o_valid_t(w_valid_t[(y*X)+x]),
					.o_valid_b(w_valid_b[(y*X)+x]),
					.o_valid_l() ,     
                    .o_valid_pe(w_valid_pe[x+X*y:x+X*y]),  
                    .i_data_l(24'b0),                 //Data from Left        
                    .i_data_b(w_data_t[(y-1)*X+x]),         //
					.i_data_r(w_data_l[(y*X)+x+1]),         //Data from Right
					.i_data_t(w_data_b[(y+1)*X+x]),           //Data from Above					
                    .i_data_pe(),
                    .o_data_r(w_data_r[(y*X)+x]),
                    .o_data_t(w_data_t[(y*X)+x]),
					.o_data_l(),
					.o_data_b(w_data_b[(y*X)+x]),
                    .o_data_pe(w_data_pe[(total_width*x)+(total_width*X*y)+:total_width]));
                    
        end         

        else if(y == Y-1 & (x != 0 & x != X-1))
         begin: instnce
            switch_network_mips #(.x_coord(x),.y_coord(y),.X(X),.Y(Y),.data_width(data_width), .x_size(x_size), .y_size(y_size),.total_width(total_width))
                nbyn_instance(
				    .clk(clk), 
                    .rstn(rstn),     
                    .i_ready_r(r_ready_r[(y*X)+x]),         //
                    .i_ready_t(),               //
					.i_ready_l(r_ready_l[(y*X)+x]),
					.i_ready_b(r_ready_b[(y*X)+x]),
					.i_ready_pe(w_ready_pe[x+X*y:x+X*y]),
                    .i_valid_l(w_valid_r[(y*X)+x-1]),       //Valid from Left        
                    .i_valid_b(w_valid_t[((y-1)*X)+x]),     //Valid from below
					.i_valid_t(1'b0),               //Valid from Above
					.i_valid_r(w_valid_l[(y*X)+x+1]) ,      //Valid from Right
                    .i_valid_pe(),
                    .o_ready_l(r_ready_r[(y*X)+x-1]),       //Ready from Left                  
                    .o_ready_b(r_ready_t[((y-1)*X)+x]),      //Ready from below
					.o_ready_t(),               //Ready from Above
					.o_ready_r(r_ready_l[(y*X)+x+1]) ,      //Ready from Right
                    .o_ready_pe(r_ready_pe[x+X*y:x+X*y]),
                    .o_valid_r(w_valid_r[(y*X)+x]),                      
                    .o_valid_t(),
					.o_valid_b(w_valid_b[(y*X)+x]),
					.o_valid_l(w_valid_l[(y*X)+x]) ,     
                    .o_valid_pe(w_valid_pe[x+X*y:x+X*y]),  
                    .i_data_l(w_data_r[(y*X)+x-1]),         //Data from Left        
                    .i_data_b(w_data_t[(y-1)*X+x]),         //Data from Below
					.i_data_r(w_data_l[(y*X)+x+1]),         //Data from Right
					.i_data_t(24'b0),               //Data from Above					
                    .i_data_pe(),
                    .o_data_r(w_data_r[(y*X)+x]),
                    .o_data_t(),
					.o_data_l(w_data_l[(y*X)+x]),
					.o_data_b(w_data_b[(y*X)+x]),
                    .o_data_pe(w_data_pe[(total_width*x)+(total_width*X*y)+:total_width]));
                    
        end
			
		else if(x == X-1 & (y != Y-1 & y != 0))
         begin: instnce
            switch_network_mips #(.x_coord(x),.y_coord(y),.X(X),.Y(Y),.data_width(data_width), .x_size(x_size), .y_size(y_size),.total_width(total_width))
                nbyn_instance(
				    .clk(clk), 
                    .rstn(rstn),     
                    .i_ready_r(),                          //
                    .i_ready_t(r_ready_t[(y*X)+x]),         //
					.i_ready_l(r_ready_l[(y*X)+x]),         //
					.i_ready_b(r_ready_b[(y*X)+x]),         //
					.i_ready_pe(w_ready_pe[x+X*y:x+X*y]),
                    .i_valid_l(w_valid_r[(y*X)+x-1]),       //Valid from Left        
                    .i_valid_b(w_valid_t[((y-1)*X)+x]),     //Valid from below
					.i_valid_t(w_valid_b[((y+1)*X)+x]),     //Valid from Above
					.i_valid_r(1'b0),                          //Valid from Right
                    .i_valid_pe(),
                    .o_ready_l(r_ready_r[(y*X)+x-1]),       //Ready from Left                  
                    .o_ready_b(r_ready_t[((y-1)*X)+x]),      //Ready from below
					.o_ready_t(r_ready_b[((y+1)*X)+x]),      //Ready from Above
					.o_ready_r() ,              //Ready from Right
                    .o_ready_pe(r_ready_pe[x+X*y:x+X*y]),
                    .o_valid_r(),                      
                    .o_valid_t(w_valid_t[(y*X)+x]),
					.o_valid_b(w_valid_b[(y*X)+x]),
					.o_valid_l(w_valid_l[(y*X)+x]) ,     
                    .o_valid_pe(w_valid_pe[x+X*y:x+X*y]),  
                    .i_data_l(w_data_r[(y*X)+x-1]),         //Data from Left        
                    .i_data_b(w_data_t[(y-1)*X+x]),         //Data from Below
					.i_data_r(24'b0),                 //Data from Right
					.i_data_t(w_data_b[(y+1)*X+x]),       //Data from Above					
                    .i_data_pe(),
                    .o_data_r(),
                    .o_data_t(w_data_t[(y*X)+x]),
					.o_data_l(w_data_l[(y*X)+x]),
					.o_data_b(w_data_b[(y*X)+x]),
                    .o_data_pe(w_data_pe[(total_width*x)+(total_width*X*y)+:total_width]));
                    
        end
		
        else if(x == 0 & y == Y-1)
         begin: instnce
            switch_network_mips #(.x_coord(x),.y_coord(y),.X(X),.Y(Y),.data_width(data_width), .x_size(x_size), .y_size(y_size),.total_width(total_width))
                nbyn_instance(
				    .clk(clk), 
                    .rstn(rstn),     
                    .i_ready_r(r_ready_r[(y*X)+x]),         //
                    .i_ready_t(),               //
					.i_ready_l(),
					.i_ready_b(r_ready_b[(y*X)+x]),
					.i_ready_pe(w_ready_pe[x+X*y:x+X*y]),
                    .i_valid_l(1'b0),                          //Valid from Left        
                    .i_valid_b(w_valid_t[((y-1)*X)+x]),     //Valid from below
					.i_valid_t(1'b0),                          //Valid from Above
					.i_valid_r(w_valid_l[(y*X)+x+1]) ,      //Valid from Right
                    .i_valid_pe(),
                    .o_ready_l(),                           //Ready from Left                  
                    .o_ready_b(r_ready_t[((y-1)*X)+x]),     //Ready from below
					.o_ready_t(),                           //Ready from Above
					.o_ready_r(r_ready_l[(y*X)+x+1]) ,      //Ready from Right
                    .o_ready_pe(r_ready_pe[x+X*y:x+X*y]),
                    .o_valid_r(w_valid_r[(y*X)+x]),                      
                    .o_valid_t(),
					.o_valid_b(w_valid_b[(y*X)+x]),
					.o_valid_l() ,     
                    .o_valid_pe(w_valid_pe[x+X*y:x+X*y]),  
                    .i_data_l(24'b0),                           //Data from Left        
                    .i_data_b(w_data_t[(y-1)*X+x]),         //Data from Below
					.i_data_r(w_data_l[(y*X)+x+1]),         //Data from Right
					.i_data_t(24'b0),                           //Data from Above					
                    .i_data_pe(),
                    .o_data_r(w_data_r[(y*X)+x]),
                    .o_data_t(),
					.o_data_l(),
					.o_data_b(w_data_b[(y*X)+x]),
                    .o_data_pe(w_data_pe[(total_width*x)+(total_width*X*y)+:total_width]));
                    
        end	
        
        else if(y == 0 & x == X-1)
         begin: instnce
            switch_network_mips #(.x_coord(x),.y_coord(y),.X(X),.Y(Y),.data_width(data_width), .x_size(x_size), .y_size(y_size),.total_width(total_width))
                nbyn_instance(
				    .clk(clk), 
                    .rstn(rstn),     
                    .i_ready_r(),               //
                    .i_ready_t(r_ready_t[(y*X)+x]),         //
					.i_ready_l(r_ready_l[(y*X)+x]),
					.i_ready_b(),
					.i_ready_pe(w_ready_pe[x+X*y:x+X*y]),
                    .i_valid_l(w_valid_r[(y*X)+x-1]),        //Valid from Left        
                    .i_valid_b(1'b0),                           //Valid from below
					.i_valid_t(w_valid_b[((y+1)*X)+x]),      //Valid from Above
					.i_valid_r(1'b0) ,                          //Valid from Right
                    .i_valid_pe(),
                    .o_ready_l(r_ready_r[(y*X)+x-1]),       //Ready from Left                  
                    .o_ready_b(),                           //Ready from below
					.o_ready_t(r_ready_b[((y+1)*X)+x]),     //Ready from Above
					.o_ready_r() ,                          //Ready from Right
                    .o_ready_pe(r_ready_pe[x+X*y:x+X*y]),
                    .o_valid_r(),                      
                    .o_valid_t(w_valid_t[(y*X)+x]),
					.o_valid_b(),
					.o_valid_l(w_valid_l[(y*X)+x]) ,     
                    .o_valid_pe(w_valid_pe[x+X*y:x+X*y]),  
                    .i_data_l(w_data_r[(y*X)+x-1]),         //Data from Left        
                    .i_data_b(24'b0),                           //Data from Below
					.i_data_r(24'b0),                 //Data from Right
					.i_data_t(w_data_b[(y+1)*X+x]  ),       //Data from Above					
                    .i_data_pe(),
                    .o_data_r(),
                    .o_data_t(w_data_t[(y*X)+x]),
					.o_data_l(w_data_l[(y*X)+x]),
					.o_data_b(),
                    .o_data_pe(w_data_pe[(total_width*x)+(total_width*X*y)+:total_width]));
                    
        end	

        else if(x == X-1 & y == Y-1)
         begin: instnce
            switch_network_mips #(.x_coord(x),.y_coord(y),.X(X),.Y(Y),.data_width(data_width), .x_size(x_size), .y_size(y_size),.total_width(total_width))
                nbyn_instance(
				    .clk(clk), 
                    .rstn(rstn),     
                    .i_ready_r(),         //
                    .i_ready_t(),               //
					.i_ready_l(r_ready_l[(y*X)+x]),
					.i_ready_b(r_ready_b[(y*X)+x]),
					.i_ready_pe(w_ready_pe[x+X*y:x+X*y]),
                    .i_valid_l(w_valid_r[(y*X)+x-1]),       //Valid from Left        
                    .i_valid_b(w_valid_t[((y-1)*X)+x]),     //Valid from below
					.i_valid_t(1'b0),                          //Valid from Above
					.i_valid_r(1'b0) ,                         //Valid from Right
                    .i_valid_pe(),
                    .o_ready_l(r_ready_r[(y*X)+x-1]),       //Ready from Left                  
                    .o_ready_b(r_ready_t[((y-1)*X)+x]),     //Ready from below
					.o_ready_t(),                           //Ready from Above
					.o_ready_r() ,                          //Ready from Right
                    .o_ready_pe(r_ready_pe[x+X*y:x+X*y]),
                    .o_valid_r(w_valid_r[(y*X)+x]),                      
                    .o_valid_t(w_valid_t[(y*X)+x]),
					.o_valid_b(w_valid_b[(y*X)+x]),
					.o_valid_l(w_valid_l[(y*X)+x]) ,     
                    .o_valid_pe(w_valid_pe[x+X*y:x+X*y]),  
                    .i_data_l(w_data_r[(y*X)+x-1]),         //Data from Left        
                    .i_data_b(w_data_t[(y-1)*X+x]),         //Data from Below
					.i_data_r(24'b0),                           //Data from Right
					.i_data_t(24'b0),                           //Data from Above					
                    .i_data_pe(),
                    .o_data_r(),
                    .o_data_t(),
					.o_data_l(w_data_l[(y*X)+x]),
					.o_data_b(w_data_b[(y*X)+x]),
                    .o_data_pe(w_data_pe[(total_width*x)+(total_width*X*y)+:total_width]));
                    
        end		
			
		else
         begin: instnce
            switch_network_mips #(.x_coord(x),.y_coord(y),.X(X),.Y(Y),.data_width(data_width), .x_size(x_size), .y_size(y_size),.total_width(total_width))
                nbyn_instance(
				    .clk(clk), 
                    .rstn(rstn),     
                    .i_ready_r(r_ready_r[(y*X)+x]),         //
                    .i_ready_t(r_ready_t[(y*X)+x]),               //
					.i_ready_l(r_ready_l[(y*X)+x]),
					.i_ready_b(r_ready_b[(y*X)+x]),
					.i_ready_pe(w_ready_pe[x+X*y:x+X*y]),
                    .i_valid_l(w_valid_r[(y*X)+x-1]),       //Valid from Left        
                    .i_valid_b(w_valid_t[((y-1)*X)+x]),     //Valid from below
					.i_valid_t(w_valid_b[((y+1)*X)+x]),     //Valid from Above
					.i_valid_r(w_valid_l[(y*X)+x+1]) ,      //Valid from Right
                    .i_valid_pe(),
                    .o_ready_l(r_ready_r[(y*X)+x-1]),       //Ready from Left                  
                    .o_ready_b(r_ready_t[((y-1)*X)+x]),      //Ready from below
					.o_ready_t(r_ready_b[((y+1)*X)+x]),      //Ready from Above
					.o_ready_r(r_ready_l[(y*X)+x+1]) ,      //Ready from Right
                    .o_ready_pe(r_ready_pe[x+X*y:x+X*y]),
                    .o_valid_r(w_valid_r[(y*X)+x]),                      
                    .o_valid_t(w_valid_t[(y*X)+x]),
					.o_valid_b(w_valid_b[(y*X)+x]),
					.o_valid_l(w_valid_l[(y*X)+x]) ,     
                    .o_valid_pe(w_valid_pe[x+X*y:x+X*y]),  
                    .i_data_l(w_data_r[(y*X)+x-1]),         //Data from Left        
                    .i_data_b(w_data_t[(y-1)*X+x]),         //Data from Below
					.i_data_r(w_data_l[(y*X)+x+1]),         //Data from Right
					.i_data_t(w_data_b[(y+1)*X+x]  ),       //Data from Above					
                    .i_data_pe(),
                    .o_data_r(w_data_r[(y*X)+x]),
                    .o_data_t(w_data_t[(y*X)+x]),
					.o_data_l(w_data_l[(y*X)+x]),
					.o_data_b(w_data_b[(y*X)+x]),
                    .o_data_pe(w_data_pe[(total_width*x)+(total_width*X*y)+:total_width]));
                    
        end
    end
    end            
endgenerate 

endmodule
