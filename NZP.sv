module NZP
(
	input logic Clk, Reset, Load_CC, Load_BEN,
	input logic [15:0] BEN_Bus,
	input logic [2:0] BEN_IR,
	output logic BEN_OUT
);
		logic n0, z0, p0, n1, z1, p1;
		
		always_ff @ (posedge Clk)
			begin
				if(Reset)
					BEN_OUT <= 1'b0;
				else if(Load_BEN)
					BEN_OUT <= (((BEN_IR[2] & n0) | (BEN_IR[1] & z0) | BEN_IR[0] & p0));
				if(Load_CC) 
					begin
						n0 <= n1;
						z0 <= z1;
						p0 <= p1;
					end
			end
		
		always_comb
			begin
				if(BEN_Bus[15])
					begin
						n1 = 1'b1;
						z1 = 1'b0;
						p1 = 1'b0;
					end
				else if(BEN_Bus == 16'b0000000000000000)
					begin
						n1 = 1'b0;
						z1 = 1'b1;
						p1 = 1'b0;
					end
				else
					begin
						n1 = 1'b0;
						z1 = 1'b0;
						p1 = 1'b1;
					end
			end
endmodule