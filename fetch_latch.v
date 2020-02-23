// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps

module fetch_latch(
    output reg [31:0] instrout, npcout,
    input wire [31:0] instr, npc
);

initial begin
   instrout <= 0;
   npcout   <= 0;
end

always @* begin
   #1 instrout <= instr;
        npcout <= npc;
end

endmodule   //fetch_latch
