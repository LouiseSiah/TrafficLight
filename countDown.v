module countDown
(
	input myClock, reset, load, //edge-level //count as edge level
	input [1:0]tensValue,
	output wire counterNotZero, counterNotFive,	
	output reg [3:0] unitDigit,
	output reg [1:0]tensDigit
);

assign counterNotZero = (unitDigit == 0 && tensDigit == 0)? 1'b0: 1'b1;
assign counterNotFive = (unitDigit == 5 && tensDigit == 0)? 1'b0: 1'b1;

always@(posedge myClock, negedge reset, posedge load)
	if(!reset)
	begin
		unitDigit <= 0;
		tensDigit <= 0;
	end
	else
		if(load)
			begin
			unitDigit <= 0;
			tensDigit <= tensValue;
			end
		else
			begin
			if(unitDigit > 0)
				unitDigit <= unitDigit - 1;
			else
				if(tensDigit > 0)
					begin
					unitDigit <= 9;
					tensDigit <= tensDigit - 1;
					end
				else
					begin
					tensDigit <= tensDigit;
					unitDigit <= unitDigit;
					end
			end
endmodule

