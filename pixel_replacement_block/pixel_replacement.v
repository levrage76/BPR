
module  pixel_replacement (

 input clk, reset,
 output [31:0] pixel_out,
 input  [31:0] std_dev,
 input  [31:0] weighted_mean,
 input  [31:0] pixel_in 

);


parameter K=1;

// intermediate registers
reg [31:0] upper_threshold;
//reg [31:0] pixel_in;
reg [31:0] lower_threshold;

always @(posedge clk)
begin

if(reset)
		begin

			upper_threshold <=0;
			lower_threshold <=0;

		end else 
			
			begin

			upper_threshold <= weighted_mean +  K*std_dev;
			lower_threshold <= weighted_mean - 	K*std_dev;


			end  

end



assign pixel_out = (pixel_in < lower_threshold   || pixel_in > upper_threshold)? weighted_mean:pixel_in;

endmodule