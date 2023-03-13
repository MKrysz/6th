`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2023 02:01:15 PM
// Design Name: 
// Module Name: delayer
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


module delayer#(
    parameter N = 8,
    parameter DELAY = 4
)(
    input clk,
    input ce,
    input [N-1:0] i_data,
    output [N-1:0] o_data
    );

integer i;

generate

if(DELAY == 0) begin
    assign o_data = i_data;
end else begin
    reg [N-1:0] temp [DELAY:0];
    assign o_data = temp[DELAY];
    always @(posedge clk) begin
        if(ce==1)begin
            temp[0] <= i_data;
            for(i = 0; i<DELAY; i = i+1) begin
                    temp[i+1] <= temp[i];
            end
        end
    end
end

endgenerate

endmodule
