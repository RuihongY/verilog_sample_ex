//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /*
 This is the implementation of a frequency divider

Ruihong Yin
 26/8/2022
 */
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 // even 6 diverder
 // old version
 module diverder6 (
    input logic clk_in,
    input logic reset_n,
    input logic clk_out
 );
 logic [1:0] cnt; // only need counter up to 2
 // count from 0 to 2
 always_ff @(posedge clk_in, negedge reset_n) begin
    if(!reset_n)
        cnt <= 2'b0;
    else if (cnt == 2'd2)
        cnt <= 2'b0;
    else
        cnt <= cnt + 1'b1;
 end
 always_ff @(posedge clk_in, negedge reset_n) begin
    if (!reset_n)
        clk_out <= 1'b0;
    else if (cnt == 2'd2)
        clk_out = ~clk_in;
 end
 endmodule

 // new version better
 module diverder6_new(
    input logic clk_in,
    input logic reset_n,
    input logic clk_flag
 );
logic [2:0] cnt;
// count from 0 to 5
always_ff@(posedge clk_in, negedge reset_n) begin
    if (!reset_n)
        cnt <= 3'd0;
    else if (cnt == 3'd5)
        cnt <= 3'd0;
    else
        cnt <= cnt + 1'b1;
end
always_ff@(posedge clk_in, negedge reset_n) begin
    if(!reset_n)
        clk_flag <= 1'b0;
    else if (cnt == 3'd4)
        clk_flag = 1'b1;
    else
        clk_flag = 1'b0;
end
endmodule

// odd 5 diverder
// old version use pose and nedge and logic AND clk_out = clk1 & clk2

 module diverder5_new(
    input logic clk_in,
    input logic reset_n,
    input logic clk_flag
 );
logic [2:0] cnt;
// count from 0 to 4
always_ff@(posedge clk_in, negedge reset_n) begin
    if (!reset_n)
        cnt <= 3'd0;
    else if (cnt == 3'd4)
        cnt <= 3'd0;
    else
        cnt <= cnt + 1'b1;
end
always_ff@(posedge clk_in, negedge reset_n) begin
    if(!reset_n)
        clk_flag <= 1'b0;
    else if (cnt == 3'd3)
        clk_flag = 1'b1;
    else
        clk_flag = 1'b0;
end
endmodule