module tb_or_gate;

    reg a,b;
    wire y;

    //Instantiate the OR or_gate
    or_gate dut(
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        $dumpfile("or_gate.vcd");
        $dumpvars(0, tb_or_gate);

        //Test 1: 0 OR 0 = 0
        a = 0 ; b = 0;
        #10;
        if (y !== 1'b0) $fatal(1,"Test 1 failed");

        //Test 2: 0 OR 1 = 1
        a = 0 ; b = 1;
        #10;
        if (y !== 1'b1) $fatal(1,"Test 2 failed");

        //Test 3: 1 OR 0 = 1
        a = 1 ; b = 0;
        #10;
        if (y !== 1'b1) $fatal(1,"Test 3 failed");

        //Test 1: 1 OR 1 = 1
        a = 1 ; b = 1;
        #10;
        if (y !== 1'b1) $fatal(1,"Test 4 failed");

        $display("All OR GATE TESTS PASSED!");
        $finish;
    end
    
endmodule