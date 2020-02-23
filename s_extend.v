// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps

module s_extend (
    input wire [15:0] nextend,
    output reg	[31:0] extend
    );

	always@ *
	  begin
		// Replicate signed bit 16 times then cancatinate
            extend <= {{16{nextend[15]}}, nextend[15:0]};
		end

endmodule //s_extend
