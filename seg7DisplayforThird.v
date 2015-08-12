module seg7DisplayforThird
(
	input [2:0] Value,
	output reg [6:0] Display
);

always@(Value)
		case(Value)
			3'b000: Display[6:0] = 7'b1000000; //0
			3'b001: Display[6:0] = 7'b1111001; //1
			3'b010: Display[6:0] = 7'b0100100; //2
			3'b011: Display[6:0] = 7'b0010000; //g
			default: Display[6:0] = 7'b1111111; // OFf
		endcase	
		
endmodule
