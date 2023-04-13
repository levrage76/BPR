module std_dev_tb;
    
	 reg clk;
	 reg reset;
    wire  [31:0] in1,  in2,  in3,  in4, in5 ,in6, in7, in8;
    wire [31:0] mean;
    wire [31:0] std_dev;

    std_dev #(.N_INPUT(8), .SIZE(32)) dut (
        .clk(clk),
		  .reset(reset),
        .in_data ({in1,in2,in3,in4,in5, in6, in7,in8}),
		  .mean(mean),
		  .std_dev(std_dev)
    );
	 
	 
	 counter counter_int
	(
		.clk(clk),
		.reset(reset),
		.count1(in1),
		.count2(in2), 
		.count3(in3), 
		.count4(in4),
		.count5(in5),
		.count6(in6), 
		.count7(in7), 
		.count8(in8),
		.count9(mean)
	 );

    /*always @(posedge clk) begin
        in1 <= 46;
        in2 <= 69;
        in3 <= 32;
        in4 <= 60;
		  in5 <= 52;
		  in6 <= 41;
		
		  mean <=50;
        //in5 <= 340;
		  ////in6 <= 45;
		  //in7 <=367;
		  //in8 <=256;
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