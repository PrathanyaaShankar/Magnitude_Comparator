module tb_magnitude_comparator;

reg [3:0] A;
reg [3:0] B;

wire A_greater_B;
wire A_equal_B;
wire A_less_B;

magnitude_comparator uut (
    .A(A),
    .B(B),
    .A_greater_B(A_greater_B),
    .A_equal_B(A_equal_B),
    .A_less_B(A_less_B)
);

initial begin

    A = 4'b0000; B = 4'b0000; #10; // A = 0, B = 0
    A = 4'b0001; B = 4'b0000; #10; // A = 1, B = 0
    A = 4'b0000; B = 4'b0001; #10; // A = 0, B = 1
    A = 4'b1001; B = 4'b1001; #10; // A = 9, B = 9
    A = 4'b0011; B = 4'b0111; #10; // A = 3, B = 7
    A = 4'b0101; B = 4'b0101; #10; // A = 5, B = 5

    $finish;

end

endmodule
