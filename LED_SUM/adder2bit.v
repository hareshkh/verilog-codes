`timescale 1ns / 1ps

module adder2bit(
	input [1:0]a,
	input [1:0]b,
	input cin,
	output [1:0]sum,
	output cout
    );

	wire c_temp;
	
	fulladder f0(a[0], b[0], cin, sum[0], c_temp);
	fulladder f1(a[1], b[1], c_temp, sum[1], cout);
	

endmodule
