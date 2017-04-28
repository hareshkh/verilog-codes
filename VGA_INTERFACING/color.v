`timescale 1ns / 1ps

module vga(clk, hs, vs, r, g, b, rb, gb, bb);
input clk, rb, gb, bb;
output reg hs, vs, r, g, b;

integer hp = 10'd0;
integer vp = 10'd0;
reg c = 1'b0;

always @(posedge clk) begin
		c <= !c;
end
always @(posedge c)
begin
		if (vp == 527) begin
			vp = 0;
		end
		else begin
			if (hp == 808) begin
				hp = 0;
				vp = vp + 1;
			end
			else begin
				hp = hp +1; 
			end
		end
		if (hp> 664 && hp< 760) 
		begin
			hs=1'b0;
		end
		else begin
			hs=1'b1;
		end

		if (vp> 482 && vp< 484)
		begin
			vs = 1'b0;
		end
		else begin
			vs = 1'b1;
		end

		if ( hp > 0 && hp < 600 && vp > 0 && vp < 400 )
		begin
			if (rb) begin
				r =1'b1; 
				g =1'b0;
				b =1'b0;
			end
			else if (gb) begin
				r =1'b0; 
				g =1'b1;
				b =1'b0;
			end
			else if (bb) begin
				r =1'b0; 
				g =1'b0;
				b =1'b1;
			end
			else begin
				r =1'b0; 
				g =1'b0;
				b =1'b0;
			end
		end
		else
 		begin
			r =1'b0; 
			g =1'b0;
			b =1'b0;
		end
	end
endmodule
//////////////////////////////////////////////////////////////////////////////////
