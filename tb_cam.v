`timescale 1ns / 1ps
module tb_cam();
	
	reg		reset, clk;
	reg	[15:0]	DIN;
	reg EN,WE;
	wire	match;
	wire [3:0] match_addr;
CAM cami
(
	.reset	(reset),
	.clk		(clk),
	.DIN		(DIN),
	.EN		(EN),
	.WE		(WE),
	.match	(match),
	.match_addr	(match_addr)
);initial 
begin
	   clk   = 1'b1;
	   reset = 1'b1;
	   DIN   = 8'h00;
	#4 reset = 1'b1;
	#2;
	begin 
	   	reset = 1'b0;
		EN = 1;
		WE = 0;
		DIN   = 8'h01;
		#2 WE = 1;
	end
	#2;
	begin 
		EN = 1;
		WE = 0;
		DIN   = 8'h02;
		#2 WE = 1;
	end

	#2;
	begin 
	 	EN = 1;
		WE = 0;
      		DIN    = 8'h04;
		#2 WE = 1;
	end
	#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN    = 8'h05;
		#2 WE = 1;
	end
	#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN   = 8'h06;
	  	#2 WE = 1;
	end
	#2;
	begin 
		EN = 1;
		WE = 0;
      		DIN   = 8'h07;
		#2 WE = 1;
	end
	
	#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h09;
		#2 WE = 1;
	end
	
	#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h10;
		#2 WE = 1;
	end
#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h07;
		#2 WE = 1;
	end
	#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h11;
		#2 WE = 1;
	end
	
	#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h12;
		#2 WE = 1;
	end
	#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h13;
		#2 WE = 1;
	end
	#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h14;
		#2 WE = 1;
	end
	#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h15;
		#2 WE = 1;
	end
	#2;
	begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h16;
		#2 WE = 1;
	end
	
	#2;
begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h17;
		#2 WE = 1;
	end
	#2;
begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h20;
		#2 WE = 1;
	end
#2;
begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h29;
		#2 WE = 1;
	end
#2;
begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h14;
		#2 WE = 1;
	end
	#2;
begin 
	   	EN = 1;
		WE = 0;
      		DIN     = 8'h30;
		#2 WE = 1;
	end
#2;
	begin 
	   	reset = 1'b1;
		
	end
	/*begin 
		reset = 1'b0;	   	
		EN = 1;
		WE = 0;
      		DIN     = 8'h15;
		#2 WE = 1;
	end


	begin 
	  	EN = 1;
		WE = 0;
      		DIN    = 8'h01;
			  	  #2 WE = 1;
	end
	#2;
	begin 
	   EN = 1;
		WE = 0;
      DIN    = 8'h11;
		 #2 WE = 1;
	end
	#2;
	begin 
	  EN = 1;
		WE = 0;
      DIN    = 8'h12;
			   #2 WE = 1;
	end
	#2;
	begin 
	   EN = 1;
		WE = 0;
      DIN    = 8'h13;
		 #2 WE = 1;
	end
	#2;
	begin 
	   EN = 1;
		WE = 0;
      DIN    = 8'h14;
		 #2 WE = 1;
	end
	#2;
	begin 
	   EN = 1;
		WE = 0;
      DIN    = 8'h15;
		 #2 WE = 1;
	end
	#2;
	begin 
	   EN = 1;
		WE = 0;
      DIN     = 8'h16;
			   #2 WE = 1;
	end
	#2;
	begin 
	   EN = 1;
		WE = 0;
      DIN      = 8'h2A;
			   #2 WE = 1;
	end
	#2;
	begin 
	   EN = 1;
		WE = 0;
      DIN    = 8'h19;
		#2 WE = 1;
	end
	#2;
	begin 
	   EN = 1;
		WE = 0;
      DIN    = 8'h22;
		#2 WE = 1;
	end
	#2;
	begin 
	   EN = 1;
		WE = 0;
      DIN    = 8'h15;
		#2 WE = 1;
	end
//Above statement causes overflow
	
*/
//Above statements cause underflow of LIFO
#5 $finish;
end

always #1 clk = ~clk;

endmodule
