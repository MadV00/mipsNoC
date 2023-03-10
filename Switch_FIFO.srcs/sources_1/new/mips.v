//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Sat Apr 30 55:06:54 2022
//Host        : Rohit-Notebook running 64-bit major release  (build 9200)
//Command     : generate_target mips.bd
//Design      : mips
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module DataPath_imp_19NSZCT
   (aluOp,
    ctrl,
    ctrl1,
    ctrl2,
    ctrl3,
    ctrl4,
    in_clock,
    instruction,
    inst,
    memWrite,
    reset,
    i_wr_en,
    wr_address,
    rd_address,
    rd_addr_valid,
    regWrEn,
    final_data,
    final_valid);
  input [2:0]aluOp;
  input ctrl;
  input ctrl1;
  input ctrl2;
  input [1:0]ctrl3;
  input ctrl4;
  input in_clock;
  input  [31:0] inst;
  output [31:0]instruction;
  input memWrite;
  input i_wr_en;
  input [31:0] wr_address;
  input [31:0] rd_address;
  input rd_addr_valid;
  input regWrEn;
  input reset;
  output final_valid;
  output [31:0] final_data;

  wire [31:0]RegFile_0_regRdData1;
  wire [31:0]RegFile_0_regRdData2;
  wire [31:0]adder_0_adderOut;
  wire [31:0]adder_1_adderOut;
  wire [2:0]aluOp_1;
  wire [31:0]alu_0_aluOut;
  wire alu_0_zeroFlag;
  wire andGate_0_bnec;
  wire [31:0]constantFour_dout;
  wire controlHazard_0_en;
  wire controlHazard_0_pcEn;
  wire ctrl1_1;
  wire ctrl2_1;
  wire [1:0]ctrl3_1;
  wire ctrl4_1;
  wire ctrl_1;
  wire [31:0]dataMemory_0_readData;
  wire [31:0]exPipeline_0_o_aluRes;
  wire exPipeline_0_o_branchEn;
  wire exPipeline_0_o_memToReg;
  wire exPipeline_0_o_memWrite;
  wire [4:0]exPipeline_0_o_rd;
  wire [31:0]exPipeline_0_o_rd_data2;
  wire [4:0]exPipeline_0_o_regWrAddr;
  wire exPipeline_0_o_regWrite;
  wire [4:0]exPipeline_0_o_rt;
  wire forwardUnit2_0_forwardC;
  wire [1:0]forwardingUnit_0_forwardA;
  wire [1:0]forwardingUnit_0_forwardB;
  wire i_clk_0_1;
  wire [2:0]idPipeline_0_o_aluOp;
  wire idPipeline_0_o_aluSrc;
  wire idPipeline_0_o_bneSrc;
  wire idPipeline_0_o_branchEn;
  wire idPipeline_0_o_memToReg;
  wire idPipeline_0_o_memWrite;
  wire [31:0]idPipeline_0_o_ogaddr;
  wire [5:0]idPipeline_0_o_opCode;
  wire [31:0]idPipeline_0_o_rd_data1;
  wire [31:0]idPipeline_0_o_rd_data2;
  wire idPipeline_0_o_regDst;
  wire idPipeline_0_o_regWrite;
  wire [4:0]idPipeline_0_o_rs;
  wire [31:0]idPipeline_0_o_signextend;
  wire [4:0]idPipeline_0_o_wrRegAddr1;
  wire [4:0]idPipeline_0_o_wrRegAddr2;
  wire [2:0]ifPipeline_0_o_aluOp;
  wire ifPipeline_0_o_aluSrc;
  wire ifPipeline_0_o_bneSrc;
  wire [31:0]ifPipeline_0_o_instr;
  wire ifPipeline_0_o_memToReg;
  wire ifPipeline_0_o_memWrite;
  wire [31:0]ifPipeline_0_o_ogaddr;
  wire [5:0]ifPipeline_0_o_opCode;
  wire ifPipeline_0_o_regDst;
  wire ifPipeline_0_o_regWrite;
  wire [31:0]instructionMemory_0_instruction;
  wire [31:0]jmpMod_0_JumpAddress;
  wire [31:0]memPipeline_0_o_aluRes;
  wire memPipeline_0_o_memToReg;
  wire [4:0]memPipeline_0_o_rd;
  wire [31:0]memPipeline_0_o_readData;
  wire [4:0]memPipeline_0_o_regWrAddr;
  wire memPipeline_0_o_regWrite;
  wire [4:0]memPipeline_0_o_rt;
  wire memWrite_1;
  wire [31:0]mux4_1_0_Mux_out;
  wire [31:0]mux4_1_1_Mux_out;
  wire [4:0]mux_0_muxOut;
  wire [31:0]mux_1_muxOut;
  wire [31:0]mux_2_muxOut;
  wire [31:0]mux_4_muxOut;
  wire [31:0]mux_5_muxOut;
  wire [31:0]mux_6_muxOut;
  wire [31:0]mux_7_muxOut;
  wire [31:0]mux_8_muxOut;
  wire [31:0]programCounter_0_pcOut;
  wire regFileForwarding_0_forwardD;
  wire regFileForwarding_0_forwardE;
  wire regWrEn_1;
  wire [31:0]shiftLeft_0_outData;
  wire [31:0]signExtern_0_outData;
  wire [0:0]xlconstant_1_dout;
  wire [4:0]xlslice_0_Dout;
  wire [4:0]xlslice_1_Dout;
  wire [4:0]xlslice_2_Dout;
  wire [15:0]xlslice_3_Dout;
  wire [3:0]xlslice_4_Dout;
  wire [25:0]xlslice_5_Dout;
  wire [5:0]xlslice_6_Dout;
  wire halt;

  assign aluOp_1 = aluOp[2:0];
  assign ctrl1_1 = ctrl1;
  assign ctrl2_1 = ctrl2;
  assign ctrl3_1 = ctrl3[1:0];
  assign ctrl4_1 = ctrl4;
  assign ctrl_1 = ctrl;
  assign i_clk_0_1 = in_clock;
  assign instruction[31:0] = instructionMemory_0_instruction;
  assign memWrite_1 = memWrite;
  assign regWrEn_1 = regWrEn;
  RegFile RegFile_0
       (.i_clk(i_clk_0_1),
        .regRdAddr1(xlslice_0_Dout),
        .regRdAddr2(xlslice_1_Dout),
        .regRdData1(RegFile_0_regRdData1),
        .regRdData2(RegFile_0_regRdData2),
        .regWrAddr(memPipeline_0_o_regWrAddr),
        .regWrData(mux_2_muxOut),
        .regWrEn(memPipeline_0_o_regWrite));
  adder adder_0
       (.adderOut(adder_0_adderOut),
        .op1(programCounter_0_pcOut),
        .op2(4));
  adder adder_1
       (.adderOut(adder_1_adderOut),
        .op1(shiftLeft_0_outData),
        .op2(idPipeline_0_o_ogaddr));
  alu alu_0
       (.aluOp(idPipeline_0_o_aluOp),
        .aluOut(alu_0_aluOut),
        .op1(mux4_1_0_Mux_out),
        .op2(mux_1_muxOut),
        .zeroFlag(alu_0_zeroFlag));
  andGate andGate_0
       (.bneSrc(idPipeline_0_o_bneSrc),
        .bnec(andGate_0_bnec),
        .zeroFlag(alu_0_zeroFlag));

  controlHazard controlHazard_0
       (.en(controlHazard_0_en),
        .en_ex_mem(exPipeline_0_o_branchEn),
        .opCode(xlslice_6_Dout),
        .opCode_id_ex(idPipeline_0_o_opCode),
        .opCode_if_id(ifPipeline_0_o_opCode),
        .pcEn(controlHazard_0_pcEn));
  dataMemory dataMemory_0
       (.i_clk(i_clk_0_1),
        .memWrite(exPipeline_0_o_memWrite),
        .readAddress(exPipeline_0_o_aluRes),
        .readData(dataMemory_0_readData),
        .writeAddress(exPipeline_0_o_aluRes),
        .writeData(mux_6_muxOut),
        .rd_address(rd_address),
        .rd_addr_valid(rd_addr_valid),
        .halt(halt),
        .final_data(final_data),
        .final_valid(final_valid));
  exPipeline exPipeline_0
       (.en(xlconstant_1_dout),
        .i_aluRes(alu_0_aluOut),
        .i_branchEn(idPipeline_0_o_branchEn),
        .i_clk(i_clk_0_1),
        .i_memToReg(idPipeline_0_o_memToReg),
        .i_memWrite(idPipeline_0_o_memWrite),
        .i_rd(idPipeline_0_o_wrRegAddr2),
        .i_rd_data2(mux4_1_1_Mux_out),
        .i_regWrAddr(mux_0_muxOut),
        .i_regWrite(idPipeline_0_o_regWrite),
        .i_rt(idPipeline_0_o_wrRegAddr1),
        .o_aluRes(exPipeline_0_o_aluRes),
        .o_branchEn(exPipeline_0_o_branchEn),
        .o_memToReg(exPipeline_0_o_memToReg),
        .o_memWrite(exPipeline_0_o_memWrite),
        .o_rd(exPipeline_0_o_rd),
        .o_rd_data2(exPipeline_0_o_rd_data2),
        .o_regWrAddr(exPipeline_0_o_regWrAddr),
        .o_regWrite(exPipeline_0_o_regWrite),
        .o_rt(exPipeline_0_o_rt));
  forwardUnit2 forwardUnit2_0
       (.forwardC(forwardUnit2_0_forwardC),
        .rd_mem_wb(memPipeline_0_o_rd),
        .rt_ex_mem(exPipeline_0_o_rt),
        .rt_mem_wb(memPipeline_0_o_rt));
  forwardingUnit forwardingUnit_0
       (.forwardA(forwardingUnit_0_forwardA),
        .forwardB(forwardingUnit_0_forwardB),
        .memToReg_ex(exPipeline_0_o_memToReg),
        .regRd_ex(exPipeline_0_o_regWrAddr),
        .regRd_mem(memPipeline_0_o_regWrAddr),
        .regWrite(idPipeline_0_o_regWrite),
        .regWrite_ex(exPipeline_0_o_regWrite),
        .regWrite_mem(memPipeline_0_o_regWrite),
        .rs(idPipeline_0_o_rs),
        .rt(idPipeline_0_o_wrRegAddr1),
        .rt_ex_mem(exPipeline_0_o_rt));
  idPipeline idPipeline_0
       (.en(xlconstant_1_dout),
        .i_aluOp(ifPipeline_0_o_aluOp),
        .i_aluSrc(ifPipeline_0_o_aluSrc),
        .i_bneSrc(ifPipeline_0_o_bneSrc),
        .i_branchEn(controlHazard_0_en),
        .i_clk(i_clk_0_1),
        .i_memToReg(ifPipeline_0_o_memToReg),
        .i_memWrite(ifPipeline_0_o_memWrite),
        .i_ogaddr(ifPipeline_0_o_ogaddr),
        .i_opCode(ifPipeline_0_o_opCode),
        .i_rd(xlslice_2_Dout),
        .i_rd_data1(mux_7_muxOut),
        .i_rd_data2(mux_8_muxOut),
        .i_regDst(ifPipeline_0_o_regDst),
        .i_regWrite(ifPipeline_0_o_regWrite),
        .i_rs(xlslice_0_Dout),
        .i_rt(xlslice_1_Dout),
        .i_signextend(signExtern_0_outData),
        .o_aluOp(idPipeline_0_o_aluOp),
        .o_aluSrc(idPipeline_0_o_aluSrc),
        .o_bneSrc(idPipeline_0_o_bneSrc),
        .o_branchEn(idPipeline_0_o_branchEn),
        .o_memToReg(idPipeline_0_o_memToReg),
        .o_memWrite(idPipeline_0_o_memWrite),
        .o_ogaddr(idPipeline_0_o_ogaddr),
        .o_opCode(idPipeline_0_o_opCode),
        .o_rd(idPipeline_0_o_wrRegAddr2),
        .o_rd_data1(idPipeline_0_o_rd_data1),
        .o_rd_data2(idPipeline_0_o_rd_data2),
        .o_regDst(idPipeline_0_o_regDst),
        .o_regWrite(idPipeline_0_o_regWrite),
        .o_rs(idPipeline_0_o_rs),
        .o_rt(idPipeline_0_o_wrRegAddr1),
        .o_signextend(idPipeline_0_o_signextend));
  ifPipeline ifPipeline_0
       (.en(controlHazard_0_en),
        .i_aluOp(aluOp_1),
        .i_aluSrc(ctrl1_1),
        .i_bneSrc(ctrl4_1),
        .i_clk(i_clk_0_1),
        .i_instr(instructionMemory_0_instruction),
        .i_memToReg(ctrl2_1),
        .i_memWrite(memWrite_1),
        .i_ogaddr(adder_0_adderOut),
        .i_opCode(xlslice_6_Dout),
        .i_regDst(ctrl_1),
        .i_regWrite(regWrEn_1),
        .o_aluOp(ifPipeline_0_o_aluOp),
        .o_aluSrc(ifPipeline_0_o_aluSrc),
        .o_bneSrc(ifPipeline_0_o_bneSrc),
        .o_instr(ifPipeline_0_o_instr),
        .o_memToReg(ifPipeline_0_o_memToReg),
        .o_memWrite(ifPipeline_0_o_memWrite),
        .o_ogaddr(ifPipeline_0_o_ogaddr),
        .o_opCode(ifPipeline_0_o_opCode),
        .o_regDst(ifPipeline_0_o_regDst),
        .o_regWrite(ifPipeline_0_o_regWrite));
  instructionMemory instructionMemory_0
       (.i_clk(i_clk_0_1),
        .i_wr_en(i_wr_en),
        .wr_address(wr_address),
        .addressBus(programCounter_0_pcOut),
        .instruction(instructionMemory_0_instruction),
        .inst(inst),
        .halt(halt));
  jmpMod jmpMod_0
       (.Address(xlslice_5_Dout),
        .JumpAddress(jmpMod_0_JumpAddress),
        .PCUp(xlslice_4_Dout));
  memPipeline memPipeline_0
       (.en(xlconstant_1_dout),
        .i_aluRes(exPipeline_0_o_aluRes),
        .i_clk(i_clk_0_1),
        .i_memToReg(exPipeline_0_o_memToReg),
        .i_rd(exPipeline_0_o_rd),
        .i_readData(dataMemory_0_readData),
        .i_regWrAddr(exPipeline_0_o_regWrAddr),
        .i_regWrite(exPipeline_0_o_regWrite),
        .i_rt(exPipeline_0_o_rt),
        .o_aluRes(memPipeline_0_o_aluRes),
        .o_memToReg(memPipeline_0_o_memToReg),
        .o_rd(memPipeline_0_o_rd),
        .o_readData(memPipeline_0_o_readData),
        .o_regWrAddr(memPipeline_0_o_regWrAddr),
        .o_regWrite(memPipeline_0_o_regWrite),
        .o_rt(memPipeline_0_o_rt));
  mux4_1 mux4_1_0
       (.In1(idPipeline_0_o_rd_data1),
        .In2(mux_2_muxOut),
        .In3(exPipeline_0_o_aluRes),
        .In4(dataMemory_0_readData),
        .Mux_out(mux4_1_0_Mux_out),
        .Sel(forwardingUnit_0_forwardA));
  mux4_1 mux4_1_1
       (.In1(idPipeline_0_o_rd_data2),
        .In2(mux_2_muxOut),
        .In3(exPipeline_0_o_aluRes),
        .In4(dataMemory_0_readData),
        .Mux_out(mux4_1_1_Mux_out),
        .Sel(forwardingUnit_0_forwardB));
  mux5bit mux_0
       (.ctrl(idPipeline_0_o_regDst),
        .in0(idPipeline_0_o_wrRegAddr1),
        .in1(idPipeline_0_o_wrRegAddr2),
        .muxOut(mux_0_muxOut));
  mux mux_1
       (.ctrl(idPipeline_0_o_aluSrc),
        .in0(mux4_1_1_Mux_out),
        .in1(idPipeline_0_o_signextend),
        .muxOut(mux_1_muxOut));
  mux mux_2
       (.ctrl(memPipeline_0_o_memToReg),
        .in0(memPipeline_0_o_aluRes),
        .in1(memPipeline_0_o_readData),
        .muxOut(mux_2_muxOut));
  mux mux_4
       (.ctrl(andGate_0_bnec),
        .in0(adder_0_adderOut),
        .in1(adder_1_adderOut),
        .muxOut(mux_4_muxOut));
  mux mux_5
       (.ctrl(ctrl3_1[0]),
        .in0(mux_4_muxOut),
        .in1(jmpMod_0_JumpAddress),
        .muxOut(mux_5_muxOut));
  mux mux_6
       (.ctrl(forwardUnit2_0_forwardC),
        .in0(exPipeline_0_o_rd_data2),
        .in1(mux_2_muxOut),
        .muxOut(mux_6_muxOut));
  mux mux_7
       (.ctrl(regFileForwarding_0_forwardD),
        .in0(RegFile_0_regRdData1),
        .in1(mux_2_muxOut),
        .muxOut(mux_7_muxOut));
  mux mux_8
       (.ctrl(regFileForwarding_0_forwardE),
        .in0(RegFile_0_regRdData2),
        .in1(mux_2_muxOut),
        .muxOut(mux_8_muxOut));
  programCounter programCounter_0
       (.en(controlHazard_0_pcEn),
        .i_clk(i_clk_0_1),
        .pcIn(mux_5_muxOut),
        .pcOut(programCounter_0_pcOut),
        .reset(reset),
        .halt(halt));
  regFileForwarding regFileForwarding_0
       (.forwardD(regFileForwarding_0_forwardD),
        .forwardE(regFileForwarding_0_forwardE),
        .regWrite(memPipeline_0_o_regWrite),
        .rs(xlslice_0_Dout),
        .rt(xlslice_1_Dout),
        .writeAddr(memPipeline_0_o_regWrAddr));
  shiftLeft shiftLeft_0
       (.inData(idPipeline_0_o_signextend),
        .outData(shiftLeft_0_outData));
  signExtern signExtern_0
       (.inData(xlslice_3_Dout),
        .outData(signExtern_0_outData));
        
  assign xlconstant_1_dout = 1'b1;      
        
