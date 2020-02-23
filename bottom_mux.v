// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps

module bottom_mux (
    output	wire	[4:0]	y,		// Output of Multiplexer
	input	wire	[4:0]	a,		// Input 1 of Multiplexer
							b,		// Input 0 of Multiplexer
    input	wire	        sel // Select Input
);

    assign	y = sel ? a : b;

endmodule   //bottom_mux
