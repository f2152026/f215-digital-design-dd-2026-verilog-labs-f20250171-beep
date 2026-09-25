module tb;

  reg  [1:0] A;
  reg  [1:0] B;
  wire GT;
  wire LT;
  wire EQ;

  comp2 dut (
    .A(A),
    .B(B),
    .GT(GT),
    .LT(LT),
    .EQ(EQ)
  );

  integer i;
  integer j;

  initial begin
    for (i = 0; i < 4; i = i + 1) begin
      for (j = 0; j < 4; j = j + 1) begin
        A = i;
        B = j;
        #1;

        if ((GT !== (i > j)) ||
            (LT !== (i < j)) ||
            (EQ !== (i == j))) begin
          $display("FAIL: A=%d B=%d | GT=%b LT=%b EQ=%b",
                   A, B, GT, LT, EQ);
        end
        else begin
          $display("PASS: A=%d B=%d", A, B);
        end
      end
    end

    $finish;
  end

endmodule