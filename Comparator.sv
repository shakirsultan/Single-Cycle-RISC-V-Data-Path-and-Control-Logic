module comp (
	input logic [31:0] rs1_data, rs2_data,
	input logic Br_Un,
	output logic Br_Eq, Br_Lt);	

 // Comparator
logic signed [31:0] sign_rs1,  sign_rs2;
assign sign_rs1 = rs1_data;
assign sign_rs2 = rs2_data;


always_comb
begin
	if (Br_Un)
		begin		
                         
				if(rs1_data==rs2_data)
				begin
					Br_Eq= 1'b1;
					Br_Lt=1'b0;
				end

				else if(rs1_data<rs2_data)
				begin
					Br_Eq = 1'b0;
					Br_Lt = 1'b1; 
					
				end
				else
				begin
				Br_Eq=1'b0;
				Br_Lt=1'b0;
				end
		end
	else
	begin
				
			if(sign_rs1==sign_rs2)
				begin
					Br_Eq= 1'b1;
					Br_Lt=1'b0;
				end

				else if(sign_rs1<sign_rs2)
				begin
					
					Br_Eq = 1'b0;
					Br_Lt = 1'b1; 
				end
	else
				begin
				Br_Eq=1'b0;
				Br_Lt=1'b0;
				end
		end

				
end
endmodule
/*
module TB_Comp();

	logic [31:0] rs1_data, rs2_data;
	logic Br_Un;
	logic Br_Eq, Br_Lt;
	logic rd_check;

comp dut (
	rs1_data, rs2_data,
	Br_Un,Br_Eq, Br_Lt);	
initial
begin
	
Br_Un=1;
	rs1_data = 32'd100; rs2_data = -32'd100; rd_check  = 1'b0;
        #10 if(rd_check == Br_Eq) $display("Comp. Passed"); else $display("Comp. Failed");
		//$display("Comp = %b", flag);
end
endmodule
*/
