// Course: CSE 401- Computer Architecture
// Term: Winter 2020
// Name: Erika Gutierrez
// ID: 005318270

`timescale 1ns / 1ps

module add(
    input wire [31:0] pc_in,
    output wire [31:0] pc_out
    );

assign pc_out = pc_in + 1;

endmodule   //add
