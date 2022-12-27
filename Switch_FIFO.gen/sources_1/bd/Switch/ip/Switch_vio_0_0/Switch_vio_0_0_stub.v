// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sat Dec 24 11:56:14 2022
// Host        : Jemin-2021 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {c:/Users/JEMIN
//               MEHTA/Desktop/4,1/SOP_VIPIN_SIR/Switch_FIFO/Switch_FIFO.gen/sources_1/bd/Switch/ip/Switch_vio_0_0/Switch_vio_0_0_stub.v}
// Design      : Switch_vio_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "vio,Vivado 2020.2" *)
module Switch_vio_0_0(clk, probe_out0)
/* synthesis syn_black_box black_box_pad_pin="clk,probe_out0[0:0]" */;
  input clk;
  output [0:0]probe_out0;
endmodule
