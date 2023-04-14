
module pixel_replacement_tb;

reg clk, reset;
wire [31:0] mean, std_dev;
wire [31:0] in_pixel;
wire [31:0] out_pixel;

parameter c_NUM_BITS =32;

gen_val gen_val_inst (

			 .clk(clk),
			 .reset(reset),
			 .std_dev(std_dev),
			 .mean(mean)


);


pixel_replacement pixel_replacement_inst (

		.clk(clk),
		.reset(reset),
		.std_dev(std_dev),
		.weighted_mean(mean),
		.pixel_in(in_pixel),
		.pixel_out(out_pixel)
		 
 );
 
 LFSR #(.NUM_BITS(c_NUM_BITS)) LFSR_inst
         (
			. i_Clk(clk),
          .i_Enable(1'b1),
          .i_Seed_DV(1'b0),
          .i_Seed_Data(30), // Replication
          .o_LFSR_Data(in_pixel),
          .o_LFSR_Done(w_LFSR_Done)
          
			);


 
			initial 
			begin
			clk=0;
			reset=1;
			#10;
			reset=0;
			#10000;
			$finish;
			end


			always 
			begin

			#5 clk = ~clk; 

			end  

endmodule