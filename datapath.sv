module datapath(input logic Reset, Clk,
					 input logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
					 input logic GateMARMUX, GatePC, GateALU, GateMDR,
					 input logic MIO_EN, DRMUX, SR1MUX, SR2MUX, ADDR1MUX,
					 input logic [15:0] MDR_In,
					 input logic [1:0] PCMUX, ADDR2MUX, ALUK,
					 output logic [15:0] MAR, MDR, IR, PC,
					 output logic [9:0] LED,
					 output logic BEN
					 );
		
	logic [2:0] SR1, DR_In, NZP, NZP_IN;
	logic BEN_In;
	logic [15:0] Bus, PC_IN, MDR_IN, ADD_OUT, ALU_OUT, SR1_OUT, SR2_OUT, ALUB, Sext11, Sext9, Sext6, Sext5, PC_NEXT, Add1, Add2, MDR_Value;
	
	Mux4 PC_mux(.Select(PCMUX),.A(PC + 1),.B(Bus),.C(Add1 + Add2),.D(16'h0000),.out(PC_IN));
	Mux2 MDR_mux(.Select(MIO_EN),.A(Bus),.B(MDR_In),.out(MDR_Value));  
	Mux_bus  busMux(.Select({GateMDR, GateALU, GatePC, GateMARMUX}),.A(Add1 + Add2),.B(PC),.C(ALU_OUT),.D(MDR),.out(Bus));
	
	reg_16 MDR_Register(.*, .Load(LD_MDR), .Din(MDR_Value), .Dout(MDR));
	reg_16 MAR_Register(.*, .Load(LD_MAR), .Din(Bus), .Dout(MAR));
	reg_16 PC_Register(.*, .Load(LD_PC), .Din(PC_IN), .Dout(PC));
	reg_16 IR_Register(.*, .Load(LD_IR), .Din(Bus), .Dout(IR));
	
	assign LED = IR[9:0];
	
	reg_file regFile(.*,.Load(LD_REG),.DR_In(DR_In),.SR2(IR[2:0]),.SR1(SR1),.Bus_In(Bus),.SR1_Out(SR1_OUT),.SR2_Out(SR2_OUT));

	SEXT11 sextaddr11(.IR(IR[10:0]), .OUT(Sext11));
	SEXT9 sextaddr9(.IR(IR[8:0]), .OUT(Sext9));
	SEXT6 sextaddr6(.IR(IR[5:0]), .OUT(Sext6));
	SEXT5 sextaddr5(.IR(IR[4:0]), .OUT(Sext5));	
	
	Mux4 ADDR2_Mux(.Select(ADDR2MUX),.A(16'h0000),.B(Sext6),.C(Sext9),.D(Sext11),.out(Add2));
	Mux2 ADDR1_Mux(.Select(ADDR1MUX),.A(PC),.B(SR1_OUT),.out(Add1));
	Mux2 MuxSR2(.Select(SR2MUX),.A(SR2_OUT),.B(Sext5),.out(ALUB));
	Mux2_3 MuxSR1(.Select(SR1MUX),.A(IR[11:9]),.B(IR[8:6]),.out(SR1));
	Mux2_3 MuxDR(.Select(DRMUX),.A(IR[11:9]),.B(3'b111),.out(DR_In));
	

	ALU_Module alu_(.ALU_Sel(ALUK), .ALU_inA(SR1_OUT), .ALU_inB(ALUB), .ALU_Out(ALU_OUT));

	
	NZP ben_(.Clk(Clk), .Reset(Reset), .Load_CC(LD_CC), .Load_BEN(LD_BEN), .BEN_Bus(Bus), .BEN_IR(IR[11:9]), .BEN_OUT(BEN));

endmodule

