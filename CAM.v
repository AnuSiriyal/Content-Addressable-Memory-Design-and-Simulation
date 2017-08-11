`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:24:22 09/18/2016 
// Design Name: 
// Module Name:    CAM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module CAM(reset,clk,DIN,EN,WE,match,match_addr);
//parameter list
parameter DEPTH = 16;
parameter WIDTH = 8;
parameter ADDR_WIDTH = 4;
parameter INITIAL=4'b0000,READ=4'b0001,WRITE=4'b0010;
//------------Input--------------- 
input reset;
input clk;
input [WIDTH-1:0] DIN;
input EN;
input WE;

//------------output---------------
output match;
output [ADDR_WIDTH-1:0] match_addr;

//reg EN,WE;
reg [3:0]  match_addr;
reg match;
//Code
reg [WIDTH-1:0] cammem[0:DEPTH-1];
reg [WIDTH-1:0] P[0:DEPTH-1];
reg flag,full;
reg [3:0] State;
integer i,count,loc,joker,max;
always@(posedge clk or posedge reset)
	begin
		if(reset==1)
			begin
				
			for(i=0;i<=15;i=i+1)
				begin
					cammem[i]<=0;
					P[i]<=-1;
				end
				max<=-1;
				count<=-1;
				full<=0;
				State<=READ;
				
			end
		else
			begin
				case(State)
					
					READ:
								begin//State READ begin
									if((EN==1)&&(WE==0)&&(reset!=1))
										begin//EN/WE if begin
											$display("EN=1 and WE=0");
											match<=0;
											match_addr<=0;
											for(i=0;i<16;i=i+1)
												begin//for inside begin
													if(cammem[i]==DIN)//&&(flag==1))
														begin//DIN if begin
															$display("Found a match");
															$display("cammem[i]=%d i=%d DIN=%d ",cammem[i],i,DIN);
															match<=1;
															loc<=i;
															//flag<=0;
															$display("Going to Write");
															State<=WRITE;
														end//DIN if end
													else
														begin//DIN else begin
															$display("Joker");
															joker<=1;
														end//DIN else end
												end//fr end
												$display("Flagg is here %d",flag);
															if(count<0)
																begin
																	$display("first element filling");
																	count<=0;
																end
															else if((count>=0)&&(count<=14))
																begin
																	count<=count+1;
																end
															else
																begin
																count<=count;
																full<=1;
																end
															$display("going to Write");
															State<=WRITE;
														
													
												
										end//WE EN end
									
									else
										begin
											$display("Staying in READ");
											State<=READ;
										end
								end//State READ end
					WRITE:
								begin
									$display("I'm inside Write");
									if((EN==1)&&(WE==1)&&(reset!=1))
										begin
											$display("WE is given");
											if((count>=0)&&(count<=15)&&(match!=1)&&(full==0))
												begin
													cammem[count]<=DIN;
													max<=count;$display("cammem[count]=%d count=%d DIN=%d",cammem[count],count,DIN);
													P[count]<=count;
													$display("P[count]=%d",P[count]);
													
													$display("After count=%d",count);
													
												end
											
											else if((full==1)&&(match!=1))
												begin
													$display("Inside full==1 and no match");
													for(i=0;i<=15;i=i+1)
														begin//for begin
															if(P[i]==0)
																begin
																	P[i]<=15;
																	cammem[i]<=DIN;
																end
															else
																begin
																	P[i]<=P[i]-1;
																end
														end//for end
												end
											else if((full==1)&&(match==1))
												begin
													for(i=0;i<=15;i=i+1)
														begin
															if(P[i]>P[loc])
																begin
																	P[i]<=P[i]-1;
																end
															else
																P[i]<=P[i];
														end
													P[loc]<=15;
													match_addr<=loc+1;
												end
											else if((match==1)&&(count>=0)&&(count<=15)&&(full==0))
												begin
													match_addr<=loc+1;
													for(i=0;i<=15;i=i+1)
														begin
															if((P[i]>P[loc])&&(P[i]<=max))
																begin
																	P[i]<=P[i]-1;
																end
															else 
																begin
																	P[i]<=P[i];
																end
														end
													P[loc]<=max;
													
												end//else if end
											else
												begin
													joker<=1;
												end
											
											State<=READ;
										end//EN WE end
																	
										else
										begin
											State<=WRITE;
										end
								end
				endcase//Case end
										
			end//IF
		end//always
endmodule
