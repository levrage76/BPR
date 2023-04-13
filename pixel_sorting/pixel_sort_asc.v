module pixel_sort_asc (

	 input clk, reset, soft_rst,
	 input enable, 
	 input      [15:0] Pixel_in1, Pixel_in2, Pixel_in3, Pixel_in4 , Pixel_in5 , Pixel_in6, Pixel_in7, Pixel_in8,
	 output reg [15:0] Pixel_out1, Pixel_out2, Pixel_out3, Pixel_out4 , Pixel_out5 , Pixel_out6, Pixel_out7, Pixel_out8,    output reg valid_out
		
);


integer i, j;

reg [15:0] array [1:8]; 
reg [15:0] temp;
reg [15:0] in1, in2, in3, in4, in5, in6, in7, in8;
 


always @(posedge clk)
 begin
 if (reset)
     begin
     
	  in1 <= 0;
	  in2 <= 0; 
	  in3 <= 0; 
	  in4 <=	0;
	  in5 <=	0; 
	  in6 <=	0; 
	  in7 <=	0; 
	  in8 <=	0; 
	  valid_out <= 0; 
	 
		 Pixel_out1 <= 0;
		 Pixel_out2 <= 0;
		 Pixel_out3 <= 0;
		 Pixel_out4 <= 0;
		 Pixel_out5 <= 0;
		 Pixel_out6 <= 0;
		 Pixel_out7 <= 0;
		 Pixel_out8 <= 0; 
     
	  end 
	  else if(soft_rst)
		 begin 
		
	    in1 <=  0;
		 in2 <=  0; 
	    in3 <=  0; 
	    in4 <=	0;
	    in5 <=	0; 
	    in6 <=	0; 
	    in7 <=	0; 
	    in8 <=	0; 
	    valid_out <= 0; 
			
			
		 Pixel_out1 <= 0;
		 Pixel_out2 <= 0;
		 Pixel_out3 <= 0;
		 Pixel_out4 <= 0;
		 Pixel_out5 <= 0;
		 Pixel_out6 <= 0;
		 Pixel_out7 <= 0;
		 Pixel_out8 <= 0; 
				

       end
		 else  if(enable)
		 
		 begin
       valid_out <= 1;
		in1<= Pixel_in1;
		in2<= Pixel_in2; 
		in3<= Pixel_in3; 
		in4<= Pixel_in4;  
		in5<=	Pixel_in5; 
		in6<=	Pixel_in6; 
		in7<=	Pixel_in7; 
		in8<=	Pixel_in8; 
		
		 
		 Pixel_out1 <= array[8];
		 Pixel_out2 <= array[7];
		 Pixel_out3 <= array[6];
		 Pixel_out4 <= array[5];
		 Pixel_out5 <= array[4];
		 Pixel_out6 <= array[3];
		 Pixel_out7 <= array[2];
		 Pixel_out8 <= array[1];
	  	end
		 else begin
		 valid_out <= 0;
		 in1 <=  0;
		 in2 <=  0; 
	    in3 <=  0; 
	    in4 <=	0;
	    in5 <=	0; 
	    in6 <=	0; 
	    in7 <=	0; 
	    in8 <=	0; 
		 
		 
		 Pixel_out1 <= 0;
		 Pixel_out2 <= 0;
		 Pixel_out3 <= 0;
		 Pixel_out4 <= 0;
		 Pixel_out5 <= 0;
		 Pixel_out6 <= 0;
		 Pixel_out7 <= 0;
		 Pixel_out8 <= 0; 
	
       end	
		 
   
 end 
 
 always @(*)
  begin
 if (reset)
     begin
     
		 array[1] =  0; 
		 array[2] =	 0;
		 array[3] =  0;
		 array[4] =  0;
		 array[5] =  0;
		 array[6] =  0;
		 array[7] =  0;
		 array[8] =  0;
  
     
	  end 
	  else if(soft_rst)
		 begin 
		
	    array[1] =  0; 
		 array[2] =	 0;
		 array[3] =  0;
		 array[4] =  0;
		 array[5] =  0;
		 array[6] =  0;
		 array[7] =  0;
		 array[8] =  0;
  
	     end
	else  begin
  
			 array[1] =  Pixel_in1; 
			 array[2] =	 Pixel_in2;
			 array[3] =  Pixel_in3;
			 array[4] =  Pixel_in4;
			 array[5] =  Pixel_in5;
			 array[6] =  Pixel_in6;
			 array[7] =  Pixel_in7;
			 array[8] =  Pixel_in8;
 
 
 for ( i= 8; i>0; i=i-1) begin
		for(j=1; j<i; j=j+1) begin 
		 if (array[j] < array[j + 1])
          begin
            temp = array[j];
            array[j] = array[j + 1];
            array[j + 1] = temp;
				end
				
		   end
 
		end
	end
 
 end 
 

endmodule 