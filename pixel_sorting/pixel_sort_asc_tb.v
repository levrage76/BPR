module pixel_sort_asc_tb;
    reg clk,reset,enable;
    reg  [15:0] in1,  in2,  in3,  in4,  in5, in6, in7, in8;
    wire [15:0] out1, out2, out3, out4, out5, out6, out7, out8;
    wire valid_out;
    pixel_sort_asc dut (
        .clk(clk),
		  .reset(reset),
		  .enable(enable),
		  .valid_out(valid_out),
		  .Pixel_in1(in1),
		  .Pixel_in2(in2),
		  .Pixel_in3(in3),
		  .Pixel_in4(in4),
		  .Pixel_in5(in5),
		  .Pixel_in6(in6),
		  .Pixel_in7(in7),
		  .Pixel_in8(in8),
		  .Pixel_out1(out1),
		  .Pixel_out2(out2),
		  .Pixel_out3(out3),
		  .Pixel_out4(out4),
		  .Pixel_out5(out5),
		  .Pixel_out6(out6),
		  .Pixel_out7(out7),
		  .Pixel_out8(out8)
		  
    );

    always @(posedge clk) begin
        in1 <= 55;
        in2 <= 1037;
        in3 <= 345;
        in4 <= 345;
        in5 <= 45;
		  in6 <= 234;
		  in7 <= 456;
		  in8 <= 344;
		  
    end

  /*  always @(posedge clk) begin
        $display("In:  %0d %0d %0d %0d %0d %0d %0d %0d %0d", in1,  in2,  in3,  in4,  in5, in6, in7, in8,in9);
        $display("Out: %0d %0d %0d %0d %0d %0d %0d %0d %0d", out1, out2, out3, out4, out5, out6, out7, out8, out9);
    end */

    initial begin
	     reset = 1;
		  #10;
		  reset = 0;
		  #10;
		  enable =1;
		   #20;
		  enable =0;
        #100;
        $finish;
    end

    always begin
        clk = 1'b0; #5;
        clk = 1'b1; #5;
    end
endmodule