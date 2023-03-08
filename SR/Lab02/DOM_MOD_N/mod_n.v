module counter_mod_n #(
    parameter N = 8,
    parameter WIDTH = $clog2(N)
) (
    output [WIDTH-1:0] o_cnt,
    input clk,
    input rst,
    input en
);

reg [WIDTH-1:0] cnt = 0;
assign o_cnt = cnt;

always @(posedge clk) begin
    if(rst)
        cnt <= 0;
    else begin
        if(en) begin
            cnt <= cnt +1;
            if(cnt == (N-1))
                cnt <= 0;
        end
    end
end 
    
endmodule