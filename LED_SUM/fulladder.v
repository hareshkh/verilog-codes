`timescale 1ns / 1ps

module fulladder(
	input a,
	input b,
	input cin,
	output sum,
	output cout
    );
	 
	 wire sum1, c1, c2;
	 
	 halfadder h1(a,b,sum1,c1);
	 halfadder h2(sum1,cin,sum,c2);
	 assign cout = c1|c2;


endmodule
