`timescale 1ns / 1ps

module sequence_detector(
		input clk,
		input zero,
		input one,
		input reset,
		output unlock
    );

	// Instantiating state register
	reg [2:0] state;
	initial state = 3'b000;
		
	parameter A = 3'b000; 
	parameter B	= 3'b001;
	parameter C	= 3'b010; 
	parameter D	= 3'b011; 
	parameter E	= 3'b100; 
	parameter F	= 3'b101;	
	parameter G = 3'b110;
	
	// Assigning output
	assign unlock = (state == G);
	
	// State machine
	always @(posedge clk)
	begin
	
		// Normal operation
		case(state)
		A : if(zero)
				state = B;
		B : if(one)
				state = C;
		C : begin 
				if(one)
					state = D;
				if(zero)
					state = B;
			 end
		D : begin
				if(zero)
					state = E;
				if(one)
					state = A;
			 end
		E : begin
				if(zero)
					state = F;
				if(one)
					state = C;
			 end
		F : begin 
				if(one)
					state = G;
				if(zero)
					state = B;
			 end
		G : state = G;
		default: state = A;
		endcase
		
		// Handling reset
		if (reset)
			state = A;
	end

endmodule