//////////////////////////////////////////////////////////////////////////////////

module DMEM ( input logic clk, wr_en, rst,
                      input logic [31:0] addr,
                      input logic [31:0] w_data, 
                      output logic [31:0] r_data);  // Signal Declaration
    
    logic [31:0] array_reg [429496728:0];
    //Write Opt
always_ff @ (posedge clk, rst)
begin
    if (rst)
    begin
        array_reg <= '{default:31'b00};
    end
    else if (wr_en)
    array_reg[addr] <= w_data;
end

assign r_data = !wr_en ? array_reg[addr] : 32'b0;

endmodule

//////////////////////////////////////////////////////////////////////////////////
/*
module TB_DMEM();
logic clk, wr_en;
logic [31:0] addr;
logic [31:0] w_data;
logic [31:0] r_data; 

DMEM u1 ( clk, wr_en , addr, w_data, r_data
    ); 
    
    always #5 clk = ~clk;
    
    initial 
    begin
    clk = 0; 
    wr_en=1;
     addr= 0;
    w_data = 100;
    #20 
     addr= 1;
    w_data = 101;
    #20
        addr = 2;
    w_data = 102;
    #20
        addr = 3;
        w_data = 122;
        
    #20 
    wr_en=0;
        addr = 2;
    #20
        addr =0;    
          #20
              addr =3;   
    end
endmodule
*/
