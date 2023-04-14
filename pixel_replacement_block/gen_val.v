
module gen_val(
			input clk,
			input reset,
			output reg [31:0] mean, std_dev
			);

always @(posedge clk) begin
   
	if (reset)
	begin
       
		  mean 	  <= 2087;
		  std_dev  <= 1426;
		  
    end else 
	 
	 begin
     		
		  mean 	  <= mean    + 4;
		  std_dev  <= std_dev + 4;
		
    end
end

endmodule