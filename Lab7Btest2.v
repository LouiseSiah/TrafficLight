module Lab7B
(
	input CLOCK_50,
	input [0:0]KEY, 
	input [9:9]SW,
	output wire [7:0]LEDG,
	output [6:0] HEX0, HEX1, HEX2, HEX3
);

assign LEDR = SW;
wire [1:0] displaySignal;
wire load, twentyToLoad, counterNotZero, counterNotFive;
//
//module dataPath (CLOCK_50, reset, load, //edge-level 
//				 [1:0] displaySignal,
//				 twentyToLoad,
//		 OUTPUT   
//				 counterNotZero, counterNotFive,	
//				
//				[6:0]HEX0, HEX1, HEX2, HEX3
//				);

dataPath TEST (CLOCK_50, KEY[0], load, //edge-level //load as edge level
			   displaySignal,
			   twentyToLoad,
			
			   counterNotZero, counterNotFive,
			   
			   HEX0, HEX1, HEX2, HEX3
);

//module controlUnit (	input CLOCK_50, reset,
//						input x, // sensor X
//						input counterNotZero, counterNotFive,	
//						output reg load, twentyToLoad,
//						output reg [2:0] state, //LED
//						output reg [1:0] displaySignal, hwy, cntry
//					);

controlUnit integ (CLOCK_50, KEY[0],
					SW[9:9], // sensor X
					counterNotZero, counterNotFive,	
					load, twentyToLoad,
					LEDG[2:0], //STATE
					displaySignal, LEDG[7:6], LEDG[5:4]
);


endmodule
