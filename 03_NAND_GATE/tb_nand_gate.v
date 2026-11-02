module tb_nand_gate;

    reg a,b;
    wire y;

    integer i;
    integer errors;

    nand_gate dut(
        .a(a),
        .b(b),
        .y(y)
    );

    initial begin
        errors = 0;

        $dumpfile("nand_gate.vcd");
        $dumpvars(0,tb_nand_gate);
        for (i = 0; i<4; i = i+1) begin
            {a,b} = i;
            #10;

            if (y !== ~(a & b)) begin
                $display("FAIL: A = %b B = %b Y = %b", a, b, y);
                errors = errors + 1;
            end
            
            else begin
                $display("PASS: A = %b B = %b Y = %b", a, b, y);
            end
        end

        if (errors == 0)
            $display("All NAND TEST PASSED!");
        else
            $display("TEST FAILED; %0d errors", errors);

        $finish;

        $dumpfile("nand_gate.vcd");
        $dumpvars(0,tb_nand_gate);
    end
endmodule