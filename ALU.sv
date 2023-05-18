module ALU_Module(
					input logic [1:0] ALU_Sel,
					input logic [15:0] ALU_inA, ALU_inB,
					output logic [15:0] ALU_Out);
	always_comb
		begin
			case (ALU_Sel)
				2'b00:
					ALU_Out = ALU_inA + ALU_inB;
				2'b01:
					ALU_Out = ALU_inA & ALU_inB;
				2'b10:
					ALU_Out = ~ALU_inA;
				2'b11:
					ALU_Out = ALU_inA;
			endcase
		end
endmodule
