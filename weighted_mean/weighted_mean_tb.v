module weighted_mean_tb;
    
	 reg clk;
	 reg reset;
    wire   [31:0] in1,  in2,  in3,  in4;
	 wire  [31:0] w1,w2,w3,w4;
    wire [31:0] mean ;

    weighted_mean #(.N_INPUT(4), .SIZE(32)) dut (
       
		  .clk(clk),
		  .reset(reset),
        .in ({in1,in2,in3,in4}),
		  .weight({w1,w2,w3,w4}),
        .mean(mean)
				  
		 );
	 
	
	counter counter_int
	(
		.clk(clk),
		.reset(reset),
		.count1(in1),
		.count2(in2), 
		.count3(in3), 
		.count4(in4),
		.w1(w1),
		.w2(w2),
		.w3(w3),
		.w4(w4)
	 );

  /* always @(posedge clk) 
	 
	 if(reset)
	 	 begin     

			 in1 <= 0;
			 in2 <= 0;
			 in3 <= 0;
			 in4 <= 0;
			
			  w1 <= 0;
			  w2 <= 0;
			  w3 <= 0;
			  w4 <= 0;
			  
		end 
		else 
		begin 
		
		  in1 <= 1;
        in2 <= 2;
        in3 <= 3;
        in4 <= 4;
		  
			w1 <= 2;
		   w2 <= 3;
	      w3 <= 1;
	      w4 <= 3;
			
			
		  
		end
	

	*/	
     initial begin
	   reset =1;
		 #10;
		 reset =0;
       #10000;
        $finish;
    end

	
	 
    always begin
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
	 
	 
	 
	 
	 
	 
	 
	 
endmodule