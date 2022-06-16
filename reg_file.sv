module reg_file(
input logic   clk,en,rst,
input logic [4:0]  write_reg, read_reg1, read_reg2,
input logic  [31:0] write_data,
output logic [31:0] read_data1,read_data2
);

logic [31:0]array[31:0];

always@(posedge clk)
begin
	if (rst)
	begin 
		array <= '{default:31'b0};
	end
	else if (en) begin
		if(write_reg==0)//if register zero is called value is ignored
		array[write_reg]<=0;
	else
		array[write_reg]<=write_data;
	end
end

assign read_data1 = read_reg1==0 ? '0 : array[read_reg1];
assign read_data2 = read_reg2==0 ? '0 : array[read_reg2];


task print;
	for(int i=0; i<32; i=i+1)
		$display("Register Number=%0d Register=%b REG = %d",i, array[i],$signed (array[i]));
		
endtask


endmodule


