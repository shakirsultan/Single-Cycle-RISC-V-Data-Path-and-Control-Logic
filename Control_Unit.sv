module control_unit ( 
	input logic [31:0] inst,
	input logic Breq, BrLt,
	output logic PC_Sel,Reg_WEn,BrUn,BSel,ASel,MemRW,L_sign,
	output logic [2:0] Imm_sel,
	output logic [3:0] Alu_sel,
	output logic [1:0] WB_sel,S_Sel,L_Sel	
	);
logic [8:0] Ins_Id;
logic [7:0] Ins_Id_2;
logic [4:0] Ins_Id_3;

assign Ins_Id= {{inst[30]},{inst[14:12]},{inst[6:2]}};
assign Ins_Id_2= {{inst[14:12]},{inst[6:2]}};
assign Ins_Id_3= {inst[6:2]};
always_comb
	begin
	case(Ins_Id)
	/////////////////////////////////R-TYPE///////////////////////	
	9'b0_000_01100: begin 
		//ADD
		Alu_sel = 4'b0000;
		PC_Sel = 1'b0;
		//Imm_sel = x;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b0;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end


	9'b1_000_01100: begin 
		//SUB
		Alu_sel = 4'b0001;
		PC_Sel = 1'b0;
		//Imm_sel = x;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b0;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end

	9'b0_100_01100: begin 
		//XOR
		Alu_sel = 4'b0010;
		PC_Sel = 1'b0;
		//Imm_sel = x;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b0;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end

	9'b0_110_01100: begin 
		//OR
		Alu_sel = 4'b0011;
		PC_Sel = 1'b0;
		//Imm_sel = x;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b0;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end

	9'b0_111_01100: begin 
		//AND
		Alu_sel = 4'b0100;
		PC_Sel = 1'b0;
		//Imm_sel = x;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b0;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end

	9'b0_001_01100: begin 
		//SLL
		Alu_sel = 4'b0101;
		PC_Sel = 1'b0;
		//Imm_sel = x;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b0;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end

	9'b0_101_01100: begin 
		//SRL
		Alu_sel = 4'b0110;
		PC_Sel = 1'b0;
		//Imm_sel = x;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b0;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end

	9'b1_101_01100: begin 
		//SRA
		Alu_sel = 4'b0111;
		PC_Sel = 1'b0;
		//Imm_sel = x;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b0;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end

	9'b0_010_01100: begin 
		//SLT
		Alu_sel = 4'b1000;
		PC_Sel = 1'b0;
		//Imm_sel = x;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b0;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end
	
	9'b0_011_01100: begin 
		//SLTU
		Alu_sel = 4'b1010;
		PC_Sel = 1'b0;
		//Imm_sel = x;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b0;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end

/////////////////////////////////I-TYPE///////////////////////	

	

	9'b0_001_00100: begin 
		//SLLI
		Alu_sel = 4'b0101;
		PC_Sel = 1'b0;
		Imm_sel = 3'b110;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
 
		end

	9'b0_101_00100: begin 
		//SRLI
		Alu_sel = 4'b0110;
		PC_Sel = 1'b0;
		Imm_sel = 3'b110;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1;
		end

	9'b1_101_00100: begin 
		//SRAI
		Alu_sel = 4'b0111;
		PC_Sel = 1'b0;
		Imm_sel = 3'b110;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1;
		end
	endcase

	case(Ins_Id_2)
	8'b000_00100: begin 
		//ADDI
		Alu_sel = 4'b0000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b0;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end


	8'b100_00100: begin 
		//XORI
		Alu_sel = 4'b0010;
		PC_Sel = 1'b0;
		Imm_sel = 3'b0;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1;
		end

	8'b110_00100: begin 
		//ORI
		Alu_sel = 4'b0011;
		PC_Sel = 1'b0;
		Imm_sel = 3'b0;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1;
		end

	8'b111_00100: begin 
		//ANDI
		Alu_sel = 4'b0100;
		PC_Sel = 1'b0;
		Imm_sel = 3'b0;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1;  
		end

	8'b010_00100: begin 
		//SLTI
		Alu_sel = 4'b1000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b0;
		Reg_WEn = 1'b1;
		//BrUn = x;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end


	8'b011_00100: begin 
		//SLTUI
		Alu_sel = 4'b1000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b101;
		Reg_WEn = 1'b1;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b1; 
		end

