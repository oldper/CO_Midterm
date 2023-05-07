`include "full_adder.v"

module alu_1bit(A, B, C, Less ,Signal, Sum, Cout);

//   Signal ( 6-bits)?
//   AND  : 36  100100
//   OR   : 37  100101
//   ADD  : 32  100000 
//   SUB  : 34  100010
//   SLT  : 42  101010

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

input A, B, C, Less;
input [5:0] Signal;
output Cout;
output Sum;


wire binvert;
assign binvert = Signal[1];
wire S_AND, C_AND;
wire S_OR, C_OR;
wire S_FA, C_FA;
wire B_FA;
and and1(S_AND, A, B);
or or1(S_OR, A, B);

xor xor1(B_FA, B, binvert);
full_adder fa( S_FA, C_FA, A, B, C);

assign Cout = Signal[2] ? 1'b0 : C_FA;
assign Sum = Signal[3] ? Less : Signal[2] ? ( Signal[0]? S_OR : S_AND) : S_FA;
endmodule