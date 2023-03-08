`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2023 02:40:55 PM
// Design Name: 
// Module Name: delayer_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`include "delayer.v"

module delayer_tb();
    
localparam DELAY = 4;
localparam N = 8;

delayer #(.DELAY(DELAY), .N(N)) uut (.i_data(i_data), .o_data(o_data), .clk(clk), .ce(ce));

reg clk = 1'b0;
reg [N-1:0] i_data = 8'h55;
wire [N-1:0] o_data;
reg ce = 1'b1;

initial begin
    $dumpfile("delayer_tb.vcd");
    $dumpvars;
    #100 $finish;
end

always 
begin
    #1; clk <= ~clk;    
end

endmodule
