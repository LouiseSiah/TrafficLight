module seg7DisplayforLast
(
	input [3:0] Value,
	output reg [6:0] Display
);

always@(Value)
		case(Value)
			4'b0000: Display[6:0] = 7'b1000000; //0
			4'b0001: Display[6:0] = 7'b1111001; //1
			4'b0010: Display[6:0] = 7'b0100100; //2
			4'b0011: Display[6:0] = 7'b0110000; //3
			4'b0100: Display[6:0] = 7'b0011001; //4
			4'b0101: Display[6:0] = 7'b0010010; //5
			4'b0110: Display[6:0] = 7'b0000010; //6
			4'b0111: Display[6:0] = 7'b1111000; //7
			4'b1000: Display[6:0] = 7'b0000000; //8
			4'b1001: Display[6:0] = 7'b0011000; //9
			4'b1010: Display[6:0] = 7'b0001100; //P
			default: Display[6:0] = 7'b1111111; // OFf
		endcase	
		
endmodule
