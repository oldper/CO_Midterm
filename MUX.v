`timescale 1ns/1ns
module MUX( ALUOut, HiOut, LoOut, Shifter, Signal, dataOut );
input [31:0] ALUOut ;
input [31:0] HiOut ;
input [31:0] LoOut ;
input [31:0] Shifter ;
input [5:0] Signal ;
output [31:0] dataOut ;


reg [31:0] temp ;

parameter AND = 6'b100100;
parameter OR  = 6'b100101;
parameter ADD = 6'b100000;
parameter SUB = 6'b100010;
parameter SLT = 6'b101010;

parameter SRL = 6'b000010;

parameter MULT= 6'b011001;
parameter MFHI= 6'b010000;
parameter MFLO= 6'b010010;

always@( ALUOut or HiOut or LoOut or Shifter or Signal )
begin
	if ( Signal[5] ) begin
		temp <= ALUOut;
	end

	else begin
		if ( Signal[4] ) begin
			if ( !Signal[3] ) begin
				if ( Signal[1] ) begin
					temp <= HiOut;
				end
				else begin
					temp <= LoOut;
				end
			end
		end

		else begin
			temp <= Shifter;
		end
	end

end
assign dataOut = temp ;

endmodule