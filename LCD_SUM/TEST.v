//****************LCD_SPARTAN_3E***************//
`timescale 1ns / 1ps

module TestLCD(A1,A2,B1,B2,cin,sum,clk, sf_e, e, rs, rw, d, c, b, a);
(* LOC = "L13" *)   input A1;
(* LOC = "L14" *)   input A2;
(* LOC = "H18" *)   input B1;
(* LOC = "N17" *)   input B2;

(* LOC = "D18" *)	input cin;
	output [2:0]sum;
	wire ci;
	
	FA f0(A1,B1,cin,sum[0],ci);
	FA f1(A2,B2,ci,sum[1],sum[2]);

(* LOC = "C9" *) input clk; 
(* LOC = "D16" *) output reg sf_e; 
(* LOC = "M18" *) output reg e; 
(* LOC = "L18" *) output reg rs;
(* LOC = "L17" *) output reg rw;
(* LOC = "M15" *) output reg d;	
(* LOC = "P17" *) output reg c;	
(* LOC = "R16" *) output reg b;	
(* LOC = "R15" *) output reg a;	

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
   case ( sum[2:0])
	0: code<=6'h20;
	1: code<=6'h21;
	2: code<=6'h22;
	3: code<=6'h23;
	4: code<=6'h24;
	5: code<=6'h25;
	6: code<=6'h26;
	7: code<=6'h27;
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


module HA(
	input a,
	input b,
	output sum
	);
	
	assign sum = a^b;

endmodule

module FA(
	input a,
	input b,
	input cin,
	output sum,
	output cout
	);
	
	wire i1;
	
	HA h0(a,b,i1);
	HA h1(i1,cin,sum);
	assign cout = (a&b) | (b&cin) | (a&cin);

endmodule

