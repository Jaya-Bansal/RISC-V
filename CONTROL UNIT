module CONTROL(
    input [6:0] funct7,        // 7-bit input representing the funct7 field
    input [2:0] funct3,        // 3-bit input representing the funct3 field
    input [6:0] opcode,        // 7-bit input representing the opcode field
    output reg [3:0] alu_control,       // 4-bit output controlling the ALU operation
    output reg regwrite_control        // Output controlling the register write operation
);
    always @(funct3 or funct7 or opcode)
    begin
        if (opcode == 7'b0110011) begin // R-type instructions

            regwrite_control = 1;       // Enable register write

            case (funct3)
                0: begin
                    if (funct7 == 0)
                        alu_control = 4'b0010; // ALU control for ADD operation
                    else if (funct7 == 32)
                        alu_control = 4'b0100; // ALU control for SUB operation
                end
                6: alu_control = 4'b0001; // ALU control for OR operation
                7: alu_control = 4'b0000; // ALU control for AND operation
                1: alu_control = 4'b0011; // ALU control for SLL operation (Shift Left Logical)
                5: alu_control = 4'b0101; // ALU control for SRL operation (Shift Right Logical)
				2: alu_control = 4'b0110; // ALU control for MUL operation
				4: alu_control = 4'b0111; // ALU control for XOR operation
            endcase

        end
    end
endmodule






