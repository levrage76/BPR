
module weighted_mean #(
         parameter  N_INPUT =4,
         parameter SIZE =32  
			)  
		  (
		input  clk, reset,enable,reset_s,
		input  [N_INPUT*SIZE-1 :0] in,
		input  [N_INPUT*SIZE-1 :0] weight,
		output  reg [31:0]  mean
			);



//parameter IDLE = 0;
//parameter ANG			

integer i;			
//reg [31:0] mean;			
reg [31:0]sum[0:3];
reg [31:0]weighted_sum[0:3]; 
reg [31:0] sum_all;
reg [31:0] weighted_sum_all;
reg [31:0]weight_in_prod[0:3];
reg [31:0] weight_sum;
reg [31:0] sum_weight_in_prod;


 /*always @(posedge clk)
 
 if(reset)

 Avg_val <= 0;
   
 else 

 Avg_val <=  mean;
 
 
 */
 
 always @(posedge clk)  begin
 
 if(reset)
 begin 
  sum_weight_in_prod <=0;
  weighted_sum_all <= 0;
 
 end else begin
 sum_weight_in_prod <= weight_in_prod[0]+weight_in_prod[1]+weight_in_prod[2]+weight_in_prod[3];
 weighted_sum_all<=weighted_sum[0]+weighted_sum[1]+weighted_sum[2]+weighted_sum[3];
 end 
 
 end
 
 
 always @(*)
 begin
 			if(reset) begin
		
	   weight_in_prod[0]=0;
		weight_in_prod[1]=0;
	   weight_in_prod[2]=0;
		weight_in_prod[3]=0;
		
		
		weighted_sum[0]=0;
		weighted_sum[1]=0;
		weighted_sum[2]=0;
		weighted_sum[3]=0;
	
		sum[0]=0;
		sum[1]=0;
		sum[2]=0;
		sum[3]=0;
		    
		     sum_all = 0;
			  mean    = 0;
			  weight_sum = 0;
		 			end
         else 
			begin  
			 
			 for( i=0; i < N_INPUT; i=i+1) 
				begin
				
				weight_in_prod[i] = (in[i*SIZE +: SIZE]*weight[i*SIZE +: SIZE]);
				
				sum_all = sum_weight_in_prod;// final                   
				weighted_sum[i] =	weight[i*SIZE +: SIZE];
		
				end
		    
				mean = sum_all/weighted_sum_all;
	  
			end
   
	end
	
	
	
	
endmodule 