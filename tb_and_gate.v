module tb_and_gate;

    reg a,b;
    wire y;

    //Design Under Test (DUT)
    and_gate dut (
        .a(a),
        .b(b),
        .y(y)

    );

    initial begin
        $dumpfile("and_gate.vcd");
        $dumpvars(0, tb_and_gate);

        //Test 1: 0 AND 0
        a = 0; b = 0;
        #10;
        if (y!== 0) $fatal(1,"Test 1 failed");

        //Test 2: 0 AND 1
        a = 0; b = 1;
        #10;
        if (y!== 0) $fatal(1, "Test 2 failed");

        //Test 3: 1 and 0
        a = 1; b = 0;
        #10;
        if (y!== 0) $fatal(1, "Test 3 failed");

        //Test 4: 1 and 1
        a = 1; b = 1;
        #10;
        $display("A = %b, B = %b, Y = %b", a, b,y);
        if (y!== 1'b1) $fatal(1, "Test 4 failed");

        $display("All tests passed!");
        $finish;
    end
endmodule