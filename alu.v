// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps
/* alu.v  */

module alu(
    input	wire	[31:0]	a,
    input	wire	[31:0]	b,
    input	wire	[2:0]		control,
    output	reg	[31:0]	result,
    output	wire				zero
    );

	parameter	ALUadd		= 3'b010,	// Get these values from
				ALUsub 		= 3'b110, // Figure 3.2 in Lab Manual
				ALUand 		= 3'b000,
				ALUor 		= 3'b001,
				ALUslt 		= 3'b111;



	// Handles negative inputs
	wire sign_mismatch;
	assign sign_mismatch = a[31] ^ b[31];

	initial
		result <= 0;

	always@*
		case(control)
			ALUadd:			result = a + b;
			ALUsub:			result = a - b;
			ALUand:			result = a && b;
			ALUor:			result = a || b;
			ALUslt:			result = a < b	? 1 - sign_mismatch
														: 0 + sign_mismatch;
			default:			result = 32'bX;	// control = ALUx | *
		endcase

		assign zero = (result==0) ? 1'b1 : 1'b0; /*check to see if result is equal to zero. if it is assign it true (1). if it isn't assign it false (0)
		Complete this line using a turnary operator. If you don't know what that is then Google it.
		P.S. I tabbed all of these lines, so you might want to delete these comments after you implement this line or
		replace the tabs with white space for when you import this into your LaTeX write up.
		*/

endmodule	//alu

//If the input information does not correspond to any valid instruction,
//aluop = 2'b11 which sets control = ALUx = 3'b011
//and ALU output is 32 x's as required by lab manual.
