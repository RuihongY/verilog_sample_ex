//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 /*
 This is the implementation of a squence detector. 1101

Ruihong Yin
 26/8/2022
 */
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
 
module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    typedef enum logic[2:0] {S0,S1,S2,S3,S4} state_t;
    state_t state, next_state;
    
    always_ff@(posedge clk) begin
        if (reset) 
            state <= S0;
        else
            state <= next_state;
    end
    
	always_comb begin
        case(state)
            S0: begin
                if(data == 1)
                    next_state = S1;
            	else
                    next_state = S0;
            end
            S1: begin
                if(data == 1)
                    next_state = S2;
            	else
                    next_state = S0;
            end
            S2: begin
                if(data == 0)
                    next_state = S3;
            	else
                    next_state = S2;
            end
            S3: begin
                if(data == 1)
                    next_state = S4;
            	else
                    next_state = S0;
            end
            /*
            S4: begin
                if(data == 1)
                    next_state = S2;
                else
                    next_state = S0;
            end */
            S4: 
                next_state = S4;
            default:
                next_state = S0;
        endcase
    end
    assign start_shifting = (state == S4) ? 1'b1:1'b0;        

endmodule