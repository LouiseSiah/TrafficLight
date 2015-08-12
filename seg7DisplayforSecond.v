module seg7DisplayforSecond
(
	input [1:0] Value,
	output reg [6:0] Display
);

//assign Display [6:0] = Value ? 7'b0101111: 7'b0001111;

always@(Value)
		case(Value)
			2'b10: Display[6:0] = 7'b0000111;//t
			2'b11: Display[6:0] = 7'b0101111;//r
			default: Display[6:0] = 7'b1111111; // OFf
		endcase	
		
endmodule
