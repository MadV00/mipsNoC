module instructionMemory(
input   i_clk,
input   [31:0] addressBus,
input   [31:0] wr_address,
input   i_wr_en,
input   [31:0] inst,
output  [31:0] instruction,
output  halt
);

reg [31:0] mem [1055:0];
reg flag;

initial
flag <= 1'b0;

//initial
//begin
//    $readmemh("E:\\Softwares\\MIPS Software Computer Architecture\\hex1.mem",mem);
//end


//assign instruction = mem[addressBus];

always@(posedge i_clk)
begin
    if(inst == 32'hffffffff)
      flag <= 1'b1;
    else if(i_wr_en)
        mem[wr_address] <= inst;
        
end
//addressBus = 32'd0;
//else
//mem[addressBus[31:2]] = input_inst;
//end

assign halt = (flag)?1'b1:1'b0;
assign instruction =  mem[addressBus[31:2]];


endmodule