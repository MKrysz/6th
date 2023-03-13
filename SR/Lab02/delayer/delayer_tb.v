`timescale 1ns / 100ps
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
    

delayer #(.DELAY(0), .N(8)) uut0 (.i_data(i_data), .o_data(o_data0), .clk(clk), .ce(ce));
delayer #(.DELAY(1), .N(8)) uut1 (.i_data(i_data), .o_data(o_data1), .clk(clk), .ce(ce));
delayer #(.DELAY(2), .N(8)) uut2 (.i_data(i_data), .o_data(o_data2), .clk(clk), .ce(ce));
delayer #(.DELAY(3), .N(8)) uut3 (.i_data(i_data), .o_data(o_data3), .clk(clk), .ce(ce));

reg clk = 1'b0;
reg [7:0] i_data = 8'h55;
wire [7:0] o_data0;
wire [7:0] o_data1;
wire [7:0] o_data2;
wire [7:0] o_data3;
reg ce = 1'b0;

initial begin
    $dumpfile("delayer_tb.vcd");
    $dumpvars;
    #9 ce<=1'b1;
    #100 $finish;
end

always 
begin
    #1; clk <= ~clk;    
end

endmodule
