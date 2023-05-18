module reg_16 
(
    input logic Clk, Reset, Load,
    input logic [15:0] Din,
    output logic [15:0] Dout
);
always_ff @ (posedge Clk) begin
    if (Reset)
        Dout <= 16'h0;
    else if (Load)
        Dout <= Din[15:0];
end
endmodule


module reg_10
(
    input logic Clk, Reset, Load,
    input logic [10:0] Din,
    output logic [10:0] Dout
);
always_ff @ (posedge Clk) begin
    if (Reset)
        Dout <= 10'h0;
    else if (Load)
        Dout <= Din[10:0];
end
endmodule

module reg_3
(
    input logic Clk, Reset, Load,
    input logic [2:0] Din,
    output logic [2:0] Dout
);
always_ff @ (posedge Clk) begin
    if (Reset)
        Dout <= 3'h0;
    else if (Load)
        Dout <= Din[2:0];
end
endmodule

module reg_1 
(
    input logic Clk, Load,
    input logic Din,
    output logic Dout
);
always_ff @ (posedge Clk) begin
    if (Load)
		Dout <= Din;
	else
		Dout <= Dout;
end
endmodule


module reg_file
(
    input logic Clk, Reset, Load,
	input logic [2:0]DR_In, SR1, SR2,
	input logic [15:0]Bus_In,
	output logic [15:0] SR1_Out, SR2_Out
);
					 
	logic [7:0][15:0] REGISTER_FILE;
	
	always_ff @ (posedge Clk)
	begin
		if (Reset)
		begin
			REGISTER_FILE[0] <= 16'h0000;
			REGISTER_FILE[1] <= 16'h0000;
			REGISTER_FILE[2] <= 16'h0000;
			REGISTER_FILE[3] <= 16'h0000;
			REGISTER_FILE[4] <= 16'h0000;
			REGISTER_FILE[5] <= 16'h0000;
			REGISTER_FILE[6] <= 16'h0000;
			REGISTER_FILE[7] <= 16'h0000;
		end
		else
		begin
			if(Load)
			begin
				case(DR_In)
					3'b000: REGISTER_FILE[0] <= Bus_In;
					3'b001: REGISTER_FILE[1] <= Bus_In;
					3'b010: REGISTER_FILE[2] <= Bus_In;
					3'b011: REGISTER_FILE[3] <= Bus_In;
					3'b100: REGISTER_FILE[4] <= Bus_In;
					3'b101: REGISTER_FILE[5] <= Bus_In;
					3'b110: REGISTER_FILE[6] <= Bus_In;
					3'b111: REGISTER_FILE[7] <= Bus_In;
				endcase
			end
		end
	end
		
	always_comb
	begin
		case (SR1)
			3'b000: SR1_Out = REGISTER_FILE[0];
			3'b001: SR1_Out = REGISTER_FILE[1];
			3'b010: SR1_Out = REGISTER_FILE[2];
			3'b011: SR1_Out = REGISTER_FILE[3];
			3'b100: SR1_Out = REGISTER_FILE[4];
			3'b101: SR1_Out = REGISTER_FILE[5];
			3'b110: SR1_Out = REGISTER_FILE[6];
			3'b111: SR1_Out = REGISTER_FILE[7];
		endcase
		case (SR2)
			3'b000: SR2_Out = REGISTER_FILE[0];
			3'b001: SR2_Out = REGISTER_FILE[1];
			3'b010: SR2_Out = REGISTER_FILE[2];
			3'b011: SR2_Out = REGISTER_FILE[3];
			3'b100: SR2_Out = REGISTER_FILE[4];
			3'b101: SR2_Out = REGISTER_FILE[5];
			3'b110: SR2_Out = REGISTER_FILE[6];
			3'b111: SR2_Out = REGISTER_FILE[7];
		endcase
	end
endmodule


//33_0

//5020