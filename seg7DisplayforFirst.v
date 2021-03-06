module seg7DisplayforFirst
(
	input [1:0] Value,
	output reg [6:0] Display
);

always@(Value)
		case(Value)
			2'b11: Display[6:0] = 7'b0010010;//S
			2'b01: Display[6:0] = 7'b0001001;//H
			2'b10: Display[6:0] = 7'b1000110;//C
			default: Display[6:0] = 7'b1111111; // OFf
		endcase	
		
endmodule
