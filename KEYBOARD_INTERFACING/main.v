`timescale 1ns / 1ps

module main(clk, ps2_clk, ps2_data, sf_e, e, rs, rw, d, c, b, a);
	 
input clk, ps2_clk, ps2_data;
(* LOC = "D16" *) output sf_e;
(* LOC = "M18" *) output e;
(* LOC = "L18" *) output rs;
(* LOC = "L17" *) output rw;
(* LOC = "M15" *) output d;
(* LOC = "P17" *) output c;
(* LOC = "R16" *) output b;
(* LOC = "R15" *) output a;

wire [7:0] data_keyb;
reg [3:0] number;
keyboard keyboard_data(
	.clk(ps2_clk),
	.data(ps2_data),
	.led(data_keyb)
	);

always @ (posedge clk) begin
	case (data_keyb)
		8'h16: number <= 4'b0001;
		8'h1E: number <= 4'b0010;
		8'h26: number <= 4'b0011;
		8'h25: number <= 4'b0100;
		8'h2E: number <= 4'b0101;
		8'h36: number <= 4'b0110;
		8'h3D: number <= 4'b0111;
		8'h3E: number <= 4'b1000;
		8'h46: number <= 4'b1001;
		8'h45: number <= 4'b0000;
		default: number <= 4'b0000;
	endcase
end

display display_data(number, clk, sf_e, e, rs, rw, d, c, b, a);
	
endmodule
