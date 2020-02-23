// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270


`timescale 1ns / 1ps
/* alu_control.v */

module alu_control(
    input	wire	[5:0]	funct,
    input	wire	[1:0]	aluop,
    output	reg	[2:0]	select
    );


	parameter		Rtype 		=	2'b10,	//this is a 2 bit paramter,
					//These are the function field paramters for Rtype. Use Fig 3.2 to complete
					Radd 		= 	6'b100000,
					Rsub 		= 	6'b100010,
					Rand 		= 	6'b100100,
					Ror			= 	6'b100101,
					Rslt		= 	6'b101010;

	parameter	lwsw			=	2'b00,		//since LW and SW use the same bit pattern, only way to store them as a paramter
				Itype			=	2'b01,		// beq
				xis				=	6'bXXXXXX;


	parameter	ALUadd			=	3'b010,
				ALUsub			=	3'b110,
				ALUand			=	3'b000,
				ALUor			=	3'b001,
				ALUslt			=	3'b111;

	parameter	unknown			=	2'b11,
				ALUx			=	3'b011;

	initial
		select <= 0;

	always@* begin

		if (aluop == Rtype)
		 begin
			case(funct)
			   //assign the correct select value baesd on the function field.
				//Use Fig 3.2 to aid you in this.
				Radd:    select <= ALUadd;
				Rsub:    select <= ALUsub;
				Rand:    select <= ALUand;
				Ror:     select <= ALUor;
				Rslt:    select <= ALUslt;
				default: select <= ALUx;
			endcase
	    end

		//For all Other Types. Use figure 3.2 to help you out.
		//Feel free to reuse any of the paramters defined aove.

		else if (aluop == lwsw)
      begin
			select <= ALUadd;
		end

		else if (aluop == Itype)
      begin
			select <= ALUsub;
		end

		else if (aluop == unknown)
	    begin
   		select <= ALUx;
		end
		// Redundant for completness
		else
		 begin
			select <= select;
	    end
	end

endmodule	//alu_control

//If the input information does not correspond to any valid instruction,
//aluop = 2'b11 which sets control = ALUx = 3'b011
//and ALU output is 32 x's as required by lab manual.
