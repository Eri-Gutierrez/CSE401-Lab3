// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps

module control (
    input wire [5:0] opcode,
	output reg	[3:0] EX,
    output reg	[2:0] M,
    output reg	[1:0] WB
    );

	parameter RTYPE	= 6'b000000;
	parameter LW = 6'b100011;
	parameter SW = 6'b101011;
	parameter BEQ = 6'b000100;
	parameter NOP = 6'b100000;


	initial
	 begin
		 /*
		     We assign decimal representation of 0 to our outpur REG's here.
		     Note the difference
		 */
		EX <= 4'b0000;
		M <= 3'b000;
		WB <= 2'b00;
	end

	/* Assign the don't cares (X) to high impedence (Z)...
	   For design correctness and more proper MIPS emulation
	*/
	always@* begin
		case (opcode)
			RTYPE:
			begin
				EX <= 4'b1100; /* Note use of non-blocking  operator ( <= ) versus blocking  operator( = ) */
				M  <= 3'b000;
				WB <= 2'b10;
			end
			/* Assign remaining values according to chart in Lab Manuel.
		     Either paramterize it, or hardcode at as is done for RTYPE.
		  */
			LW:
			begin
				EX <= 4'b0001;
				M <= 3'b010;
				WB <= 2'b11;
			end
			SW:
			  begin
                EX <= 4'bz001;
				M  <= 3'b001;
				WB <= 2'b0z;

			  end
			BEQ:
			begin
				EX <= 4'bz010;
				M  <= 3'b100;
				WB <= 2'b0z;
			end

			NOP: //Not in Lab Manual, but needed to make life easier for final implementation
			begin
				EX <= 4'b1000;  //replicating operator
				M <= 3'b000;
				WB <= 2'b00;
			end
			default:	$display ("Opcode not recognized.");
		endcase
	end

endmodule	//control