//  mips_xlconstant_0_2 xlconstant_1
//       (.dout(xlconstant_1_dout));
  slice0 xlslice_0
       (.Din(ifPipeline_0_o_instr),
        .Dout(xlslice_0_Dout));
  slice1 xlslice_1
       (.Din(ifPipeline_0_o_instr),
        .Dout(xlslice_1_Dout));
  slice2 xlslice_2
       (.Din(ifPipeline_0_o_instr),
        .Dout(xlslice_2_Dout));
  slice3 xlslice_3
       (.Din(ifPipeline_0_o_instr),
        .Dout(xlslice_3_Dout));
  slice4 xlslice_4
       (.Din(adder_0_adderOut),
        .Dout(xlslice_4_Dout));
  slice5 xlslice_5
       (.Din(instructionMemory_0_instruction),
        .Dout(xlslice_5_Dout));
  slice6 xlslice_6
       (.Din(instructionMemory_0_instruction),
        .Dout(xlslice_6_Dout));
endmodule

module mips
   (in_clock,
   reset,
   i_wr_en,
   wr_address,
   rd_address,
   rd_addr_valid,
   final_data,
   final_valid,
   inst);
   input in_clock;
   input reset;
   input [31:0] inst;
   input [31:0] wr_address;
   input i_wr_en;
   input [31:0] rd_address;
   input rd_addr_valid;
   output [31:0] final_data;
   output final_valid;

  wire [2:0]controlLogic_0_aluOp;
  wire controlLogic_0_aluSrc;
  wire controlLogic_0_bneSrc;
  wire controlLogic_0_memToReg;
  wire controlLogic_0_memWrite;
  wire controlLogic_0_pcSrc;
  wire controlLogic_0_regDst;
  wire controlLogic_0_regWrite;
  wire i_clk_0_1;
  wire [31:0]instructionMemory_0_instruction;

  assign i_clk_0_1 = in_clock;
  DataPath_imp_19NSZCT DataPath
       (.aluOp(controlLogic_0_aluOp),
        .ctrl(controlLogic_0_regDst),
        .ctrl1(controlLogic_0_aluSrc),
        .ctrl2(controlLogic_0_memToReg),
        .ctrl3({controlLogic_0_pcSrc,controlLogic_0_pcSrc}),
        .ctrl4(controlLogic_0_bneSrc),
        .in_clock(i_clk_0_1),
        .instruction(instructionMemory_0_instruction),
        .memWrite(controlLogic_0_memWrite),
        .regWrEn(controlLogic_0_regWrite),
//        .reset_pulse(reset_pulse),
        .inst(inst),
        .i_wr_en(i_wr_en),
        .wr_address(wr_address),
        .rd_address(rd_address),
        .rd_addr_valid(rd_addr_valid),
        .reset(reset),
        .final_data(final_data),
        .final_valid(final_valid));
  controlLogic controlLogic_0
       (.aluOp(controlLogic_0_aluOp),
        .aluSrc(controlLogic_0_aluSrc),
        .bneSrc(controlLogic_0_bneSrc),
        .instruction(instructionMemory_0_instruction),
        .memToReg(controlLogic_0_memToReg),
        .memWrite(controlLogic_0_memWrite),
        .pcSrc(controlLogic_0_pcSrc),
        .regDst(controlLogic_0_regDst),
        .regWrite(controlLogic_0_regWrite));
endmodule
