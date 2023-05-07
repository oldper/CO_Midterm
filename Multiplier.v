`timescale 1ns/1ns
module Multiplier( clk, dataA, dataB, Signal, dataOut, reset );
input clk ;
input reset ;
input [63:0] dataA ; // Multiplicant
input [31:0] dataB ; // Multiplier
input [5:0] Signal ;
output [63:0] dataOut ;

//   Signal ( 6-bits )
//   MULT  : 25

reg [63:0] temp ;
reg [63:0] reg_dataA;
reg [31:0] reg_dataB;
reg [5:0] counter;
parameter MULT = 6'b011001;

always@( posedge clk or reset )
begin
        if ( reset )
        begin
                temp = 64'b0 ;
				reg_dataA <= dataA;
				reg_dataB <= dataB;
        end

        else
        begin
			if ( counter < 32 ) begin
				if ( reg_dataB[0] ) 
				begin
					temp <= temp + reg_dataA;
				end

				reg_dataA <= reg_dataA << 1;
				reg_dataB <= reg_dataB >> 1;
			end
			counter <= counter + 1;
        end


end
assign dataOut = temp ;


endmodule