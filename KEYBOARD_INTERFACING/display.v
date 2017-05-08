`timescale 1ns / 1ps

module display(number, clk, sf_e, e, rs, rw, d, c, b, a);
input clk;
input [3:0] number;
output reg sf_e; 
output reg e; 
output reg rs;
output reg rw;
output reg d;	
output reg c;	
output reg b;	
output reg a;	

reg [26:0] count = 0;	
reg [5:0] code;	
reg refresh;	

always @ (posedge clk) begin
count <= count + 1;

case (count [26:21])	
0: code <= 6'h03;	
1: code <= 6'h03;	
2: code <= 6'h03;	
3: code <= 6'h02;	
4: code <= 6'h02; 
5: code <= 6'h08; 
6: code <= 6'h00; 
7: code <= 6'h06; 
8: code <= 6'h00; 
9: code <= 6'h0C; 
10: code <= 6'h00;
11: code <= 6'h01;
12:	
   code<=6'h23;
	
13:
	case (number[3:0])
		0: code<=6'h20;
		1: code<=6'h21;
		2: code<=6'h22;
		3: code<=6'h23;
		4: code<=6'h24;
		5: code<=6'h25;
		6: code<=6'h26;
		7: code<=6'h27;
		8: code<=6'h28;
		9: code<=6'h29;
	endcase
 
default: code <= 6'h10;  
endcase 
refresh <= count[ 20 ];  
sf_e <= 1; e <= refresh; 
rs <= code[5]; rw <= code[4]; 
d <= code[3]; c <= code[2]; 
b <= code[1]; a <= code[0]; 
end 

endmodule

