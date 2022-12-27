// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue Dec 27 16:16:41 2022
// Host        : DESKTOP-H1H088Q running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               e:/FINAL_switch/Switch_FIFO/Switch_FIFO.gen/sources_1/bd/Switch/ip/Switch_openNocTop_0_0/Switch_openNocTop_0_0_stub.v
// Design      : Switch_openNocTop_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "openNocTop,Vivado 2020.2" *)
module Switch_openNocTop_0_0(clk, rstn, i_packet_data, i_packet_ready, 
  i_packet_valid, o_packet_ready, o_packet_valid, o_packet_data)
/* synthesis syn_black_box black_box_pad_pin="clk,rstn,i_packet_data[55:0],i_packet_ready,i_packet_valid,o_packet_ready,o_packet_valid,o_packet_data[55:0]" */;
  input clk;
  input rstn;
  input [55:0]i_packet_data;
  input i_packet_ready;
  input i_packet_valid;
  output o_packet_ready;
  output o_packet_valid;
  output [55:0]o_packet_data;
endmodule
