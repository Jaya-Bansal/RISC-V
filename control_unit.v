`timescale 1ns / 1ps

// Control unit code for register type instructions
module control_unit_R(
    input [6:0] funct7,
    input [2:0] funct3,
    input [6:0] opcode,
    output reg [3:0] alu_control_signal, // for alu 
    output reg regwrite_control_signal
);
    always @(funct3 or funct7 or opcode)
    begin
        case (opcode)
        7'b0110011: begin // R-type instructions

            regwrite_control_signal = 1;
            case (funct3)
                0: begin
                    if(funct7 == 0)
                    alu_control_signal = 4'b0010; // ADD
                    else if(funct7 == 32)
                    alu_control_signal = 4'b0100; // SUB
                end
                1: alu_control_signal = 4'b0011; // SLL
                2: alu_control_signal = 4'b0110; // MUL
		4: alu_control_signal = 4'b0111; // XOR
		5: alu_control_signal = 4'b0101; // SRL
                6: alu_control_signal = 4'b0001; // OR
                7: alu_control_signal = 4'b0000; // AND
				
            endcase
            end
endcase

    end
    endmodule

// control unit code for immediate type instructions
module control_unit_I(
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
                2: alu_control_signal = 4'b0111; // MULI
                3: begin
			if(imm == 8)	alu_control_signal = 4'b1010; //lr.d
                   	else if (funct7 == 12)	alu_control_signal = 4'b1100; //sc.d
			end
		4: alu_control_signal = 4'b0100; // XORI
		5: alu_control_signal = 4'b0101; // SRLI
                6: alu_control_signal = 4'b0110; // ORI
                7: alu_control_signal = 4'b0111; // ANDI
				
            endcase

      end

    end
    endmodule
// Load, Store and Branch instructions
module write_to_reg(
    input [6:0] op,          // 7-bit opcode input
    input [2:0] funct3,     // 3-bit function code input
    input [31:0] daddr,     // 32-bit destination address input
    input [31:0] drdata,    // 32-bit data read from memory input    
    output reg [31:0] out    // 32-bit output register data
);
    reg [31:0] offset;       // 32-bit offset register for load instructions

    always @(*) begin
        if (op == 7'b0000011)   // If it is a load instruction
           offset = (daddr[1:0] << 3);   // Calculate the offset: 8 * rv1[1:0] - 1
            case (funct3)
                3'b000: out = {{24{drdata[offset + 7]}}, drdata[offset +: 8]};   // LB : Load Byte
                3'b001: out = {{16{drdata[offset + 15]}}, drdata[offset +: 16]}; // LH : Load Halfword
                3'b010: out = drdata;   // LW : Load Word
            endcase
        end
    end
endmodule

// For branch type instructions
module Branch_type(
    input [2:0] funct3,              // 3-bit function code input
    input [31:0] iaddr,              // 32-bit instruction address input
    input signed [31:0] imm,         // 32-bit signed immediate input
    input signed [31:0] in1, in2,    // 32-bit signed inputs
    output reg [31:0] out,           // 32-bit output for the new PC value
    output reg jump_flag             // Jump flag indicating whether to take the branch or not
);
    wire [31:0] tmp1, tmp2;
    assign tmp1 = in1;
    assign tmp2 = in2;

    always @(*) begin
        case (funct3)
            3'b000:   // BEQ - Branch if Equal
                begin
                    out = (in1 == in2) ? (imm - 12) : 0;
                    jump_flag = (in1 == in2) ? 1 : 0;
                end
            3'b001:   // BNE - Branch if Not Equal
                begin
                    out = (in1 != in2) ? (imm - 12) : 0;
                    jump_flag = (in1 != in2) ? 1 : 0;
                end
            3'b100:   // BLT - Branch if Less Than
                begin
                    out = (in1 < in2) ? (imm - 12) : 0;
                    jump_flag = (in1 < in2) ? 1 : 0;
                end
            3'b101:   // BGE - Branch if Greater Than or Equal
                begin
                    out = (in1 >= in2) ? (imm - 12) : 0;
                    jump_flag = (in1 >= in2) ? 1 : 0;
                end
        endcase
    end
endmodule



