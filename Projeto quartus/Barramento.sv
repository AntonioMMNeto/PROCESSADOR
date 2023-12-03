module Barramento(io_0,io_1,io_2,io_3,io_4,io_5,ctrl_0,ctrl_1,ctrl_2,ctrl_3,ctrl_4,ctrl_5);

parameter Largura_barramento=8;

inout wire [Largura_barramento-1:0]io_0,io_1,io_2,io_3,io_4,io_5;
input wire ctrl_0,ctrl_1,ctrl_2,ctrl_3,ctrl_4,ctrl_5;

wire [Largura_barramento-1:0] barramento; 

genvar x;
generate 
	for(x = 0; x < Largura_barramento;x = x + 1)
		begin:bf
		//bufif1  ctrl_i0  (barramento[x],io_0[x],ctrl_0);
		bufif1  ctrl_i1  (barramento[x],io_1[x],ctrl_1);
		bufif1  ctrl_i2  (barramento[x],io_2[x],ctrl_2);
		bufif1  ctrl_i3  (barramento[x],io_3[x],ctrl_3);
		bufif1  ctrl_i4  (barramento[x],io_4[x],ctrl_4);
		bufif1  ctrl_i5  (barramento[x],io_5[x],ctrl_5);
		end
endgenerate
assign barramento = (ctrl_0) ? io_0: 8'bz;

endmodule