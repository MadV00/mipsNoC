`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.12.2022 16:43:56
// Design Name: 
// Module Name: switch_noc_tb
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

`timescale 1ns/1ns
module switch_noc_tb(

    );
    
integer i = 0;
integer j=0;
integer fd;
integer k=0;


reg [55:0] memory [0:127];
    
reg clk;
reg rstn;
reg [55:0] i_packet_data;
reg i_packet_ready;
reg i_packet_valid;
wire o_packet_ready;
wire o_packet_valid;
wire [55:0] o_packet_data;
reg [3:0] r_valid_pe;
reg [223:0] r_data_pe;
wire [3:0] r_ready_pe;
wire [3:0] w_valid_pe;
reg [3:0] w_ready_pe;
wire [223:0] w_data_pe;

 initial begin
        clk=0;
    end

    always #50 clk= ~ clk;

openNocTop dut
(
clk,
rstn,
i_packet_data,
i_packet_ready,
i_packet_valid,
o_packet_ready,
o_packet_valid,
o_packet_data
);

initial begin

    i_packet_valid=1'b0;
    
    //ALL RESET
    rstn = 1'b0;
    #1000;

    // REMOVING RESET
    rstn = 1'b1;
    #1000;
    
        $readmemb("C:/Users/JEMIN MEHTA/Desktop/4,1/SOP_VIPIN_SIR/input_56.txt", memory);
    
    for(i=0;i<=35;i=i+1)
    begin
        @(posedge clk);
        i_packet_ready=1'b1;
        //$display("done2");
        i_packet_data <= memory[i]; 
        i_packet_valid <= 1'b1;
        
        if(i_packet_data == 56'b00000000000000000000000000000000000000000000000000000000 )
        begin
            $strobe("00 packet time=%0t input=0x%0b valid=%b", $time,i_packet_data, i_packet_valid);
        end
        
        else if(i_packet_data == 56'b00000000000000000000000000000000000000000000000100000000 )
        begin
            $strobe("01 packet time=%0t input=0x%0b valid=%b", $time,i_packet_data, i_packet_valid);
        end
        
        else if(i_packet_data == 56'b00000000000000000000000000000000000000000000000000000001 )
        begin
            $strobe("10 packet time=%0t input=0x%0b valid=%b", $time,i_packet_data, i_packet_valid);
        end
        
        else if(i_packet_data == 56'b00000000000000000000000000000000000000000000000100000001 )
        begin
            $strobe("11 packet time=%0t input=0x%0b valid=%b", $time,i_packet_data, i_packet_valid);
        end

        $monitor("time=%0t output=0x%0b valid=%b", $time,o_packet_data,o_packet_valid);
        
        
        while(j==0)
        begin
            @(posedge clk);
            if(o_packet_ready)
            begin
                
                //$display("done3");
                //@(posedge clk);
               // @(posedge clk);
                //@(posedge clk);
                i_packet_valid <= 1'b0;

                j=j+1;
            end
        end
        
        j=0;
        /*
        @(o_valid_pe);
        if(i_packet_data == 56'b11000000000000000000000000000000000000000000000100000001)
            #6000;
            */
        //$display("done");
    end
end    
















endmodule
