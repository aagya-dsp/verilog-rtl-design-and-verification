
module tb_nand_gate;

    reg a, b;
    wire y;
    reg expected;
    reg [3:0] coverage;

    integer i;
    integer errors;
    integer covered;

    nand_gate dut (
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        errors = 0;
        covered = 0;
        coverage = 4'b0000;

        $dumpfile("nand_gate.vcd");
        $dumpvars(0, tb_nand_gate);

        // Test all four input combinations
        for (i = 0; i < 4; i = i + 1) begin

             {a, b} = i;
            #10;

            // Independent reference model
            case ({a, b})
                2'b00: expected = 1'b1;
                2'b01: expected = 1'b1;
                2'b10: expected = 1'b1;
                2'b11: expected = 1'b0;
            endcase

            // Count tested combinations
            coverage[{a,b}] = 1'b1;

            // Compare actual and expected outputs
            if (y !== expected) begin
                $display("FAIL: A=%b B=%b Y=%b Expected=%b",
                        a, b, y, expected);
                errors = errors + 1;
            end
            else begin
                $display("PASS: A=%b B=%b Y=%b",
                    a, b, y);
            end
        end

        covered = 0;
        for (i = 0; i < 4; i = i+1) begin
            if (covered[i] == 1'b1)
            covered = covered + 1;
        end

        
        // Display coverage and verification results
        $display("---------------------------");
        $display("Input combinations tested: %0d / 4", covered);
        $display("Input coverage: %0d%%", (covered * 100) / 4);

        if (errors == 0)
            $display("ALL NAND TESTS PASSED!");
        else
            $display("TEST FAILED: %0d errors", errors);

        $finish;
    end

endmodule