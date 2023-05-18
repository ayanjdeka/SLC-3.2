//module testbench();
//
//timeunit 10ns;
//timeprecision 1ns;
//
//
//   // Internal variables
//    logic Clk, Reset, Run, Continue;
//    logic [9:0] SW, LED;
//    logic [6:0] HEX0, HEX1, HEX2, HEX3;
//	 logic [15:0] PC, MAR, MDR, IR, Bus;
//	
//	
//	// initialize the toplevel entity
//	slc3_testtop test(.*);
//	
//	
//	assign PC = test.slc.d0.PC;
//	assign MAR = test.slc.d0.MAR;
//	assign MDR = test.slc.d0.MDR;
//	assign IR = test.slc.d0.IR;	
//	assign Bus = test.slc.d0.Bus;
//	
//	
//	// initialize clock signal 
//	initial begin: CLOCK_INITIALIZATION 
//		Clk = 0;
//   end
//	
//	// set clock rule
//   always begin : CLOCK_GENERATION 
//		#1 Clk = ~Clk;
//   end
//	
//	// begin testing
////    initial begin : TEST_VECTORS	  
////	  Run = 0;
////	Continue = 0;
////	
////	#2
////		Run = 1'b1;
////		Continue = 1'b1;
////		
////		#2
////		Run = 1'b0;
////
////		#2
////		Run = 1'b1;
////		
////	  #20 Continue = 0;
////	  #2 Continue = 1;
////	  
////	  #20 Continue = 0;
////	  #2 Continue = 1;
////	  
////	  #20 Continue = 0;
////	  #2 Continue = 1;
////	  
////	  #20 Continue = 0;
////	  #2 Continue = 1;
////	  
////	  #20 Continue = 0;
////	  #2 Continue = 1;
////	  
////	  #20 Continue = 0;
////	  #2 Continue = 1;
////	  
////	  #20 Continue = 0;
////	  #2 Continue = 1;
//	  
//initial begin: TEST_VECTORS 
//Continue = 0; 
//Run = 0; #10 
//Run = 1; 
//Continue = 1; #10 
//SW = 16'h0003; #10 
//Run = 0; #200 
//Run = 1; #100 
//SW = 16'hFFFF; #100 
//SW = 16'h0000; #100 
//SW = 16'h000A; #100 
//Run = 1; 
//Continue = 1; 
//end
//
//
//	 
//endmodule

module testbench();

timeunit 10ns; // Half clock cycle at 50 MHz
// This is the amount of time represented by #1
timeprecision 1ns;

// These signals are internal because the processor will be
// instantiated as a submodule in testbench.
logic Clk;
logic Run;
logic Continue;
logic [9:0] SW;
logic [9:0] LED;
//logic [7:0] Aval, Bval, Xval;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
//logic [15:0] R0_O, R1_O,R2_O, R3_O, bus_O, MDR_O, MAR_O, PC_O, IR_O;
//logic WE_O;
logic Reset;

// To store expected results
//logic [7:0] ans_1a;


// Instantiating the DUT
// Make sure the module and signal names match with those in your design
slc3_testtop test(.*);

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
assign State = test.slc.state_controller.State;
//assign MAR_O = test.slc.MAR;
//assign MDR_O = test.slc.MDR;
//assign PC_O = test.slc.PC;
//assign IR_O = test.slc.IR;
//assign GateALU_O = test.slc.GateALU;
//assign GatePC_O = test.slc.GatePC;
//
//assign GateMDR_O = test.slc.GateMDR;
//
//assign GateMARMUX_O = test.slc.GateMARMUX;
//
//assign LD_IR_O = test.slc.LD_IR;
//assign LD_PC_O = test.slc.LD_PC;
//
//assign LD_MAR_O = test.slc.LD_MAR;
//assign LD_MDR_O = test.slc.LD_MDR;
//assign PCMUX_O = test.slc.PCMUX;
//
//
//assign R0_O = test.slc.d0.reg_file.reg_file[0];
//assign R1_O = test.slc.d0.reg_file.reg_file[1];
//assign R2_O = test.slc.d0.reg_file.reg_file[2];
//assign R3_O = test.slc.d0.reg_file.reg_file[3];
//assign WE_O = test.slc.WE;
//assign bus_O = test.slc.d0.bus;
//assign opcode_O = test.slc.state_controller.Opcode;


initial begin: TEST_VECTORS

// //test 1
Run = 0;
//Continue = 0;
//#2
//Run = 1;
//Continue = 1;
//
//#5
//SW = 10'b0000000011;
//#5 Run = 0;
//#5 Run = 1;
//#100 SW = 10'b1111111111;
//
//#100 SW = 10'b0000000000;

//// test 2
//Run = 0;
//Continue = 0;
//#2
//Run = 1;
//Continue = 1;
//
//#5
//SW = 10'b0000000110;
//#5 Run = 0;
//#5 Run = 1;
//#100 SW = 10'b1111111111;
//
//#5 Continue = 0;
//#2 Continue = 1;

//// test 3
//Run = 0;
//Continue = 0;
//#2
//Run = 1;
//Continue = 1;
//
//#5
//SW = 10'b0000001011;
//#5 Run = 0;
//#5 Run = 1;
//#75 SW = 10'b0000000001;
//
//#5 Continue = 0;
//#2 Continue = 1;
//
//#5 Continue = 0;
//#2 Continue = 1;

//// test 4
//Run = 0;
//Continue = 0;
//#2
//Run = 1;
//Continue = 1;
//
//#5
//SW = 10'h14;
//#5 Run = 0;
//#5 Run = 1;
//#75 SW = 10'b0101010101;
//
//#5 Continue = 0;
//#2 Continue = 1;
//#50 SW = 10'b1010101010;
//#5 Continue = 0;
//#2 Continue = 1;

//// test 5
//Run = 0;
//Continue = 0;
//#2
//Run = 1;
//Continue = 1;
//
//#5
//SW = 10'h0031;
//#5 Run = 0;
//#5 Run = 1;
//#200 SW = 10'b0000000010;
//
//#5 Continue = 0;
//#2 Continue = 1;
//#150 SW = 10'b0000000010;
//#5 Continue = 0;
//#2 Continue = 1;
//#150 SW = 10'b0000000001;

//// test 6
Run = 0;
Continue = 0;
#2
Run = 1;
Continue = 1;

#5
SW = 10'h005A;
#5 Run = 0;
#5 Run = 1;
#500 SW = 10'b0000000010;

#5 Continue = 0;
#2 Continue = 1;
#50000 SW = 10'b0000000011;
#20 Continue = 0;
#5 Continue = 1;

#5000 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;
#2500 Continue = 0;
#2500 Continue = 1;

end

endmodule
