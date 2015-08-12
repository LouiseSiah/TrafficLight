module dataPath//dATAPATH
(
	input CLOCK_50, reset, load,//edge-level //load as edge level
	input [1:0] displaySignal,
	input twentyToLoad, 
	output wire counterNotZero, counterNotFive,	
	//output wire [1:0] hwy, cntry,
	output [6:0] HEX0, HEX1, HEX2, HEX3
);

//reg enF2;
oneSecClock clock (CLOCK_50, reset, myClock); 
countDown counter (myClock, reset, load, tensValue, counterNotZero, counterNotFive, unitDigit, tensDigit);
seg7DisplayforFirst leftHEX (displayChosen1, HEX3); 
seg7DisplayforSecond secHEX (displayChosen2, HEX2);
seg7DisplayforThird thirdHEX (displayChosen3, HEX1);
seg7DisplayforLast rightHEX (displayChosen4, HEX0);

parameter Stop = 2'b11, Hrgo = 2'b01, Crgo = 2'b00, Timer = 2'b10;
parameter H = 2'b01, S = 2'b11, C = 2'b10;
parameter t = 2'b10, r = 2'b11;
parameter g = 3'b011;
parameter p = 4'b1010;

wire [1:0]tensDigit;
wire [1:0]tensValue;
wire [3:0]unitDigit;
reg [1:0]displayChosen1;// wire [1:0]signalToDecoder1;
reg [1:0]displayChosen2;// wire [1:0]signalToDecoder2;
reg	[2:0]displayChosen3;// wire [2:0]signalToDecoder3;
reg [3:0]displayChosen4;// wire [3:0]signalToDecoder4;


//input direct to output
//assign hwy = hwySignal;
//assign cntry = cntrySignal;

//Multiplexer
assign tensValue = twentyToLoad ? 2'b10: 2'b01;

always@(posedge myClock)
begin
	case(displaySignal)
		Stop: begin
			 // enF2 <= 1;
			  if(unitDigit == 5 || unitDigit == 3 || unitDigit == 1)
				begin
				displayChosen1 = S;
				displayChosen2 = t;
				displayChosen3 = 0;
				displayChosen4 = p;
				end
			  else 
				begin
				displayChosen1 = 2'b00;  //off
				displayChosen2 = 2'b00;  //off
				displayChosen3 = 3'b111; //off
				displayChosen4 = 4'b1111;//off
				end
			  end
		Hrgo: begin
	         // enF2 <= 1;
			  displayChosen1 = H;
	    	  displayChosen2 = r;
			  displayChosen3 = g;
			  displayChosen4 = 0;
			  end
       Crgo : begin
			  //enF2 <= 1;
			  displayChosen1 = C;
	    	  displayChosen2 = r;
			  displayChosen3 = g;
			  displayChosen4 = 0;
			  end
	   Timer: begin
			  displayChosen1 = 2'b00;
	    	  displayChosen2 = 2'b00;
			  //enF2 <= 0;
			  displayChosen3 = tensDigit;
			  displayChosen4 = unitDigit;
			  end
	endcase
end

//assign signalToDecoder1 = {2{enF2}} & displayChosen1;
//assign signalToDecoder2 = {2{enF2}} & displayChosen2;
//assign signalToDecoder3 = displayChosen3;
//assign signalToDecoder4 = displayChosen4;


endmodule

