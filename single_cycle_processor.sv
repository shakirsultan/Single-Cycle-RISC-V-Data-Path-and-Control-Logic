module Akeana_P0_TSS(input logic rst,clk);

	logic [31:0] PC_In_Inc,PC_In,PC_Out,Ins,write_data,read_data1,read_data2,ImmOut, 
		     Addr_A_data,Addr_B_data,rd_data,r_data,inst,mem,bit_sep_s_out;
	logic en,Br_Un,Br_Eq,Br_Lt,PC_Sel,Reg_WEn,BSel,ASel,MemRW,L_sign;
	logic [2:0]ImmSel,Imm_sel;
	logic [1:0] WB_sel,S_Sel,L_Sel;
	logic [3:0] Alu_sel;



PC_M pc1(.clk(clk),.rst(rst),.PC_In(PC_In),.PC_Out(PC_Out));


assign PC_In_Inc = PC_Out+4;
assign PC_In = PC_Sel == 1 ? rd_data : PC_In_Inc;

IMEM IMEM1 (.PC_Addr(PC_Out[31:2]), .Ins(Ins));

reg_file reg1 ( .clk(clk), .en(en), .rst(rst), .write_reg(inst[11:7]), .read_reg1(inst[19:15]),.read_reg2(inst[24:20]),
 	.write_data(write_data), .read_data1(read_data1), .read_data2(read_data2)); 
always_comb begin
	inst=Ins;
end  

Imm_Gen ImmG1(.ImmIn(inst[31:7]),.ImmSel(ImmSel),.ImmOut(ImmOut));
comp comp1 (.rs1_data(read_data1), .rs2_data(read_data2),.Br_Un(Br_Un),.Br_Eq(Br_Eq), .Br_Lt(Br_Lt));	



always_comb begin
if(ASel==0)
Addr_A_data=read_data1;
else
Addr_A_data=PC_Out;
end

always_comb begin
if(BSel==0)
Addr_B_data=read_data2;
else
Addr_B_data=ImmOut;
end

ALU ALU1(.Addr_A_data(Addr_A_data),.Addr_B_data(Addr_B_data),.alu_op(Alu_sel),.rd_data(rd_data));


DMEM DMEM1 ( .clk(clk), .wr_en(MemRW) , .rst(rst), .addr(rd_data), .w_data(bit_sep_s_out), .r_data(r_data)); 

always_comb begin
if(WB_sel==0)
write_data=mem;//Register Write DMEM Data
else if(WB_sel==1)
write_data=rd_data;//Register write ALU data
else
write_data=PC_Out;
end

bit_sep_store Bit_sep_store1 (.reg_in(read_data2),.bit_sep_Sel(S_Sel),.out(bit_sep_s_out));//For Store word
bit_sep_load Bit_sep_load2 (.reg_in(r_data),.bit_sep_Sel(L_Sel),.out(mem),.L_sign(L_sign));//For Load word


control_unit CU1 ( .inst(inst),.Breq(Br_Eq), .BrLt(Br_Lt),.PC_Sel(PC_Sel),.Reg_WEn(en),
				.BrUn(Br_Un),.BSel(BSel),.ASel(ASel),.MemRW(MemRW),.Imm_sel(ImmSel),
				.Alu_sel(Alu_sel),.WB_sel(WB_sel),.S_Sel(S_Sel),.L_Sel(L_Sel),.L_sign(L_sign));

task print;
    reg1.print();
endtask 
endmodule