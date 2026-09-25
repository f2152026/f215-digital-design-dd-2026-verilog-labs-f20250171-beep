module tb;

  reg [3:0] t_a;
  reg [3:0] t_b;
  reg       t_op;
  wire [3:0] t_result;

  alu dut (
    .a(t_a),
    .b(t_b),
    .op(t_op),
    .result(t_result)
  );

  initial begin
    // ADD tests
    t_op = 0;
    t_a = 4'd3;  t_b = 4'd2;
    #5;
    if (t_result !== 4'd5)
      $display("FAIL ADD: 3 + 2 = %d", t_result);
    else
      $display("PASS ADD: 3 + 2");

    t_a = 4'd7;  t_b = 4'd4;
    #5;
    if (t_result !== 4'd11)
      $display("FAIL ADD: 7 + 4 = %d", t_result);
    else
      $display("PASS ADD: 7 + 4");

    // SUB tests
    t_op = 1;
    t_a = 4'd7;  t_b = 4'd3;
    #5;
    if (t_result !== 4'd4)
      $display("FAIL SUB: 7 - 3 = %d", t_result);
    else
      $display("PASS SUB: 7 - 3");

    t_a = 4'd3;  t_b = 4'd7;
    #5;
    if (t_result !== 4'd12)
      $display("FAIL SUB: 3 - 7 = %d", t_result);
    else
      $display("PASS SUB: 3 - 7");

    // Sensitivity-list test: change op only
    t_a = 4'd9;
    t_b = 4'd2;
    t_op = 0;
    #5;

    t_op = 1;
    #5;

    if (t_result !== 4'd7)
      $display("FAIL OP CHANGE: expected 7, got %d", t_result);
    else
      $display("PASS OP CHANGE");

    $finish;
  end

endmodule