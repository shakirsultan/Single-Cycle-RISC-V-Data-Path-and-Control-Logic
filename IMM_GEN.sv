module Imm_Gen (
	input logic [24:0]ImmIn,
	input logic [2:0]ImmSel,
	output logic [31:0]ImmOut
	);

	always_comb begin
		case(ImmSel)  
			3'b000: ImmOut <= {{21{ImmIn[24]}},{ImmIn[23:13]}}; //I immediate
			3'b001: ImmOut <= {{21{ImmIn[24]}},{ImmIn[23:18]},{ImmIn[4:0]}}; //S immediate
			3'b010: ImmOut <= {{20{ImmIn[24]}},ImmIn[0],{ImmIn[23:18]},{ImmIn[4:1]},1'b0}; //B immediate
			3'b011: ImmOut <= {{ImmIn[24:5]},{12{1'b0}}}; //U immediate
			3'b100: ImmOut <= {{12{ImmIn[24]}},{ImmIn[12:5]},ImmIn[13],{ImmIn[23:14]},1'b0}; // J immediate
			3'b101: ImmOut <= {{20{1'b0}},{ImmIn[24:13]}}; //I immediate Unsigned
			3'b110: ImmOut <= {{26{1'b0}},{ImmIn[17:13]}}; //I immediate(Shift Type)
			default: ImmOut <= 0;
		endcase
	end
endmodule
/*
module tb;
logic [24:0]ImmIn;
logic [2:0]ImmSel;
logic [31:0]ImmOut;

Imm_Gen dut (ImmIn,ImmSel,ImmOut);

initial begin
	#10;
ImmSel = 0;
ImmIn = 25'b0011011110111010000001011; //I
#20;
ImmSel = 0;
ImmIn = 25'b0000000010000001001001110; //I
#20;
ImmSel = 1;
ImmIn = 25'b0000000011100001001001000; //S
#20;
ImmSel = 2;
ImmIn = 25'b1111111001100010100010101; //B
#20;
ImmSel = 0;
ImmIn = 25'b0000111010010000100000101; //I
#20;
ImmSel = 3;
ImmIn = 25'b0000000000101000111101010;  //U
#20;
$monitor("APUC IMM, %0d", {{ImmOut[31:12]}});  
end
endmodule
*/