/////////////////////////////////S-TYPE///////////////////////	

	8'b010_01000: begin 
		//SW
		Alu_sel = 4'b0000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b1;
		Reg_WEn = 1'b0;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b1;   // Write =1, Read = 0;
		S_Sel = 2'b10;
		//WB_sel = 2'b1; 
		end
	8'b001_01000: begin 
		//SH
		Alu_sel = 4'b0000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b1;
		Reg_WEn = 1'b0;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b1;   // Write =1, Read = 0;
		S_Sel = 2'b01;
		//WB_sel = 2'b1; 
		end
	8'b000_01000: begin 
		//SB
		Alu_sel = 4'b0000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b1;
		Reg_WEn = 1'b0;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b1;   // Write =1, Read = 0;
		S_Sel = 2'b00;
		//WB_sel = 2'b1; 
		end

/////////////////////////////////L-TYPE///////////////////////	

	8'b010_00000: begin 
		//LW
		Alu_sel = 4'b0000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b0;
		Reg_WEn = 1'b1;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		L_Sel = 2'b10;
		WB_sel = 2'b0; 
		end
	8'b001_00000: begin 
		//LH
		Alu_sel = 4'b0000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b0;
		Reg_WEn = 1'b1;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		L_Sel = 2'b01;
		WB_sel = 2'b0; 
		end
	8'b000_00000: begin 
		//LB
		Alu_sel = 4'b0000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b0;
		Reg_WEn = 1'b1;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		L_Sel = 2'b00;
		WB_sel = 2'b0; 
		end
	8'b101_00000: begin 
		//LHU
		Alu_sel = 4'b0000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b101;
		Reg_WEn = 1'b1;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		L_Sel = 2'b01;
		L_sign=1'b1;
		WB_sel = 2'b0; 
		end

	8'b100_00000: begin 
		//LBU
		Alu_sel = 4'b0000;
		PC_Sel = 1'b0;
		Imm_sel = 3'b101;
		Reg_WEn = 1'b1;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		L_Sel = 2'b00;
		L_sign=1'b1;
		WB_sel = 2'b0; 
		end

//////////////////////////////////B-Type///////////////////////////////////
	8'b000_11000: begin 
		//BEQ
		if(Breq==1 && BrLt==0) begin
		PC_Sel = 1'b1;
		end
		else 	begin
		PC_Sel = 1'b0;
		end
		Alu_sel = 4'b0000;
		Imm_sel = 3'b010;
		Reg_WEn = 1'b0;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b1;
		MemRW = 1'b0;   // Write =1, Read = 0;
		end
		
	8'b001_11000: begin 
		//BNE
		if(Breq!=1 && BrLt!=0) begin
		PC_Sel = 1'b1;
		end
		else  	begin
		PC_Sel = 1'b0;
		end
		Alu_sel = 4'b0000;
		Imm_sel = 3'b010;
		Reg_WEn = 1'b0;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b1;
		MemRW = 1'b0;   // Write =1, Read = 0;
		end
		
	8'b100_11000: begin 
		//BLT
		if(Breq==0 && BrLt==1) begin
		PC_Sel = 1'b1;
		end
		else  	begin
		PC_Sel = 1'b0;
		end
		Alu_sel = 4'b0000;
		Imm_sel = 3'b010;
		Reg_WEn = 1'b0;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b1;
		MemRW = 1'b0;   // Write =1, Read = 0;
		end
		
	8'b101_11000: begin 
		//BGE
		if(BrLt==1) begin
		PC_Sel = 1'b0;
		end	
		else  	begin
		PC_Sel = 1'b1;
		end
		Alu_sel = 4'b0000;
		Imm_sel = 3'b010;
		Reg_WEn = 1'b0;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b1;
		MemRW = 1'b0;   // Write =1, Read = 0;
		end
		
	8'b110_11000: begin 
		//BLTU
		if(Breq==0 && BrLt==1) begin
		PC_Sel = 1'b1;
		end
		else  	begin
		PC_Sel = 1'b0;
		end
		Alu_sel = 4'b0000;
		Imm_sel = 3'b010;
		Reg_WEn = 1'b0;
		BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b1;
		MemRW = 1'b0;   // Write =1, Read = 0;
		end
		
	8'b111_11000: begin 
		//BGEU
		if(BrLt==1) begin
		PC_Sel = 1'b0;
		end	
		else  	begin
		PC_Sel = 1'b1;
		end
		Alu_sel = 4'b0000;
		Imm_sel = 3'b010;
		Reg_WEn = 1'b0;
		BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b1;
		MemRW = 1'b0;   // Write =1, Read = 0;
		end
