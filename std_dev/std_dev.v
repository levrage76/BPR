
module  std_dev #(
         parameter  N_INPUT =8,
         parameter SIZE =32  
			)  
           (	 input clk, reset,
			       input  [N_INPUT*SIZE-1:0] in_data, // Input array of 6 values
                input  [31:0] mean, // Mean value of the input set
                output  [31:0] std_dev // Output variance value
               );
					
					
					
					
               
    reg [31:0] sum_squares[0:(N_INPUT-1)];
	 reg [31:0] sum_all;
    integer i,c,j;
	 reg [31:0] variance;
	 
	 
		sqrt sqrt_inst (
		
          .in(variance),
			 .out(std_dev)

				);		
					
	


always @ (posedge clk )
begin
	  
		if(reset) begin
		
			  for (c = 0; c < (N_INPUT); c=c+1) sum_squares [c] <= 0;		 
              end
         else begin  
			 
			 for (i = 0; i < N_INPUT; i=i+1)
				begin 
            
				
				sum_squares[i] <=  ((in_data[i*SIZE +: SIZE] - mean))* ((in_data[i*SIZE +: SIZE] - mean));
				
				
				end
		  end 
end	 


	always @ (* )	 
    
	begin
	  
		if(reset) begin
			 variance =0;
          sum_all =0;
		 			end
         else begin  
			
            
				sum_all  = sum_squares[0]+ sum_squares[1] +sum_squares[2]+ sum_squares[3] +sum_squares[4]+ sum_squares[5]+sum_squares[6]+ sum_squares[7];
	        
			   variance = sum_all/N_INPUT;
				
				
		   
			end
   
	end
	
	
	
	
endmodule