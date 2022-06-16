module PC_M (
		input logic clk,rst,
		input logic [31:0] PC_In,
		output logic [31:0] PC_Out);
	
	always_ff @ (posedge clk)begin
		if(rst==1)begin
		PC_Out<='0;
		end
		else
		PC_Out <= PC_In;
		end
endmodule

	

