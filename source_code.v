module magnitude_comparator(
    input [3:0] A,
    input [3:0] B,
    output A_greater_B,
    output A_equal_B,
    output A_less_B
);

wire x3, x2, x1, x0;
wire A0GB0, A1GB1, A2GB2, A3GB3;
wire A0LB0, A1LB1, A2LB2, A3LB3;

assign x3 = ~(A[3] ^ B[3]);
assign x2 = ~(A[2] ^ B[2]);
assign x1 = ~(A[1] ^ B[1]);
assign x0 = ~(A[0] ^ B[0]);

assign A0GB0 = A[0] & ~B[0];
assign A1GB1 = A[1] & ~B[1];
assign A2GB2 = A[2] & ~B[2];
assign A3GB3 = A[3] & ~B[3];

assign A0LB0 = ~A[0] & B[0];
assign A1LB1 = ~A[1] & B[1];
assign A2LB2 = ~A[2] & B[2];
assign A3LB3 = ~A[3] & B[3];

assign A_equal_B = x3 & x2 & x1 & x0;

assign A_greater_B = A3GB3 |
                     (x3 & A2GB2) |
                     (x3 & x2 & A1GB1) |
                     (x3 & x2 & x1 & A0GB0);

assign A_less_B = A3LB3 |
                  (x3 & A2LB2) |
                  (x3 & x2 & A1LB1) |
                  (x3 & x2 & x1 & A0LB0);

endmodule