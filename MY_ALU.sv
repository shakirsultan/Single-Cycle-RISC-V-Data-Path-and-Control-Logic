module ALU (
		input logic signed [31:0] Addr_A_data, input logic signed [31:0] Addr_B_data,
	 	input logic signed [3:0] alu_op, output logic [31:0] rd_data);


always_comb
	begin
	case (alu_op)

		4'b0000: rd_data = Addr_A_data + Addr_B_data;  	// Add
		4'b0001: rd_data = Addr_A_data - Addr_B_data;    // Sub
		4'b0010: rd_data = Addr_A_data ^ Addr_B_data;    //XOR
		4'b0011: rd_data = Addr_A_data | Addr_B_data;   //OR
		4'b0100: rd_data = Addr_A_data & Addr_B_data;   //AND
		4'b0101: rd_data = Addr_A_data << Addr_B_data;    // Left Logical Shift
		4'b0110: rd_data = Addr_A_data >> Addr_B_data;   // Right Logical Shift
		4'b0111: rd_data = Addr_A_data >>> Addr_B_data;  // Arithmetic Shift Right
		4'b1000: rd_data = (Addr_A_data < Addr_B_data)?1'b1:1'b0;  //  SLT
		4'b1001: rd_data = 0 + Addr_B_data; //LUI 
		4'b1010: rd_data = ($unsigned (Addr_A_data) < $unsigned(Addr_B_data))?1'b1:1'b0;  //  SLTU
		default: rd_data = 32'b0;
	endcase
end

endmodule

