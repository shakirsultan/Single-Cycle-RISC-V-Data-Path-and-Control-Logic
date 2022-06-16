	//Instruction Memory

module IMEM (input logic [29:0] PC_Addr,
		output logic [31:0] Ins);

	logic [31:0]Memory[429496728:0];
	

always_comb
begin
	Ins = Memory[PC_Addr];	
end

initial 
	begin 
	$display("Loading ROM");
	$readmemh("data3.hex", Memory,0,3);
#10
	$monitor("IMEM, %b", Memory[PC_Addr]);
	end
endmodule	 

