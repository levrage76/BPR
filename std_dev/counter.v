module counter(
    input clk,
    input reset,
    output reg [31:0] count1, count2, count3, count4,count5, count6, count7, count8, count9 
	 
	 );

always @(posedge clk) begin
    if (reset) begin
	 
        count1 <= 32'b0;
		  count2 <= 32'b0;
		  count3 <= 32'b0;
		  count4 <= 32'b0;
		  count5 <= 32'b0;
		  count6 <= 32'b0;
		  count7 <= 32'b0;
		  count8 <= 32'b0; 
		  count9 <= 32'b0; 
		  
	 
		  
    end else 
	 
	 begin
       
		 
		  count1 <= count1 + 1;
		  count2 <= count2 + 2;
		  count3 <= count3 + 3;
		  count4 <= count4 + 4;
		  count5 <= count5 + 5;
		  count6 <= count6 + 3;
		  count7 <= count7 + 2;
		  count8 <= count8 + 1;
		  count9 <= count9 + 2;
		   
    end
end

endmodule