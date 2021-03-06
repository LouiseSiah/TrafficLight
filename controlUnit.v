module controlUnit
(
	input CLOCK_50, reset,
	input x, // sensor X
	input counterNotZero, counterNotFive,	
	output reg load, twentyToLoad,
	output wire [2:0] stateD, //LED
	output reg [1:0] displaySignal, hwy, cntry
);

parameter Crgo = 2'b00, Hrgo = 2'b01, Timer = 2'b10, Stop = 2'b11;
parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100, s2a = 3'b101, s2b = 3'b110;
parameter G = 2'b00, Y = 2'b01, R = 2'b10; 
reg [2:0] n_state, state;

assign stateD = state;


always@(posedge CLOCK_50, negedge reset) //clock and reset
	if(!reset)
		state <= s0;
	else
		state <= n_state;
		

always@(state, counterNotZero, counterNotFive, x)
begin
	case(state)
	s0: if(x)
			n_state = s1;
		else
			n_state = s0;
	s1:	if (counterNotZero)
			n_state = s1;
		else
			n_state = s2;
	s2: n_state = s2a;
   s2a: if (counterNotFive)
			n_state = s2a;
		else
			n_state = s2b;
   s2b: if (counterNotZero)
			n_state = s2b;
		else
			n_state = s3;
	s3: if(x)
			n_state = s3;
		else
			n_state = s4;
	s4: if (counterNotZero)
			n_state = s4;
		else
			n_state = s0;
	default: n_state = s0;
	endcase
end

always@(state)
begin
	case(state)
	s0: begin displaySignal = Hrgo;	 hwy = G; cntry = R; load = 1; twentyToLoad = 0; end
	s1: begin displaySignal = Timer; hwy = Y; cntry = R; load = 0; twentyToLoad = 0; end
	s2: begin displaySignal = Timer; hwy = R; cntry = R; load = 1; twentyToLoad = 1; end
   s2a: begin displaySignal = Timer; hwy = R; cntry = R; load = 0; twentyToLoad = 1; end
   s2b: begin displaySignal = Stop;	 hwy = R; cntry = R; load = 0; twentyToLoad = 0; end
	s3: begin displaySignal = Crgo;	 hwy = R; cntry = G; load = 1; twentyToLoad = 0; end
	s4: begin displaySignal = Timer; hwy = R; cntry = Y; load = 0; twentyToLoad = 0; end
	endcase
end
endmodule

