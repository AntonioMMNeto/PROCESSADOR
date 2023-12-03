module Barramento(io_0,io_1,io_2,io_3,io_4,io_5,ctrl_0,ctrl_1,ctrl_2,ctrl_3,ctrl_4,ctrl_5,clk);

parameter Largura_barramento=8;

inout wire [Largura_barramento-1:0]io_0,io_1,io_2,io_3,io_4,io_5;
input wire [1:0] ctrl_0,ctrl_1,ctrl_2,ctrl_3,ctrl_4,ctrl_5; //bit 0 ler; bit 1 escrever
input wire clk;

wire [Largura_barramento-1:0] barramentoW; 
wire [Largura_barramento-1:0] barramentoR; 

genvar x;
generate 
	for(x = 0; x < Largura_barramento;x = x + 1)
		begin:bf
		bufif1  ctrl_i0  (barramentoW[x],io_0[x],ctrl_0[1]);
		bufif1  ctrl_i1  (barramentoW[x],io_1[x],ctrl_1[1]);
		bufif1  ctrl_i2  (barramentoW[x],io_2[x],ctrl_2[1]);
		bufif1  ctrl_i3  (barramentoW[x],io_3[x],ctrl_3[1]);
		bufif1  ctrl_i4  (barramentoW[x],io_4[x],ctrl_4[1]);
		bufif1  ctrl_i5  (barramentoW[x],io_5[x],ctrl_5[1]);
		
		
		bufif1  ctrl_i01  (barramentoR[x],io_0[x],ctrl_0[0]);
		bufif1  ctrl_i11  (barramentoR[x],io_1[x],ctrl_1[0]);
		bufif1  ctrl_i21  (barramentoR[x],io_2[x],ctrl_2[0]);
		bufif1  ctrl_i31  (barramentoR[x],io_3[x],ctrl_3[0]);
		bufif1  ctrl_i41  (barramentoR[x],io_4[x],ctrl_4[0]);
		bufif1  ctrl_i51  (barramentoR[x],io_5[x],ctrl_5[0]);
		end
endgenerate

always @(clk)
begin
	case (ctrl_0)
		2'b01 :io_0<=barramentoR;
		2'b10 :barramentoW<=io_0;
		default :io_0<= 8'bz;
	endcase
	case (ctrl_1)
		2'b01 :io_1<=barramentoR;
		2'b10 :barramentoW<=io_1;
		default :io_1<=8'bz;
	endcase
	case (ctrl_2)
		2'b01 :io_2<=barramentoR;
		2'b10 :barramentoW<=io_2;
		default :io_2<=8'bz;
	endcase
	case (ctrl_3)
		2'b01 :io_3<=barramentoR;
		2'b10 :barramentoW<=io_3;
		default :io_3<=8'bz;
	endcase
	case (ctrl_4)
		2'b01 :io_4<=barramentoR;
		2'b10 :barramentoW<=io_4;
		default :io_4<=8'bz;
	endcase
	case (ctrl_5)
		2'b01 :io_5<=barramentoR;
		2'b10 :barramentoW<=io_5;
		default :io_5<=8'bz;
	endcase
end

endmodule