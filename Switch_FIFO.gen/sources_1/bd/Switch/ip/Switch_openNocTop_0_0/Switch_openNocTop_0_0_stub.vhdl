-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Tue Dec 27 16:16:41 2022
-- Host        : DESKTOP-H1H088Q running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               e:/FINAL_switch/Switch_FIFO/Switch_FIFO.gen/sources_1/bd/Switch/ip/Switch_openNocTop_0_0/Switch_openNocTop_0_0_stub.vhdl
-- Design      : Switch_openNocTop_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7z020clg400-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Switch_openNocTop_0_0 is
  Port ( 
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    i_packet_data : in STD_LOGIC_VECTOR ( 55 downto 0 );
    i_packet_ready : in STD_LOGIC;
    i_packet_valid : in STD_LOGIC;
    o_packet_ready : out STD_LOGIC;
    o_packet_valid : out STD_LOGIC;
    o_packet_data : out STD_LOGIC_VECTOR ( 55 downto 0 )
  );

end Switch_openNocTop_0_0;

architecture stub of Switch_openNocTop_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk,rstn,i_packet_data[55:0],i_packet_ready,i_packet_valid,o_packet_ready,o_packet_valid,o_packet_data[55:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "openNocTop,Vivado 2020.2";
begin
end;
