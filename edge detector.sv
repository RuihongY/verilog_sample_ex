//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /*
 This is the implementation of a edge detector

Ruihong Yin
 26/8/2022
 */
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 // rising edge
 module rise(
    input logic clk,
    input logic rst_n,
    input logic data,
    output logic rise
 );
    logic D_reg;
    always_ff@(posedge clk, negedge rst_n) begin
        if(~rst_n)
            D_reg <= 1'b0;
        else
            D_reg <= data;
    end
    always_ff@(posedge clk, negedge rst_n) begin
        if(!rst_n)
            rise<=1'b0;
        else if
            rise <= data==1'b1 && D_reg==1'b0;
        else
            rise <= 1'b0;
    end
    endmodule

// falling edge
 module fall(
    input logic clk,
    input logic rst_n,
    input logic data,
    output logic rise
 );
    logic D_reg;
    always_ff@(posedge clk, negedge rst_n) begin
        if(~rst_n)
            D_reg <= 1'b0;
        else
            D_reg <= data;
    end
    always_ff@(posedge clk, negedge rst_n) begin
        if(!rst_n)
            rise<=1'b0;
        else if
            rise <= data==1'b0 && D_reg==1'b1;
        else
            rise <= 1'b0;
    end
    endmodule


