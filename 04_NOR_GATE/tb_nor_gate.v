module tb_nor_gate;

    reg a,b;
    wire y;

    reg expected;
    integer errors;
    reg [3:0] coverage;
    integer covered;
    integer i;

    //Device under test
    nor_gate dut(
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin

        coverage = 4'b0000;
        covered = 0;
        errors = 0;

        //generate waveform 
        $dumpfile("nor_gate.vcd");
        $dumpvars(0,tb_nor_gate);
        
        //test case 1:
        a = 0;
        b = 0;
        #10;

        coverage[{a,b}] = 1'b1;

        case({a,b})
            2'b00: expected = 1'b1;
            2'b01: expected = 1'b0;
            2'b10: expected = 1'b0;
            2'b11: expected = 1'b0;
        endcase

        if (y!== expected) begin
            $display("FAIL: A = %b B = %b Y = %b Expected = %b",a,b,y,expected);
            
            errors = errors + 1;
        end

        else begin
            $display("PASS: A = %b B = %b Y = %b",a,b,y);
        end


        //test case 2:
        a = 0;
        b = 1;
        #10;
        coverage[{a,b}] = 1'b0;

        case({a,b})
            2'b00: expected = 1'b1;
            2'b01: expected = 1'b0;
            2'b10: expected = 1'b0;
            2'b11: expected = 1'b0;
        endcase

        if (y!== expected) begin
            $display("FAIL: A = %b B = %b Y = %b Expected = %b",a,b,y,expected);

            errors = errors + 1;
        end

        else begin
            $display("PASS: A = %b B = %b Y = %b",a,b,y);
        end

        //test case 3:
        a = 1;
        b = 0;
        #10;
        coverage[{a,b}] = 1'b0;

        case({a,b})
            2'b00: expected = 1'b1;
            2'b01: expected = 1'b0;
            2'b10: expected = 1'b0;
            2'b11: expected = 1'b0;
        endcase

        if (y!== expected) begin
            $display("FAIL: A = %b B = %b Y = %b Expected = %b",a,b,y,expected);

            errors = errors + 1;
        end

        else begin
            $display("A = %b B = %b Y = %b",a,b,y);
        end

        //test case 4:
        a = 1;
        b = 1;
        #10;
        coverage[{a,b}] = 1'b0;
        case({a,b})
            2'b00: expected = 1'b1;
            2'b01: expected = 1'b0;
            2'b10: expected = 1'b0;
            2'b11: expected = 1'b0;
        endcase

        if (y!== expected) begin
            $display("FAIL: A = %b B = %b Y = %b Expected = %b",a,b,y,expected);

            errors = errors + 1;
        end
        else begin
            $display("A = %b B = %b Y = %b",a,b,y);
        end

        covered = 0;

        for (i = 0; i<4; i = i+1) begin
            if (coverage[i] == 1'b1)
                covered = covered + 1;
        end


        $display("--------------------");
        $display("Total test cases:4");
        $display("Errors: %0d",errors);

        if (errors == 0 && covered == 4)
            $display("ALL NOR TESTS PASSED!");
        else
            $display("TEST FAILED: %0d errors",errors);
        $finish;
    end
endmodule