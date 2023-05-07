module mux_2to1(Z, A, B, S);

input A, B, S;
output Z;

wire a_select, b_select;

wire not_s;

// S: 0 => output: A
// S: 1 => output: B
not not1(not_s, S);
and and1(a_select, A, not_s);
and and2(b_select, B, S);
or or1(b_select, a_select);

endmodule