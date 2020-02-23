// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps

module ifetch(
    output wire [31:0] IF_ID_instr,
    output wire [31:0] IF_ID_npc,
    input wire EX_MEM_PCSrc,
    input wire [31:0] EX_MEM_NPC
    );

wire [31:0] PC;
wire [31:0] dataout;
wire [31:0] npc, npc_mux;

    mux mux1 (.npc(npc_mux) ,
              .s0(EX_MEM_NPC),
              .s1(npc),
              .select(EX_MEM_PCSrc));

    pc_mod pc_mod1 (.PC(PC),
                    .npc(npc_mux));

    mem mem1 (.data(dataout),
                    .addr(PC));

    fetch_latch fetch_latch1 (.instrout(IF_ID_instr),
                  .npcout(IF_ID_npc),
                  .instr(dataout),
                  .npc(npc));

    add add1 (.pc_out(npc),
              .pc_in(PC));

    initial begin
        $display("Time\t PC\t npc\t dataout of MEM\t IF_ID_instr\t IF_ID_npc");
        $monitor("%0d\t %0d\t %0d\t %h\t %h\t %0d", $time, PC, npc, dataout,IF_ID_instr,IF_ID_npc);
        #20 $finish;
    end

endmodule // ifetch
