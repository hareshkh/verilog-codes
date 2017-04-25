`timescale 1ns / 1ps
module main(
	input one,
	input zero, 
	input unlatch,
	input reset,
	input clk,
	output unlock
    );

	// Instatiating latch_state register
	// 0 : Accepts inputs
	// 1 : Blocks inputs
	reg latch_state;
	initial latch_state = 1'b0;
	
	wire kl_one = (latch_state) ? 1'b0 : one;
	wire kl_zero = (latch_state) ? 1'b0 : ((one) ? 1'b0 : zero);
	
	sequence_detector sd(
		.clk(clk),
		.one(kl_one),
		.zero(kl_zero),
		.reset(reset),
		.unlock(unlock)
		);
	
	always @(posedge clk)
	begin
		if (~latch_state && (one || zero))
			latch_state = 1'b1;
		
		if (latch_state && unlatch)
			latch_state = 1'b0;
	end
endmodule