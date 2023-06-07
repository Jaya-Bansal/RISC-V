module control_unit(
    input [11:0] imm,
    input [2:0] funct3,
    input [6:0] opcode,
    output reg [3:0] alu_control_signal, // for alu 
    output reg regwrite_control_signal
);
    always @(funct3 or imm or opcode)
    begin
        if (opcode == 7'b0110011) begin // I-type instructions

            regwrite_control_signal = 1;
            case (funct3)
                0: begin
                    if(imm == 0)
                    alu_control_signal = 4'b0000; // ADDI
                    else if(imm == 32)
                    alu_control_signal = 4'b0010; // SUBI
                end
                1: alu_control_signal = 4'b0001; // SLLI
//             2: alu_control_signal = 4'b0111; // MULI
//                3: begin
//					if(imm == 8)
//                    alu_control_signal = 4'b1010; //lr.d
//                    else if (funct7 == 12)
//                    alu_control_signal = 4'b1100; //sc.d
//				end
				4: alu_control_signal = 4'b0100; // XORI
				5: alu_control_signal = 4'b0101; // SRLI
                6: alu_control_signal = 4'b0110; // ORI
                7: alu_control_signal = 4'b0111; // ANDI
				
            endcase

      end

    end
    endmodule