/////////////////////////////////////////Jalr//////////////////////////////////////
	8'b000_11001: begin 
		//JALR
		PC_Sel = 1'b1;
		Alu_sel = 4'b0000;
		Imm_sel = 3'b000;
		Reg_WEn = 1'b1;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b0;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b10; 
		end
		endcase
		
/////////////////////////////////////////J-TYPE//////////////////////////////////////
		case(Ins_Id_3)
	5'b11011: begin 
		//JAL
		PC_Sel = 1'b1;
		Alu_sel = 4'b0000;
		Imm_sel = 3'b100;
		Reg_WEn = 1'b1;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b1;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b10; 
		end
/////////////////////////////////////////U-TYPE//////////////////////////////////////		
	5'b00101: begin 
		//AUIPC
		PC_Sel = 1'b0;
		Alu_sel = 4'b0000;
		Imm_sel = 3'b011;
		Reg_WEn = 1'b1;
		//BrUn = 1'b1;
		BSel = 1'b1;
		ASel = 1'b1;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b01; 
		end
	5'b01101: begin 
		//LUI
		PC_Sel = 1'b0;
		Alu_sel = 4'b1001;
		Imm_sel = 3'b011;
		Reg_WEn = 1'b1;
		//BrUn = 1'b1;
		BSel = 1'b1;
		//ASel = 1'b1;
		MemRW = 1'b0;   // Write =1, Read = 0;
		WB_sel = 2'b01; 
		end
				
		endcase
	end
	
endmodule

/*
module tb_CU();

	logic [31:0] inst;
	logic Breq, BrLt;
	logic PC_Sel,Reg_WEn,BrUn,BSel,ASel,MemRW;
	logic [2:0] Imm_sel;
	logic [3:0] Alu_sel;
	logic [1:0] WB_sel;
	logic [1:0] S_Sel,L_Sel;

control_unit dut (.inst(inst),.Breq(Breq),.BrLt(BrLt),.PC_Sel(PC_Sel),.Reg_WEn(Reg_WEn),.BrUn(BrUn),.BSel(BSel),
.ASel(ASel),.MemRW(MemRW),.Imm_sel(Imm_sel),.Alu_sel(Alu_sel),.WB_sel(WB_sel),.S_Sel(S_Sel),.L_Sel(L_Sel));


initial 
	begin
	
	inst= 32'b1100001100110111;
	
#50
	$display("Breq %b,BrLt %b,PC_Sel %b,Reg_WEn %b,BrUn %b,BSel %b,ASel %b,MemRW %b,Imm_sel %b,Alu_sel %b,WB_sel %b,S_Sel %b",Breq,BrLt,
		PC_Sel,Reg_WEn,BrUn,BSel,ASel,MemRW,Imm_sel,Alu_sel,WB_sel,S_Sel);
	
	end
endmodule
*/






