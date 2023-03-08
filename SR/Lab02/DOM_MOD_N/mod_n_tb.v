`timescale 1ps/1ps
`include "mod_n.v"

module testbench ();

reg clk = 0;
reg rst = 0;
reg en = 0;
wire [2:0] cnt1;
wire [7:0] cnt2; 

counter_mod_n #(.N(8)) uut1(
    .clk(clk),
    .rst(rst),
    .en(en),
    .o_cnt(cnt1)
);

counter_mod_n #(.N(250)) uut2(
    .clk(clk),
    .rst(rst),
    .en(en),
    .o_cnt(cnt2)
);

initial begin
    $dumpfile("mod_n_tb.vcd");
    $dumpvars();
    #20 en<=1;
    #10 rst<=1;
    #4  rst<=0;
    #1000 $finish();
end

always begin
    #1 clk <= ~clk;
end

endmodule