
module counter(
    input clk,
    input reset,
    output reg [31:0] count1, count2, count3, count4,
	 output reg [31:0] w1,w2,w3,w4
	 );

always @(posedge clk) begin
    if (reset) begin
        count1 <= 32'b0;
		  count2 <= 32'b0;
		  count3 <= 32'b0;
		  count4 <= 32'b0;
		  
		  
		  w1 <=0;
		  w2 <=0; 
		  w3 <=0;
		  w4 <=0; 
		  
    end else 
	 
	 begin
        w1 <= w1 + 2;
		  w2 <= w2 + 3;
		  w3 <= w3 + 1;
		  w4 <= w4 + 3;
		  
		  
		  count1 <= count1 + 1;
		  count2 <= count2 + 2;
		  count3 <= count3 + 3;
		  count4 <= count4 + 4;
    end
end

endmodule