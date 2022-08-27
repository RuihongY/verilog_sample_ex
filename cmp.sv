module cmp(
    input logic [3:0] A,
    input logic [3:0] B,
    output logic LA, // A>B
    output logic LB, // B>A
    output logic S //A=B
);

assign LA = (A[3] > B[3]) || (A[3] == B[3] && A[2] > B[2]) || (A[3] == B[3] && A[2] == B[2] && A[1] > B[1]) ||  (A[3] == B[3] && A[2] == B[2] && A[1] == A[1] && A[0] > B[0]);
assign LB = (B[3] > A[3]) || (B[3] == A[3] && B[2] > A[2]) || (B[3] == A[3] && B[2] == A[2] && B[1] > A[1]) ||  (A[3] == B[3] && A[2] == B[2] && A[1] == A[1] && B[0] > A[0]);
assign S = !LA && !LB;
endmodule
