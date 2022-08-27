//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /*
 This is the implementation of a squence detector 011XXX110

Ruihong Yin
 27/8/2022
 */
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 // using shift register
 module sequence_detect(
    input logic clk,
    input logic rst_n,
    input logic data,
    output logic match
 );

 logic [8:0] data_reg;
 always_ff@(posedge clk, negedge rst_n) begin
    if(!rst_n)
        data_reg <= 9'b0;
    else
        data_reg <= {data_reg[7:0],data};
 end
 always_ff@(posedge clk, negedge rst_n) begin
    if(!rst_n) 
        match <= 1'b0;
    else 
        match <= (data_reg[2:0]==3'b110) && (data_reg[8:6]==3'b011);
 end
 endmodule