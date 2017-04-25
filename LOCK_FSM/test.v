`timescale 1ns / 1ps

module test;

	// Inputs
	reg rst;
	reg one;
	reg zero;
	reg st;

	// Outputs
	wire op;

	// Instantiate the Unit Under Test (UUT)
	sequence_detector uut (
		.rst(rst), 
		.one(one), 
		.zero(zero), 
		.op(op),
		.st(st)
	);

	initial begin
		// Initialize Inputs
		rst = 0;
		one = 0;
		zero = 0;
		st = 0;

		// Wait 100 ns for global reset to finish
		#100;
			#50 rst=1; #50 rst=0;
			#100 zero=1; #50 zero=0; #50 st=1; #50 st=0;
			#100 one=1;#50 one=0; #50 st=1; #50 st=0;
			#100 one=1; #50 one=0; #50 st=1; #50 st=0;
			#100 zero=1; #50 zero=0; #50 st=1; #50 st=0;
			#100 zero=1;#50 zero=0; #50 st=1; #50 st=0;
			#100 one=1; #50 one=0; #50 st=1; #50 st=0;
			//#30 rst=1;
			#50 rst=1; #50 rst=0;
			#100 one=1; #50 one=0; #50 st=1; #50 st=0;
			#100 zero=1;#50 zero=0; #50 st=1; #50 st=0;
			#100 zero=1;#50 zero=0; #50 st=1; #50 st=0;
			#100 one=1; #50 one=0; #50 st=1; #50 st=0;
			#100 zero=1;#50 zero=0; #50 st=1; #50 st=0;
			#100 one=1; #50 one=0; #50 st=1; #50 st=0;
			
			//#5 rst=1; #5 rst=0;
			#100 zero=1; #50 zero=0; #50 st=1; #50 st=0;
			#100 one=1;#50 one=0; #50 st=1; #50 st=0;
			#100 one=1; #50 one=0; #50 st=1; #50 st=0;
			#100 zero=1; #50 zero=0; #50 st=1; #50 st=0;
			#100 zero=1;#50 zero=0; #50 st=1; #50 st=0;
			#100 one=1; #50 one=0; #50 st=1; #50 st=0;
		// Add stimulus here

	end
      
endmodule

