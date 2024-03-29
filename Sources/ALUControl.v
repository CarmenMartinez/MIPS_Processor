/******************************************************************
* Description
*	This is the control unit for the ALU. It receves an signal called 
*	ALUOp from the control unit and a signal called ALUFunction from
*	the intrctuion field named function.
* Version:
*	1.0
* Author:
*	Dr. José Luis Pizano Escalante
* email:
*	luispizano@iteso.mx
* Date:
*	01/03/2014
******************************************************************/
module ALUControl
(
	input [2:0] ALUOp,
	input [5:0] ALUFunction,
	output [3:0] ALUOperation

);

localparam R_Type_AND     = 9'b111_100100;
localparam R_Type_OR      = 9'b111_100101;
localparam R_Type_NOR     = 9'b111_100111;
localparam R_Type_ADD     = 9'b111_100000;
localparam R_Type_MULPlus = 9'b111_100110;
localparam R_Type_MOV	  = 9'b111_100001;
localparam I_Type_ADDI    = 9'b100_xxxxxx;
localparam I_Type_ORI     = 9'b101_xxxxxx;
localparam BEQ_AND_BNE    = 9'b001_xxxxxx;
localparam I_TYPE_INC	  = 9'b010_xxxxxx;

reg [3:0] ALUControlValues;
wire [8:0] Selector;

assign Selector = {ALUOp,ALUFunction};

always@(Selector)begin
	casex(Selector)
		R_Type_AND:    ALUControlValues = 4'b0000;
		R_Type_OR: 		ALUControlValues = 4'b0001;
		R_Type_NOR:    ALUControlValues = 4'b0010;
		R_Type_ADD:    ALUControlValues = 4'b0011;
		R_Type_MULPlus:ALUControlValues = 4'b0110;
		R_Type_MOV:		ALUControlValues = 4'b0111;
		I_Type_ADDI:   ALUControlValues = 4'b0011;
		I_Type_ORI:    ALUControlValues = 4'b0001;
		BEQ_AND_BNE:   ALUControlValues = 4'b0100;
		I_TYPE_INC:		ALUControlValues = 4'b0101;
		
		default: ALUControlValues = 4'b1001;
	endcase
end


assign ALUOperation = ALUControlValues;

endmodule